%% Temizleme
close all; clear;clc;

%% Veri Yükleme
cd ../a_Data/a_Ham/ % bu dosya (a_Ozellik_Secme.m) a_kod klasörünün içinde
% o yüzden '..' ile bir üst klasöre çıkıp 'a_Data/a_Ham/' ile ham klasörüne
% girip Data ya ulaştık
load Data %data yıoradan alıp worksoace e yükledik
cd ../../b_Kod % tekrar iki dizin yukarı çıkarak kod klasörüne yani
% bulunduğumuz yere geldik

%% Veri önişleme
Data(:,4)=[]; % datamızın 4. sütununun bütün satırlarını sildik 
% çünkü 4. sütunun(yıl) kolarasyon değeri Nan

%% Özellik Seçme
X=Data(:,1:end-1); % X datamızın son sütunu(class) hariç datamızı temsil ediyor
Y=Data(:,end); % Y sadece son sütunu (class) temsil ediyor
[S_O,R]=Spearman(X,Y); % S_O -->seçilmiz özellikler R özelliklerin 
% colerasyon değerlerini veriyor. y ye göre x i seçme


%% Verleri Kayıt etme
cd ../a_Data/b_Ozellik_Secme % bir dizin yukarı çıktık(uygulamanın içine) 
% sonra ozll seçmeye girdik
save Data % elde ettiğimiz verileri buraya kaydettik
save R
cd ../../b_Kod % iki dizin yukarı ve oda girdik
