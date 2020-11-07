% Ngô Minh Khánh - 18020698 %

       %%% Bài 2 %%%
       
      
% - Cau 2.a - %
fp = 1750;
fs = 1500;
fsampl = 5000;
wp = 2*pi*fp/fsampl     %chuan hoa ve w
wc = 2*pi*fs/fsampl
As = -20 * log(0.005 / (1+0.005))   
a = HP_FIR_window(wp,wc,As)       % tim dap uong xung bo loc
%tem(a)
filter_spect_1(a)                 % ve pho tan so cua bo loc

% - Cau 2.b - % 
f_1 = 1900; 
f_2 = 3000;
F = gcd(f_1,f_2);
T = 1/F;           % chu ky cua tin hieu x1
tmax = 4*T
t = 0:T/100:tmax
x1 = sin(2*pi*f_1*t) + 2*cos(2*pi*f_2*t);
figure;
subplot(3,2,1);
plot(t,x1,'r');
xlabel('Tin hieu ban dau')
title('Mien thoi gian')
subplot(3,2,2)
filter_spect_1(x1)
xlabel('Pho cua tin hieu ban dau')
title('Mien tan so')

% Tin hieu ban dau voi tan so lay mau la fs = 5000
fs = 5000
n = 0:1/fs:tmax 
x2 = sin(2*pi*f_1*n) + 2*cos(2*pi*f_2*n);
subplot(3,2,3);
stem(n,x2);
xlabel('Tin hieu lay mau')
subplot(3,2,4)
filter_spect_1(x2)
xlabel('Pho cua tin hieu lay mau')

% Tin hieu khi di qua bo loc
y = filter(a,1,x2)
%y = x2.*a
subplot(3,2,5);
stem(n,y,'b')
xlabel('Tin hieu qua bo loc')
subplot(3,2,6)
filter_spect_1(y);
xlabel('Pho tin hieu qua bo loc')

