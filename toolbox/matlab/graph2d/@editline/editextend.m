function aObj = editextend(aObj, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    t = aObj;
    tH = get(aObj, 'MyHandle');
    initVal = get(tH, 'LineWidth');
    virtualslider('init', tH, .5, initVal, 30.0, .5, 'set', 'LineWidth');
end % function
