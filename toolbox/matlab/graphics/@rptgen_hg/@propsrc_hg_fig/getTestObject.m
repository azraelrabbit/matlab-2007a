function objHandle = getTestObject(h, objType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    objHandle = findall(0.0, 'type', 'figure', 'tag', 'RPTGEN_TEST_FIGURE');
    if isempty(objHandle)
        objHandle = figure('handlevisibility', 'off', 'integerhandle', 'off', 'visible', 'off', 'tag', 'RPTGEN_TEST_FIGURE', 'name', 'Report Generator Test Figure');
        % 13 17
        % 14 17
        % 15 17
        % 16 17
    end % if
end % function
