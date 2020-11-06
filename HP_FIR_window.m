function h  = HP_FIR_window(wp, ws, As)
%%%? lam giong voi bai LP 
wc = (wp+ws)/2;
khoangchuyentiep = abs(wp-ws);
% tra bang 6.2
if (As <21) % chon cua so chu nhat
   C= 0.6;
   tencuaso= @rectwin;
elseif(As<44) % chon cua so Hanning   
   C= 3.21; 
   tencuaso= @hann;
elseif(As<53)% chon cua so Hamming
    C= 3.47;
    tencuaso= @hamming;    
else% chon cua so Blackman
    C=5.71;
    tencuaso= @blackman;
end
L = ceil(2*pi*C/khoangchuyentiep);
if(mod(L,2)==0)
    L=L+1; % chon L la so le:
end
win = window(tencuaso, L);

hid = ideal_LP (pi-wc,L);
n = -(L-1)/2 : (L-1)/2; 
h = (-1).^n .* hid .*win'; % cong thuc chuyen doi LP-HP
end
%filter_spect_1 (h);