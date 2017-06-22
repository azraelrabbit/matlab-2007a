function fontSize = getFontSize(obj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    fontSize = 12.0;
    % 7 9
    switch get(classhandle(obj), 'Name')
    case 'Chart'
        % 11 21
        % 12 21
        % 13 21
        % 14 21
        % 15 21
        % 16 21
        % 17 21
        % 18 21
        % 19 21
    case {'State','Box','Function'}
        % 21 35
        % 22 35
        % 23 35
        % 24 35
        % 25 35
        % 26 35
        % 27 35
        % 28 35
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
    case 'Transition'
        % 34 36
        fontSize = obj.FontSize;
    case 'Junction'
        fontSize = obj.position.radius;
    end % switch
