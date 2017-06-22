function oName = atGetName(this, ps, d, obj, objType)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch this.NameType
    case 'slsfname'
        oName = ps.getSLSFPath(obj, d);
    case 'sfname'
        oName = ps.getSFPath(obj, d);
    otherwise
        oName = ps.getObjectName(obj, objType);
    end % switch
end % function
