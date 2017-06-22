function cType = getType(tCode)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 1.0)
        tCode = '';
    end % if
    % 12 13
    switch tCode
    case 'fr'
        cType = xlate('Formatting');
    case 'ml'
        cType = xlate('MATLAB');
    otherwise
        cType = xlate('Report Generator');
    end % switch
end % function
