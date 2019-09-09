function[] = Play(s1,fs1,s2,fs2)


% This function plays two clips to compare them if nargin > 2 else ...
%
% s1 is the original fs1 is s1 sampling frequency
% s2 is the manipulated one -- fs2 is the manipulated sampling frequency
% 20/07/2019  KEMS


% Do you wanna play two or one file
if nargin == 4
    
    % Pause time
    time1 = (0:length(s1)-1)/fs1;
    one = audioplayer(s1,fs1);
    play(one)
    
    % Pause for time seconds, wait for the first one to finish
    pause(max(time1) + 0.5)
    
    two = audioplayer(s2,fs2);
    play(two)
    
    % Pause the entire function
    time2 = (0:length(s2)-1)/fs2;
    pause(max(time2))
    
else
    % Pause Timer
    time1 = (0:length(s1)-1)/fs1;
    
    % Load Audio player
    one = audioplayer(s1,fs1);
    
    play(one)
    
    % Pause the entire function
    pause(max(time1))
    
end

end