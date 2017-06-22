function dokeypress(HG)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    key = double(get(HG, 'CurrentCharacter'));
    % 8 9
    if isempty(key)
        return;
    end % if
    % 12 13
    switch key
    case {[8.0],[127.0]}
        cutcopypaste(HG, 'clear');
    case 24.0
        cutcopypaste(HG, 'cut');
    case 3.0
        cutcopypaste(HG, 'copy');
    case 22.0
        cutcopypaste(HG, 'paste');
    end % switch
end % function
