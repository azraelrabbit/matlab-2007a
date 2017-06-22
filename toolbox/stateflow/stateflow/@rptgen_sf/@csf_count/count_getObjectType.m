function oType = count_getObjectType(this, objClassName, exampleObj, d)
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
    dotLoc = findstr(objClassName, '.');
    oType = objClassName(plus(dotLoc(end), 1.0):end);
end % function
