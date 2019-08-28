function[] = player(s1,fs1,s2,fs2)


% This function plays two clips to compare them
%
%       s1 is the original fs1 is s1 sampling frequency
%       s2 is the manipulated one -- fs2 is the manipulated sampling frequency
%       20/07/2019  KEMS
%


% Do you wanna play two or one file
if nargin == 4
    
    one = audioplayer(s1,fs1);
    play(one)
    
    % Pause for 10 seconds, wait for the first one to finisj
    pause(10)
    
    two = audioplayer(s2,fs2);
    play(two)
    
else
    one = audioplayer(s1,fs1);
    play(one)
end

end