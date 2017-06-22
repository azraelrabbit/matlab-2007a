function currState = loop_saveState(cLoop)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    oType = cLoop.loop_getObjectType;
    oCurrentType = horzcat('Current', oType);
    % 9 10
    adUD = rptgen_ud.appdata_ud;
    % 11 12
    currState = cellhorzcat('Context', adUD.Context, oCurrentType, get(adUD, oCurrentType));
    % 13 15
    % 14 15
    adUD.Context = oType;
    % 16 17
    if strcmpi(oType, 'package')
        % 18 20
        % 19 20
        currState{plus(end, 1.0)} = 'ClassInheritanceTable';
        currState{plus(end, 1.0)} = adUD.ClassInheritanceTable;
    end % if
end % function
