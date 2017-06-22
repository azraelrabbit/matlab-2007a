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
    figH = getTestObject(rptgen_hg.propsrc_hg_fig);
    % 11 12
    objHandle = findall(figH, 'type', 'axes', 'tag', 'RPTGEN_TEST_AXES');
    if isempty(objHandle)
        objHandle = axes('parent', figH, 'tag', 'RPTGEN_TEST_AXES');
    else
        objHandle = objHandle(1.0);
    end % if
end % function
