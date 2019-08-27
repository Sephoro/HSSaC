function [t,yupper] = Sh(y,Fs)

t = linspace(0,1, (length(y)))/Fs;
ShannonEnergy = @(x)-x.^2.*log(x.^2);

% Determine shannon energy
S_E = ShannonEnergy(y);


% Determine envelope

[yupper, ~] =  envelope(S_E,100,'analytic');


end