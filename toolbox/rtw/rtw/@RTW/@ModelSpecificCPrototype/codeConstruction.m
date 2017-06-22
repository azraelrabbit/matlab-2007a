function result = codeConstruction(hSrc)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    result.FunctionName = hSrc.FunctionName;
    % 9 10
    if isempty(hSrc.cache)
        result.ArgSpec = hSrc.Data;
    else
        result.ArgSpec = hSrc.cache.Data;
    end % if
end % function
