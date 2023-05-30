ADS = audioDatastore("C:\Users\hp\Desktop\matlabtest\dataset4","IncludeSubfolders",true,"LabelSource","foldernames");
labelTable = countEachLabel(ADS);
classes = labelTable.Label;
numClasses = size(labelTable,1);
[adsTrain,adsValidation] = splitEachLabel(ADS,0.8,0.2);

overlapPercentage = 75;

[trainFeatures,trainLabels] = helperAudioPreprocess(adsTrain,overlapPercentage);
[validationFeatures,validationLabels,segmentsPerFile] = helperAudioPreprocess(adsValidation,overlapPercentage);

% visualizing random data
numImages = 9;
idxSubset = randi(numel(trainLabels),1,numImages);
viewingAngle = [90 -90];
% showing random data wiith labels
figure
tiledlayout("flow",TileSpacing="compact");
for i = 1:numImages
    img = trainFeatures(:,:,:,idxSubset(i));
    label = trainLabels(idxSubset(i));
    nexttile
    surf(img,EdgeColor="none")
    view(viewingAngle)
    title("Class: " + string(label),interpreter="none")
end
colormap parula


%vggish layers
% miniBatchSize = 128;
% pretrainedNetwork = vggish;
% 
% lgraph = layerGraph(pretrainedNetwork.Layers);
% lgraph = removeLayers(lgraph,"regressionoutput");
% lgraph.Layers(end);
% lgraph = addLayers(lgraph,fullyConnectedLayer(numClasses,Name="FCFinal"));
% lgraph = addLayers(lgraph,softmaxLayer(Name="softmax"));
% lgraph = addLayers(lgraph,classificationLayer(Name="classOut"));
% lgraph = connectLayers(lgraph,"EmbeddingBatch","FCFinal");
% lgraph = connectLayers(lgraph,"FCFinal","softmax");
% lgraph = connectLayers(lgraph,"softmax","classOut");
% 
% options = trainingOptions("adam", ...
%     MaxEpochs=5, ...
%     MiniBatchSize=miniBatchSize, ...
%     InitialLearnRate = 0.001, ...
%     LearnRateSchedule="piecewise", ...
%     LearnRateDropPeriod=2, ...
%     LearnRateDropFactor=0.5, ...
%     ExecutionEnvironment="cpu",...
%     ValidationData={validationFeatures,validationLabels}, ...
%     ValidationFrequency = 50, ...
%     Shuffle="every-epoch");


% %OpenL3 layers
% miniBatchSize = 32;
% image_size = horzcat(96,64,1);
% pretrainedNetwork = openl3;
% lgraph = layerGraph(pretrainedNetwork.Layers);
% lgraph = removeLayers(lgraph,"out");
% lgraph.Layers(end);
% lgraph = replaceLayer(lgraph,"in",imageInputLayer(image_size,Name="in"));
% lgraph = addLayers(lgraph,fullyConnectedLayer(numClasses,Name="FCFinal"));
% lgraph = addLayers(lgraph,softmaxLayer(Name="softmax"));
% lgraph = addLayers(lgraph,classificationLayer(Name="classOut"));
% lgraph = connectLayers(lgraph,"flatten","FCFinal");
% lgraph = connectLayers(lgraph,"FCFinal","softmax");
% lgraph = connectLayers(lgraph,"softmax","classOut");
% 
% options = trainingOptions("adam", ...
%     MaxEpochs=5, ...
%     MiniBatchSize=miniBatchSize, ...
%     InitialLearnRate = 0.001, ...
%     LearnRateSchedule="piecewise", ...
%     LearnRateDropPeriod=2, ...
%     LearnRateDropFactor=0.5, ...
%     ValidationData={validationFeatures,validationLabels}, ...
%     ValidationFrequency=50, ...
%     Shuffle="every-epoch");


% %yamnet layers
% miniBatchSize = 32;
% pretrainedNetwork = yamnet;
% lgraph = layerGraph(pretrainedNetwork.Layers);
% lgraph = removeLayers(lgraph,"Sound");
% lgraph.Layers(end);
% lgraph = addLayers(lgraph,classificationLayer(Name="classOut",Classes=classes));
% lgraph = replaceLayer(lgraph,"dense",fullyConnectedLayer(numClasses,Name="dense"));
% lgraph = connectLayers(lgraph,"softmax","classOut");
% 
% options = trainingOptions("adam", ...
%     MaxEpochs=5, ...
%     MiniBatchSize=miniBatchSize, ...
%     InitialLearnRate = 0.001, ...
%     LearnRateSchedule="piecewise", ...
%     LearnRateDropPeriod=2, ...
%     LearnRateDropFactor=0.5, ...
%     ValidationData={validationFeatures,validationLabels}, ...
%     ValidationFrequency=50, ...
%     Shuffle="every-epoch");


%training the network
[net,netInfo] = trainNetwork(trainFeatures,trainLabels,lgraph,options);

%testing the network
[validationPredictions,validationScores] = classify(net,validationFeatures);

%getting the accuracy value
idx = 1;
validationPredictionsPerFile = categorical;
for ii = 1:numel(adsValidation.Files)
    validationPredictionsPerFile(ii,1) = mode(validationPredictions(idx:idx+segmentsPerFile(ii)-1));
    idx = idx + segmentsPerFile(ii);
end
accuracy = mean(validationPredictionsPerFile==adsValidation.Labels)*100;

%random data with predicted and true labels
numImages = 9;
idxSubset = randi(numel(validationLabels),1,numImages);
viewingAngle = [90 -90];


figure
t1 = tiledlayout("flow",TileSpacing="compact");
for i = 1:numImages
    img = validationFeatures(:,:,:,idxSubset(i));
    YPred = validationPredictions(idxSubset(i));
    YTrue = validationLabels(idxSubset(i));

    nexttile
    surf(img,EdgeColor="none")
    view(viewingAngle)
    title({"True: " + string(YTrue),"Predicted: " + string(YPred)},interpreter= "none")
end

% confusion chart
colormap parula
figure(Units="normalized",Position=[0.2 0.2 0.5 0.5]);
confusionchart(adsValidation.Labels,validationPredictionsPerFile, ...
    Title=sprintf("Confusion Matrix for Validation Data \nAccuracy = %0.2f %%",mean(validationPredictionsPerFile==adsValidation.Labels)*100), ...
    ColumnSummary="column-normalized", ...
    RowSummary="row-normalized")

