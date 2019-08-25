function [chebchev_filtered_signal1] = Chebyshev(y, fs)

%%set the cut-off frequencies
Wp = 30*2/fs;
Ws = 195*2/fs;
Rp = 3;
Rs = 12;

[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);

% Filter the signal

[b,a] = cheby2(5,Rs,Ws, 'low');
chebchev_filtered_signal1 = filtfilt(b, a, y);

end


