function h_ideal = ideal_LP (wc,L)
% wc: tan so cat
% L : chieu dai bo loc
% L la so le?
L = round(L);
if(mod(L,2)==0) % neu L chan
    L =L+1; % tang them 1 de thanh so le
end
 m =  -(L-1)/2 :  (L-1)/2;
 m = m + eps ;
 % cong them eps=0.0000001 de tranh chia cho 0 
 h_ideal = sin(wc*m)./(pi*m);