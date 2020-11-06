% Ngô Minh Khánh - 18020698 %
    
       %%% Bài 1 %%%

% - Cau a - %
fprintf('Xac dinh tinh on dinh');
%     s^3 - 2 s^2 - s + 2
%   -----------------------
%   24 s^3 - 14 s^2 - s + 1

num = [1,-2,-1,2]        % he so cua tu so
den = [24,-14,-1,1]      % he so cua mau so
sys = tf(num,den)        % tao ham chuyen dua tren he so cua tu va mau
zplane(num,den)          % ve toa do diem khong, diem cuc tren mien phuc
P = abs(pole(sys))       % tinh do lon cua cac vector diem cuc
stable = (max(P) < 1)    % xac dinh do lon vector diem cuc lon nhat
% Do tin hieu nhan qua nen do loc vector cua diem cuc lon nhat < 1 thi he
% thong se on dinh
   if stable
      fprintf('The system is stable.\n');
   else
      fprintf('WARNING:  The system is NOT stable.\n');
   end

% - Cau b - %

% Cau truc noi tiep %
fprintf('Cau truc noi tiep');
[b0,Bcas,Acas] = dir2cas(den,num)

% Cau truc song song %
fprintf('Cau truc song song');
[C,Bpar,Apar] = dir2par(den,num)