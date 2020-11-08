% Ngô Minh Khánh - 18020698 %

       %%% Bài 2 %%%
       
      
% - Cau 2.a - %
fp = 1750;         % Tan so thong 
fs = 1500;         % Tan so triet
fsampl = 5000;
wp = 2*pi*fp/fsampl     % chuan hoa ve w
ws = 2*pi*fs/fsampl
wc = (wp+ws)/2;         % w cut
khoangchuyentiep = abs(wp-ws);
As = -20 * log10(0.005 / (1+0.005)) % AS = 46 => chon cua so Hamming (As=53)
C = 3.47
L = ceil(2*pi*C/khoangchuyentiep);
if(mod(L,2)==0)
    L = L+ 1; % chon L la so le:
end 
%win = window(@hamming, L);
n = -(L-1)/2 : (L-1)/2;
n = n + eps;  % cong them eps=0.0000001 de tranh chia cho 0 
win = 0.54 + 0.46*cos(2*pi*n/(L-1))
hid = sin((pi-wc)*n)./(pi*n);
h = (-1).^n.*hid .*win
%-1).^n
plot(n,h)
filter_spect_1(h)          % ve pho tan so cua bo loc

% - Cau 2.b - % 
% Tin hieu ban dau %
f_1 = 1900; 
f_2 = 3000;
F = gcd(f_1,f_2);
T = 1/F;           % chu ky cua tin hieu x1
tmax = 3*T
t = 0:T/1000:tmax
x1 = sin(2*pi*f_1*t) + 2*cos(2*pi*f_2*t);
figure;
subplot(3,2,1);
%filter_spect_1(x1)
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
y = filter(h,1,x2)
%y = x2.*a
subplot(3,2,5);
stem(n,y,'b')
xlabel('Tin hieu qua bo loc')
subplot(3,2,6)
filter_spect_1(y);
xlabel('Pho tin hieu qua bo loc')

