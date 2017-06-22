function GroupBox = groupbox(fig, pos, string, htextObj)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    GroupBox(2.0) = 0.0;
    style = 'frame';
    % 19 20
    GroupBox(1.0) = uicontrol('Parent', fig, 'Style', style, 'Enable', 'inactive', 'Foreground', [1.0 .984313725490196 .9411764705882353], 'Position', pos);
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    set(htextObj, 'String', string);
    ext = get(htextObj, 'Extent');
    % 30 31
    posText = vertcat(plus(pos(1.0), mrdivide(ext(3.0), length(string))), minus(plus(pos(2.0), pos(4.0)), mrdivide(ext(4.0), 1.75)), ext(3.0), ext(4.0));
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    GroupBox(2.0) = uicontrol('Parent', fig, 'Style', 'text', 'String', string, 'Position', posText);
    % 39 43
    % 40 43
    % 41 43
    % 42 43
end % function
