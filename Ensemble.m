function [PDK_E PDK_T]=Ensemble(Data);
    ornekyuzde = 50;
    [Egitim, Egitimc, Test, Testc] = Orneklem(Data,ornekyuzde);
    
    % Eğitim
%     CTree=fitcknn(Egitim,Egitimc,'OptimizeHyperparameters','all'); %all
    CTree=fitcensemble(Egitim,Egitimc, "OptimizeHyperparameters","all"); %all

    Egitims=predict(CTree,Egitim);
    PDK_E=Perf(Egitimc, Egitims);
    
    % Test 
    Tests=predict(CTree,Test);
    PDK_T=Perf(Testc, Tests);
end
