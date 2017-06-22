function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    ok = logical(1);
    % 8 11
    % 9 11
    adsl = rptgen_sl.appdata_sl;
    % 11 14
    % 12 14
    adsl.CurrentSignal = currObj;
    adsl.Context = 'Signal';
end
