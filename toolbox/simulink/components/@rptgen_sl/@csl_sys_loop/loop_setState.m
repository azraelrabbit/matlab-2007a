function ok = loop_setState(h, currObj, objName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rptgen_sl.instantiateLinkedBlock(currObj);
    % 8 10
    set_param(0.0, 'CurrentSystem', currObj);
    % 10 14
    % 11 14
    % 12 14
    adsl = rptgen_sl.appdata_sl;
    % 14 16
    adsl.CurrentSystem = currObj;
    adsl.CurrentBlock = '';
    adsl.CurrentSignal = -1.0;
    % 18 20
    adsl.Context = 'System';
    % 20 22
    ok = logical(1);
end
