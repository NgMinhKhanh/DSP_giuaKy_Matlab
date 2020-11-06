function filter_spect_1 (h)
 %%% plot abs frequency spectrum from h(n)
 [H,w]= freqz(h,1,1000,'whole');
 H=H(1:501)';
 w=w(1:501)';
 mag= abs(H);
 plot(w/pi,mag);
% xlabel('tan so chuan hoa w/pi')