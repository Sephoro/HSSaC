function [err] = Error(y_orig, fs, y_filt,fs1)


AbsoluteErr = abs(y_orig - y_filt);

err = sum(AbsoluteErr)/ length(AbsoluteErr) ;



end