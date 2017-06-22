function [pValue, propName] = getPropValue(ps, objList, propName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch propName
    case ps.getCommonPropValue('PropList')
        % 8 12
        % 9 12
        % 10 12
        [pValue, propName] = getCommonPropValue(ps, objList, propName);
    case {'SnapshotSmall','SnapshotLarge'}
        d = get(rptgen.appdata_rg, 'CurrentDocument');
        cSnapshot = rptgen_sl.csl_sys_snap;
        if strcmpi(propName(minus(end, 4.0):end), 'small')
            set(cSnapshot, 'PaperExtentMode', 'manual', 'PaperZoom', 100.0, 'PaperUnits', 'percent', 'ViewportType', 'fixed', 'ViewportSize', [2.0 2.0], 'CreateImagemap', false);
        else
            % 18 24
            % 19 24
            % 20 24
            % 21 24
            % 22 24
            % 23 25
            set(cSnapshot, 'PaperExtentMode', 'manual', 'PaperZoom', 200.0, 'PaperUnits', 'percent', 'ViewportType', 'zoom', 'ViewportZoom', 50.0, 'ViewportSize', [6.0 6.0], 'CreateImagemap', true);
            % 25 33
            % 26 33
            % 27 33
            % 28 33
            % 29 33
            % 30 33
            % 31 33
        end % if
        if ischar(objList)
            objList = cellhorzcat(objList);
        end % if
        for i=length(objList):-1.0:1.0
            try
                pValue{i, 1.0} = gr_makeGraphic(cSnapshot, d, objList{i});
            catch
                pValue{i, 1.0} = 'N/A';
                cSnapshot.status(lasterr, 2.0);
            end % try
        end % for
        propName = 'Snapshot';
    otherwise
        pValue = rptgen.safeGet(objList, propName, 'get_param');
    end % switch
