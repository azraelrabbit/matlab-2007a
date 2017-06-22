function enumVal = getEnumValFromStr(this, enumStr, lstEnumStrs)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    enumVal = -1.0;
    for i=1.0:length(lstEnumStrs)
        if strcmp(enumStr, lstEnumStrs{i})
            enumVal = minus(i, 1.0);
            break
        end % if
    end % for
    % 13 14
end % function
