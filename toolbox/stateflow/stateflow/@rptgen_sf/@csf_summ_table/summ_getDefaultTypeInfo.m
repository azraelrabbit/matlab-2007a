function i = summ_getDefaultTypeInfo(typeID)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    psSF = rptgen_sf.propsrc_sf;
    % 11 13
    switch typeID
    case 'Chart'
        i = rptgen.summsrc(typeID, psSF, rptgen_sf.csf_chart_loop, {'Name'}, false);
        % 16 20
        % 17 20
        % 18 20
    case 'Machine'
        % 19 21
        i = rptgen.summsrc(typeID, psSF, rptgen_sf.csf_machine_loop, {'Name'}, false);
        % 22 27
        % 23 27
        % 24 27
        % 25 27
    case {'State';'Function';'Box';'EMFunction';'TruthTable'}
        % 26 34
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        i = rptgen.summsrc(typeID, psSF, setObjectType(rptgen_sf.csf_state_loop, typeID), {'Name'}, false);
        % 35 39
        % 36 39
        % 37 39
    case listTerminalTypes(rptgen_sf.appdata_sf)
        % 38 40
        i = rptgen.summsrc(typeID, psSF, setObjectType(rptgen_sf.csf_obj_loop, typeID), {'Name'}, true);
    otherwise
        % 41 45
        % 42 45
        % 43 45
        % 44 46
        error('rptgen:InvalidSummsrc', 'Unrecognized summsrc type "%s"', typeID);
    end % switch
