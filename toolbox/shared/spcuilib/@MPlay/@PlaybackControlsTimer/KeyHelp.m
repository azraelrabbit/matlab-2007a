function helpStruct = KeyHelp(playbackObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    group.Title = 'Playback';
    group.Widgets = {'P, Space','Play/pause video';'S','Stop video';'F, Home','Go to first frame';'L, End','Go to last frame';'Right Arrow, Page Down','Step forward';'Left Arrow, Page Up','Step back';'Down Arrow','Jump forward';'Up Arrow','Jump back';'J','Jump to frame';'R','Repeat';'A','Autoreverse'};
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    helpStruct = group;
    % 22 25
    % 23 25
    % 24 25
    group.Title = 'Frame Rate';
    group.Widgets = {'T','Change rate';'+','Increase rate';'-','Decrease rate';'0 (zero)','Reset rate'};
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    helpStruct(2.0) = group;
end % function
