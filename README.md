# musictype

Türkçe:

Makine Öğrenmesi ile Müzik Türü Algılaması 
Müzik türleri, müzik parçalarını ayırabileceğimiz (caz, klasik, rock gibi)  sözcüklere verilen adlardır. Bu projedeki amacım müzik tarzlarını ayırabilecek CNN networkler arasında karşılaştırma yapmaktır. Eğitim aşamasında CNN algoritmasında daha önceden ses dosyaları ayırmak için kullanılan önceden eğitilmiş VGGish, YAMNet ve OpenL3 algoritmalarını deneyip bunlardan alınan sonuçlara göre katman ayarını ve sırasını ayarlayarak sadece bu iş için özelleştirilmiş bir ağ çıkarılacaktır.

Dataset linki: https://drive.google.com/file/d/1zdf4mZuDYfKAXY_rJXv_GA498bc3LAFQ/view?usp=sharing

Kullanılan ağlar: https://drive.google.com/file/d/1pwaFVv98MsfQw7D3RhroAph4vme2iRMQ/view?usp=sharing

README: 

Kodun çalışması için ilk önce kullanılan ağlar kısımındaki dosyaları current folder a atarak 
ağların directory de gözükmesini sağlamanız gerekmektedir.Dataset boyutu çok büyük olduğundan sadece 
kullanılan kısım drive a yüklenmiştir. Dosya indikten sonra zipten ayıkladığınız dosyanın yolunu kopyalayarak
1. satırdaki audioDatastore fonksiyonu içerisindeki yere koplayarsanız kod çalışacaktır. 
Kullanılan ağlar kısımındaki dosyaları current folder a atarak ağların directory de gözükmesini 
sağlamanız gerekmektedir. Kontrol etmek istediğiniz kod bölümünü uncommentleyerek ve daha önce 
kullandığınız kod kısımlarını commentleyerek (OpenL3, VGGish ve YAMNet kısımları) çalıştırabilrisiniz.

English:
 
"Music Genre Classification with Machine Learning

Music genres are names given to categorize music tracks (such as jazz, classical, rock). The goal of this project is to compare CNN networks that can differentiate between music genres. During the training phase, pre-trained algorithms VGGish, YAMNet, and OpenL3, which were previously used to separate audio files in the CNN algorithm, will be experimented with. By adjusting the layers and sequence based on the results obtained from these algorithms, a custom network specifically designed for this task will be created.

Dataset link: https://drive.google.com/file/d/1zdf4mZuDYfKAXY_rJXv_GA498bc3LAFQ/view?usp=sharing

Used networks: https://drive.google.com/file/d/1pwaFVv98MsfQw7D3RhroAph4vme2iRMQ/view?usp=sharing

README:
To run the code, you need to first move the files in the 'Used Networks' section to the current folder in order to make the networks visible in the directory. Since the dataset size is large, only the relevant part has been uploaded to Drive. After downloading the file, copy the path of the extracted file from the zip and paste it in the appropriate place inside the 'audioDatastore' function on the first line. The code will run successfully. Also, remember to move the files in the 'Used Networks' section to the current folder to make the networks visible in the directory. You can uncomment the code section you want to check and comment out the previously used code sections (OpenL3, VGGish, and YAMNet sections) to run them."
