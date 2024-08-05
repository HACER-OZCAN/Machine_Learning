%% SVM algoritması kodu
function [PDK_E PDK_T]=SVMs(Data) % datayı(seçilen öz.) aldı pdke, pdkt döndürecek
    ornekyuzde = 20;
    [Egitim, Egitimc, Test, Testc] = Orneklem(Data,ornekyuzde); %örneklem fonkuna 
    % datayı ve yuzdeyi gönderiyoruz bize 
    % Egitim= 196xi eğitimde kullanılacak veriler(seçilmiş şekilde)
    % Egitimc= 196x1 eğitimde kllanılaca class sütunu
    % Test= 48xi testte kullanılacak veri kısmı(seçilmiş veri)
    % Testc= 48x1 testte kullanılan class kısmı
    % döndürüyor
    
    % Eğitim
     CTree=fitcsvm(Egitim,Egitimc,'OptimizeHyperparameters','all'); %all
     CTree=fitcsvm(Egitim,Egitimc); %all 
    % normalde üsttekini çalıştırmamız lazım ama testler için hızlı sonuç
    % lazımsa alttakini kullanırız

    Egitims=predict(CTree,Egitim);
    PDK_E=Perf(Egitimc, Egitims);
    
    % Test 
    Tests=predict(CTree,Test);
    PDK_T=Perf(Testc, Tests);
end
