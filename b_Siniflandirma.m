%% Temizleme
%close all; clear;clc;

%% Veri Yükleme
cd ../a_Data/b_Ozellik_Secme % bi dzin üste çıktık(uygulama) özz secmeye
% girdik oradaki
load("Data.mat","S_O"); % datayı ve S_O yu aldık
cd ../../b_Kod % iki dizin yukarı çıkıp bulunduğumuz yere geldik (kod)

%% Sınıflandırma SVM
for i=1:13
    Data=S_O{i,1}; % for ile S_O nun elemanlarını alıyouz
    [PDK_E PDK_T]=SVMs(Data); % data(seçilen özl)verisini SVMs fonkuna 
    % gönderiyoruz ve bize PDK_E(eğitimin perf sonuçları) ve
    % PDK_T(testin perf sonuçları) verilerini geri döndürüyor
     if(i == 1)
        Sonuclar_SVM = [PDK_T];
    else
        Sonuclar_SVM = [Sonuclar_SVM; PDK_T]; % Tüm değerleri alt alta yazsın
    end
end
close all;
% bu PDK_T önemli ayrıca excelle kaydet

%% sınıflandırma kNN

for i=1:13
    Data=S_O{i,1};
    [PDK_E PDK_T]=kNN(Data);
    if(i==1)
        Sonuclar_kNN=[PDK_T];
    else 
        Sonuclar_kNN=[Sonuclar_kNN; PDK_T];
    end
end
close all;

%% Ensemble sınıflandırma
for i=1:13
    Data=S_O{i,1};
    [PDK_E PDK_T]=Ensemble(Data);
    if(i==1)
        Sonuclar_Ensemble=[PDK_T];
    else
        Sonuclar_Ensemble=[Sonuclar_Ensemble;PDK_T];
    end
end
close all;

%% sınıflandırma CTree 
for i=1:13
    Data=S_O{i,1};
    [PDK_E PDK_T]=CTree(Data);
    if(i==1)
        Sonuclar_CTree=[PDK_T];
    else
        Sonuclar_CTree=[Sonuclar_CTree ;PDK_T];
    end 
end
close all;

%% Kayıt
cd ../a_Data/c_Siniflandirma %siniflandirma  klasörüne girdik
save Data % kayettik
cd ../../b_Kod % tekrar kendi klasörümüze geldik
%% sonuç kayıt
cd ../a_Data/c_Siniflandirma/
save Sonuclar_SVM
save Sonuclar_kNN
save Sonuclar_Ensemble
save Sonuclar_CTree
cd ..\..\b_kod 


