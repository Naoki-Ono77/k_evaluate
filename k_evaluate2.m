close all
clear
clc

%%

%複数のs1pファイルからk2のグラフを表示させるプログラム

%1.入力するs1pファイルの数だけ%を調整
%2.s1pファイル名を入力
%3.横軸にする値を入力
%4.実行
%5.グラフを確認し、ZrealとYrealの最大値がZabsの共振反共振と一致しているか確認し、最小値が一致している場合はMZかMYを0に変更
%6.最大値（または最小値）を探す範囲を絞りたい場合、aにデータ範囲の最初の点、bにデータ範囲の最後の点を入力
%7.Yabsなど、その他グラフを表示させたい場合read_s1p関数内の%を外す
%実行

%表で表示されるK2の単位は％
%Fs,Fpの単位はMHzなどになっている場合がある（取り込んだファイルに依存）



%以下、入力部分

file=('LN0°.s1p'); %ファイル名入力
x(1)=0; %横軸の値（変数）を入力
MZ=1; %Zrealのとげが上向きの場合1, Zrealのとげが下向きの場合0を入力
MY=0; %Yrealのとげが上向きの場合1, Yrealのとげが下向きの場合0を入力
a=1; %範囲を絞る場合、最初のデータ点を入力
b=1; %範囲を絞る場合、最後のデータ点を入力
loadS=read_s1p(file); %s1pファイルからデータを取り出す
[k2(1),fs(1),fp(1)]=k(loadS,MZ,MY,a,b,x(1)); %k値と共振反共振周波数の算出

file=('LN90°.s1p');
x(2)=90;
MZ=1;
MY=1;
a=1;
b=1;
loadS=read_s1p(file);
[k2(2),fs(2),fp(2)]=k(loadS,MZ,MY,a,b,x(2));

file=('LN10°.s1p');
x(3)=10;
MZ=1;
MY=0;
a=1;
b=1;
loadS=read_s1p(file);
[k2(3),fs(3),fp(3)]=k(loadS,MZ,MY,a,b,x(3));

% file=('.s1p');
% x(4)=;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(4),fs(4),fp(4)]=k(loadS,MZ,MY,a,b,x(4));
% 
% file=('.s1p');
% x(5)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(5),fs(5),fp(5)]=k(loadS,MZ,MY,a,b,x(5))
% 
% file=('.s1p');
% x(6)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(6),fs(6),fp(6)]=k(loadS,MZ,MY,a,b,x(6))
% 
% file=('.s1p');
% x(7)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(7),fs(7),fp(7)]=k(loadS,MZ,MY,a,b,x(7))
% 
% file=('.s1p');
% x(8)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(8),fs(8),fp(8)]=k(loadS,MZ,MY,a,b,x(8))
% 
% file=('.s1p');
% x(9)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(9),fs(9),fp(9)]=k(loadS,MZ,MY,a,b,x(9))
% 
% file=('.s1p');
% x(10)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(10),fs(10),fp(10)]=k(loadS,MZ,MY,a,b,x(10))
% 
% file=('.s1p');
% x(11)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(11),fs(11),fp(11)]=k(loadS,MZ,MY,a,b,x(11))
% 
% file=('.s1p');
% x(12)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(12),fs(12),fp(12)]=k(loadS,MZ,MY,a,b,x(12))
% 
% file=('.s1p');
% x(13)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(13),fs(13),fp(13)]=k(loadS,MZ,MY,a,b,x(13))
% 
% file=('.s1p');
% x(14)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(14),fs(14),fp(14)]=k(loadS,MZ,MY,a,b,x(14))
% 
% file=('.s1p');
% x(15)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(15),fs(15),fp(15)]=k(loadS,MZ,MY,a,b,x(15))
% 
% file=('.s1p');
% x(16)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(16),fs(16),fp(16)]=k(loadS,MZ,MY,a,b,x(16))
% 
% file=('.s1p');
% x(17)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(17),fs(17),fp(17)]=k(loadS,MZ,MY,a,b,x(17))
% 
% file=('.s1p');
% x(18)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(18),fs(18),fp(18)]=k(loadS,MZ,MY,a,b,x(18))
% 
% file=('.s1p');
% x(19)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(19),fs(19),fp(19)]=k(loadS,MZ,MY,a,b,x(19))
% 
% file=('.s1p');
% x(20)=10;
% MZ=1;
% MY=1;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(20),fs(20),fp(20)]=k(loadS,MZ,MY,a,b,x(20))



%%
%以上、入力部分




%転置
X=x.';
K2=k2.';
Fs=fs.';
Fp=fp.';


%ソート
X_K2=[X,K2,Fs,Fp];
newrows=sortrows(X_K2);
X=newrows(:,1);
K2=newrows(:,2);
Fs=newrows(:,3);
Fp=newrows(:,4);


%表の表示
table1=table(X,K2,Fs,Fp)


%グラフ表示
figure
hold on
plot(X,K2)
title("x-k2")





%%以降、関数の定義
%k値の算出
function [k2_fsfp,fs,fp]=k(loadS,MZ,MY,a,b,xaxis)
F_exp = loadS(:,1);
s11_abs_exp = (loadS(:,2));
s11_phase_exp = loadS(:,3);

S11_exp=s11_abs_exp.*cosd(s11_phase_exp)+1j*s11_abs_exp.*sind(s11_phase_exp);  

N=numel(F_exp); %実測点数

figure

subplot(2,2,1)
hold on
plot(F_exp,mag2db(abs(S11_exp)))
title("S11 of " + xaxis)

for x=1:1:N
    Z_exp(x,1)=50*(1 + S11_exp(x,1) ) / (1 - S11_exp(x,1));
end

Yabs=abs(1./Z_exp);
Z_abs=abs(Z_exp);
Zreal=real(Z_exp);
Yreal=real(1./Z_exp);

subplot(2,2,2)
semilogy(F_exp,Z_abs)
title("Zabs of " + xaxis)



% %書き出し
% fid1=fopen('Zabs.txt','w');
% fprintf(fid1,'%15.13e\n',Z_abs);
% fclose(fid1);
% 
% fid2=fopen('Zreal.txt','w');
% fprintf(fid2,'%15.13e\n',Zreal);
% fclose(fid2);

F_Yreal=[F_exp, Yreal];
F_Zreal=[F_exp, Zreal];

% 点数から共振周波数・反共振周波数の入る範囲を探す
subplot(2,2,3)
hold on
yyaxis left
plot(Yreal,'r')
yyaxis right
plot(Zreal,'b')
title("横軸データ点数")
legend("Yreal", "Zreal")

subplot(2,2,4)
hold on
yyaxis left
plot(F_exp, Yreal,'r')
yyaxis right
plot(F_exp, Zreal,'b')
title("横軸周波数")
legend("Yreal","Zreal")

%%その他グラフの表示

% figure
% 
% subplot(2,2,1)
% hold on
% plot(F_exp,Zreal)
% title("Zreal of " + xaxis)
% 
% subplot(2,2,2)
% hold on
% plot(F_exp,Yabs)
% title("Yabs of " + xaxis)
% 
% subplot(2,2,3)
% hold on
% plot(F_exp,Yreal)
% title("Yreal of " + xaxis)


%%データ範囲

start_plot=a;
if b==1 
goal_plot=N;
else
goal_plot=b;
end

if MY==1
[Ymax, point_Ymax]=max(F_Yreal(start_plot:goal_plot,2));
elseif MY==0
[Ymax, point_Ymax]=min(F_Yreal(start_plot:goal_plot,2));
end

if MZ==1
[Zmax, point_Zmax]=max(F_Zreal(start_plot:goal_plot,2));
elseif MZ==0
[Zmax, point_Zmax]=min(F_Zreal(start_plot:goal_plot,2));
end

fs =F_exp(point_Ymax+start_plot-1);
fp =F_exp(point_Zmax+start_plot-1);


k2_fsfp =(pi*fs)/(2*fp)*tan((pi*(fp-fs))/(2*fp))*100;
k_fsfp = k2_fsfp^(1/2);
end

% 生データの読み込み(.s1p)
function loadS=read_s1p(file1)
    data_s1p=''; %ファイル名 (拡張子(.s1p)なし)
    data=data_s1p;
    S1P={data,file1};
    data_input=strjoin(S1P,''); %入力ファイル名合成
    comment = 4; %コメント行の行数
    A = importdata(data_input,' ',comment);
    loadS = A.data;
end