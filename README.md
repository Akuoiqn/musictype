# musictype
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

Kod çıktıları eklenen çıktılar dosyasındaki text dosyaları ve rapordaki grafikler olacaktır.
