[hL,Fs] = load_filter('EQF_demoL.bin');

H_L = freqz(hL, 1, Fs/2, Fs);
H_Lnorm = hL/max(abs(H_L)); % normalize
t_ax = ( (1:length(hL))-1)/Fs;
[H, f_ax] = freqz(H_Lnorm, 1, Fs/2, Fs);
f_ax = f_ax+1;

figure
subplot(2,1,1)
plot(t_ax*1000, hL, 'k-'); grid on;
xlabel(' time, msec')
title(['Impulse Response']);

Hdb = 20*log10(abs(H));
subplot(2,1,2)
semilogx(f_ax, Hdb, 'k-'); grid on
axis([100 14000 -60 0])
title('Frequency Response')
xlabel('frequency, Hz')