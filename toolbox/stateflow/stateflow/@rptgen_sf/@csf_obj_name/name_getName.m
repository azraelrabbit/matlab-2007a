function oName = name_getName(c, ps, obj, objType, d, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch c.NameType
    case 'slsfname'
        oName = ps.getSLSFPath(obj, d);
    case 'sfname'
        oName = ps.getSFPath(obj, d);
    otherwise
        oName = ps.getObjectName(obj, objType);
    end % switch
end % function
