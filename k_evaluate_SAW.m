close all
clear
clc

%% 生データ読み込み

% 生データの読み込み(.s1p)
data_s1p=''; %ファイル名 (拡張子(.s1p)なし)
data=data_s1p;
S1P={data,'LN90°.s1p'};
data_input=strjoin(S1P,'') %入力ファイル名合成
comment = 4; %コメント行の行数
importdata = importdata(data_input,' ',comment);
loadS = importdata.data;

F_exp = loadS(:,1);
s11_abs_exp = (loadS(:,2));
s11_phase_exp = loadS(:,3);

S11_exp=s11_abs_exp.*cosd(s11_phase_exp)+1j*s11_abs_exp.*sind(s11_phase_exp);  

N=numel(F_exp); %実測点数


figure(1)
hold on
plot(F_exp,mag2db(abs(S11_exp)))
title('S_11')

for x=1:1:N
    Z_exp(x,1)=50*(1 + S11_exp(x,1) ) / (1 - S11_exp(x,1));
end

Yabs=abs(1./Z_exp);
Z_abs=abs(Z_exp);
Zreal=real(Z_exp);
Yreal=real(1./Z_exp);
Yimag=imag(1./Z_exp);
Yangle=angle(1./Z_exp);

figure(2)
semilogy(F_exp,Z_abs)
title('Zabs')

% figure(3)
% hold on
% plot(F_exp,Zreal)
% title('Zreal')
% 
% figure(4)
% hold on
% plot(F_exp,Yabs)
% title('Yabs')
% 
% figure(5)
% hold on
% plot(F_exp,Yreal)
% title('Yreal')

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
figure(6)
hold on
yyaxis left
plot(Yreal,'r')
yyaxis right
plot(Zreal,'b')

figure(7)
hold on
yyaxis left
plot(F_exp, Yreal,'r')
yyaxis right
plot(F_exp, Zreal,'b')

figure(8)
hold on
plot(F_exp,s11_phase_exp)
title('S_phase')

figure(9)
hold on
plot(F_exp,Yimag)
xlim([210 214])
title('Yimag')

figure(10)
hold on
plot(F_exp,Yangle)
title('Yangle')



%Yimag=0になる周波数を求める

d=inf;
for n=1:N %Yabs絶対値の最小値の周波数を求める
    if d>abs(Yangle(n))
        d=abs(Yangle(n));
        Yangle(n)
        fr=F_exp(n)
    end
    if Yangle(n)<0 %Yangle<0で脱出
        s=n;
        break 
    end
end

d=inf;
for n=s:N %Yabs絶対値の最小値の二つ目の周波数を求める
    if d>abs(Yangle(n))
        d=abs(Yangle(n));
        Yangle(n)
        fa=F_exp(n)
    end    
    if Yangle>0 %Yangle>0で脱出
        break
    end
end

fr
fa







start_plot=1;
goal_plot=N;


[Ymax, point_Ymax]=min(F_Yreal(start_plot:goal_plot,2));
[Zmax, point_Zmax]=max(F_Zreal(start_plot:goal_plot,2));


fs =F_exp(point_Ymax+start_plot-1)
fp =F_exp(point_Zmax+start_plot-1)


k2_fsfp = (pi^2/4)*(fa-fr)/fa*100
k2_fsfp2 =(pi*fs)/(2*fp)*tan((pi*(fp-fs))/(2*fp))*100
k_fsfp = k2_fsfp^(1/2);