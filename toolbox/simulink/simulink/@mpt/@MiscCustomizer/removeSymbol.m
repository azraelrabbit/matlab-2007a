function removeSymbol(hThisObj, requestName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    oldList = hThisObj.MPFSymbolDefinition;
    symbols = {};
    for i=1.0:length(oldList)
        symbols{plus(end, 1.0)} = oldList{i}.Name;
    end % for
    % 11 12
    [sym, idx] = intersect(symbols, requestName);
    if isempty(sym)
        msg = sprintf('''%s'' is not in custom registered symbol list.', requestName);
        warning('Simulink:mpt:MiscCustomizer:removeSymbol', msg);
    else
        try
            % 18 19
            newList = {};
            for i=1.0:minus(idx, 1.0)
                newList{plus(end, 1.0)} = oldList{i};
            end % for
            for i=plus(idx, 1.0):length(oldList)
                newList{plus(end, 1.0)} = oldList{i};
            end % for
            hThisObj.MPFSymbolDefinition = newList;
        catch
            warning('Simulink:mpt:Customizer:removeSymbol', lasterr);
        end % try
    end % if
end % function
