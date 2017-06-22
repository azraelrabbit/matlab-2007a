function f = findType(hMessageLog, mType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    f = find(cacheMergedLog(hMessageLog), '-function', 'Type', @(x)strcmpi(x,mType));
end
