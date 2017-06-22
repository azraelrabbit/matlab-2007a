function aObj = editextend(aObj, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    t = aObj;
    tH = get(aObj, 'MyHandle');
    initVal = get(t, 'FontSize');
    virtualslider('init', tH, 6.0, initVal, 48.0, .5, 'set', 'FontSize');
end % function
