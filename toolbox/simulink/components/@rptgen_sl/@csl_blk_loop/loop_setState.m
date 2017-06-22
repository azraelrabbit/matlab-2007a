function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    rptgen_sl.instantiateLinkedBlock(currObj);
    % 9 10
    ok = true;
    % 11 12
    find_system(currObj, 'SearchDepth', 0.0);
    % 13 14
    adsl = rptgen_sl.appdata_sl;
    adsl.CurrentBlock = currObj;
    adsl.Context = 'Block';
end % function
