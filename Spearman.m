function [S_O,R]=Spearman(X,Y)

% X=Data(:,1:end-1);
% Y=Data(:,end);

%% �zellik Korelasyon Hesab�
% X=PPG_O;
% Y=Bilgiler.YagY;
L=size(X,2);
for i=1:L
    R(i,1)=i;
    [R(i,2),P(i,:)] = corr(Y,X(:,i),'Type','Spearman','Rows','complete');
end
R=abs(R); % Negatif korelasyonlar� pozitifie �eviriyoruz.
R=sortrows(R,2,'descend');


%% Nanlar� Silme
 row=[]; col=[];
 [row, ~] = find(isnan(R(:,2)));
 if isempty(row)
 else
     R(row,:)=[];
 end

%% Toplam 10 grup olu�turulacak.
S_O=cell(L-1,2);
T_O=size(X,2);
a=0;
% n=1:L-1;
for i=1:L
    a=a+1;
    n=i;
    Sec=R(1:n,1);
    Sec=sortrows(Sec,1,'ascend');
    S_O{a,1}=[X(:,Sec(:,1)) Y];
    S_O{a,2}=size(Sec,1); % Se�ilen �zellik say�s�
end
