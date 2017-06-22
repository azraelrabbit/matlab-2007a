function c = setObjectType(c, oType)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if islogical(oType)
        c.LockType = oType;
        return;
    end % if
    % 18 19
    c.LockType = false;
    % 20 21
    set(c, 'isAndOrStates', false, 'isBoxStates', false, 'isFcnStates', false, 'isTruthTables', false, 'isEMFunctions', false);
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    switch oType
    case {'isBoxStates','Box'}
        c.isBoxStates = true;
    case {'isFcnStates','Function'}
        c.isFcnStates = true;
    case {'isTruthTables','Truthtable'}
        c.isTruthTables = true;
    case {'isEMFunctions','EMFunction'}
        c.isEMFunctions = true;
    otherwise
        c.isAndOrStates = true;
    end % switch
    % 39 40
    c.LockType = true;
end % function
