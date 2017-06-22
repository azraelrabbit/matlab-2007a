function pList = getPropList(ps, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    to = ps.getTestObject;
    pList = fieldnames(get(to(1.0)));
end % function
