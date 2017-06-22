function enumIndex = getEnumIndex(typeName, stringValue)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    enumIndex = -1.0;
    % 9 10
    type = get(findtype(typeName));
    % 11 12
    if not(isempty(type))
        for i=1.0:length(type.Strings)
            if strcmp(type.Strings(i), stringValue)
                enumIndex = type.Values(i);
                break
            end % if
        end % for
    end % if
end % function
