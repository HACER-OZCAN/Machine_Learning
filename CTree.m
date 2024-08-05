function [PDK_E PDK_T]=CTree(Data);
    Yuzde = 50;
    [Egitim, Egitimc, Test, Testc] = Orneklem(Data,Yuzde);
    
    % Eğitim
%     CTree=fitctree(Egitim,Egitimc,'OptimizeHyperparameters','all'); %all
    CTree=fitctree(Egitim,Egitimc,"OptimizeHyperparameters","all"); %all
    view(CTree,'Mode','graph')

    Egitims=predict(CTree,Egitim);
    PDK_E=Perf(Egitimc, Egitims);
    
    % Test 
    Tests=predict(CTree,Test);
    PDK_T=Perf(Testc, Tests);
end
