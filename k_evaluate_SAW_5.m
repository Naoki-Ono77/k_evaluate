close all
clear
clc

%%

%複数のs1pファイルからk2のグラフを表示させるプログラム（faとfrからSAWのk値を求める）
%高精度版

%1.入力するs1pファイルの数だけ%を調整
%2.s1pファイル名を入力
%3.横軸にする値を入力
%4.実行
%5.範囲を絞りたい場合、山の最小値を含むようにaにデータ範囲の最初の点、bにデータ範囲の最後の点を入力
%6.Yabsなど、その他グラフを表示させたい場合read_s1p関数内の%を外す
%実行

%表で表示されるK2の単位は％
%Fs,Fpの単位はMHzなどになっている場合がある（取り込んだファイルに依存）
%インピーダンス整合は不要



%以下、入力部分

file=('1.s1p'); %ファイル名入力
x(1)=1; %横軸の値（変数）を入力
a=1; %範囲を絞る場合、最初のデータ点を入力
b=1; %範囲を絞る場合、最後のデータ点を入力
loadS=read_s1p(file); %s1pファイルからデータを取り出す
[k2(1),fr(1),fa(1)]=k(loadS,a,b,x(1)); %k値と共振反共振周波数の算出

file=('2.s1p');
x(2)=2;
a=1;
b=1;
loadS=read_s1p(file);
[k2(2),fr(2),fa(2)]=k(loadS,a,b,x(2));

file=('3.s1p');
x(3)=3;
a=1;
b=1;
loadS=read_s1p(file);
[k2(3),fr(3),fa(3)]=k(loadS,a,b,x(3));

% file=('2.s1p');
% x(4)=2;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(4),fr(4),fa(4)]=k(loadS,a,b,x(4));
% 
% file=('3.s1p');
% x(5)=3;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(5),fr(5),fa(5)]=k(loadS,a,b,x(5));
% 
% file=('4.s1p');
% x(6)=4;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(6),fr(6),fa(6)]=k(loadS,a,b,x(6));
% 
% file=('5.s1p');
% x(7)=5;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(7),fr(7),fa(7)]=k(loadS,a,b,x(7));
% 
% file=('0.25.s1p');
% x(8)=0.25;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(8),fr(8),fa(8)]=k(loadS,a,b,x(8));
% 
% file=('0.125.s1p');
% x(9)=0.125;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(9),fr(9),fa(9)]=k(loadS,a,b,x(9));
% 
% file=('0.0625.s1p');
% x(10)=0.0625;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(10),fr(10),fa(10)]=k(loadS,a,b,x(10));
% 
% file=('0.03125.s1p');
% x(11)=0.03125;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(11),fr(11),fa(11)]=k(loadS,a,b,x(11));
% 
% file=('2.5.s1p');
% x(12)=2.5;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(12),fr(12),fa(12)]=k(loadS,a,b,x(12));
% 
% file=('10.s1p');
% x(13)=10;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(13),fr(13),fa(13)]=k(loadS,a,b,x(13));
% 
% file=('7.5.s1p');
% x(14)=7.5;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(14),fr(14),fa(14)]=k(loadS,a,b,x(14));

% file=('.s1p');
% x(15)=10;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(15),fr(15),fa(15)]=k(loadS,a,b,x(15));
% 
% file=('.s1p');
% x(16)=10;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(16),fr(16),fa(16)]=k(loadS,a,b,x(16));
% 
% file=('.s1p');
% x(17)=10;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(17),fr(17),fa(17)]=k(loadS,a,b,x(17));
% 
% file=('.s1p');
% x(18)=10;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(18),fr(18),fa(18)]=k(loadS,a,b,x(18));
% 
% file=('.s1p');
% x(19)=10;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(19),fr(19),fa(19)]=k(loadS,a,b,x(19));
% 
% file=('.s1p');
% x(20)=10;
% a=1;
% b=1;
% loadS=read_s1p(file);
% [k2(20),fr(20),fa(20)]=k(loadS,a,b,x(20));



%%
%以上、入力部分




%転置
X=x.';
K2=k2.';
Fr=fr.';
Fa=fa.';


%ソート
X_K2=[X,K2,Fr,Fa];
newrows=sortrows(X_K2);
X=newrows(:,1);
K2=newrows(:,2);
Fr=newrows(:,3);
Fa=newrows(:,4);


%表の表示
table1=table(X,K2,Fr,Fa)


%グラフ表示
figure
hold on
plot(X,K2,'o')
title("x-k2")

%書き出し
fid1=fopen('x_k.txt','w');
fprintf(fid1,'%d\t%10.5e\n',[X,K2]');
fclose(fid1);



%%以降、関数の定義
%k値の算出
function [k2_fsfp,fr,fa]=k(loadS,a,b,xaxis)
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
Yangle=angle(1./Z_exp);

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

F_Yangle=[F_exp, Yangle];
% F_Zreal=[F_exp, Zreal];

% 点数から共振周波数・反共振周波数の入る範囲を探す
subplot(2,2,3)
hold on
plot(Yangle)
title("横軸データ点数")
legend("Yangle")

subplot(2,2,4)
hold on
plot(F_exp, Yangle)
title("横軸周波数")
legend("Yangle")

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

%Yimag=0になる周波数を,ピークの周波数を中心に求める

[Yangle_min, point_Yangle_min] = min(F_Yangle(start_plot:goal_plot,2));
F_Yangle_min = F_exp(point_Yangle_min+start_plot-1);

for n=point_Yangle_min+start_plot-1:-1:1 %Yabs絶対値の最小値の周波数を求める
    if Yangle(n)>0 
        fr=(F_exp(n)*Yangle(n+1)-F_exp(n+1)*Yangle(n))/(Yangle(n+1)-Yangle(n));
        break
    end    
end

d=inf;
for n=point_Yangle_min+start_plot-1:N %Yabs絶対値の最小値の二つ目の周波数を求める
    if Yangle(n)>0 
        fa=(F_exp(n)*Yangle(n-1)-F_exp(n-1)*Yangle(n))/(Yangle(n-1)-Yangle(n));
        break
    end
end




k2_fsfp = (pi^2/4)*(fa-fr)/fa*100;
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