function idx = enum2val(type, enum)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    typeClass = findtype(type);
    if isempty(typeClass)
        error(horzcat(type, ' is not a valid udd type '));
    end % if
    % 29 30
    idx = find(strcmp(enum, typeClass.Strings));
    % 31 32
    if isempty(idx)
        error(horzcat(enum, ' is not one of the enumeration strings in type ', type));
    end % if
    % 35 36
    idx = int32(typeClass.Values(idx));
end % function
