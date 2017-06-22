function callerName = LocTDisplayCallerInfo(h, headerStr)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [dbStackInfo, dbLineInfo] = dbstack;
    if gt(length(dbStackInfo), 2.0)
        callerName = strip_name(dbStackInfo(3.0).name);
    else
        callerName = '';
    end % if
end % function
function name = strip_name(name)
    % 16 17
    idx = find(eq(name, filesep));
    if not(isempty(idx))
        name = name(plus(max(idx), 1.0):end);
    end % if
end % function
