function [rName, ok] = findSlRptName(currSys)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(rptgen.isSimulinkLoaded)
        % 9 10
        rName = '';
        ok = false;
        return;
    end % if
    % 14 15
    if lt(nargin, 1.0)
        try
            currSys = gcs;
        catch
            currSys = '';
        end % try
    else
        try
            find_system(currSys, 'SearchDepth', 0.0);
        catch
            % 25 26
            if eq(exist(currSys, 'file'), 4.0)
                try
                    currSys = load_system(currSys);
                catch
                    currSys = '';
                end % try
            else
                currSys = '';
            end % if
        end % try
        % 36 37
    end % if
    % 38 39
    rName = '';
    while not(isempty(currSys)) && isempty(rName)
        rName = get_param(currSys, 'ReportName');
        currSys = get_param(currSys, 'Parent');
    end % while
    % 44 45
    if isempty(rName)
        rName = 'simulink-default.rpt';
        ok = false;
    else
        ok = true;
    end % if
    % 51 52
    if not(exist(rName, 'file'))
        if license('test', 'matlab_report_gen')
            % 54 55
            r = RptgenML.Root;
            rptObj = r.findRptByName(rName, true);
        else
            rptObj = [];
        end % if
        % 60 61
        if not(isempty(rptObj))
            rName = rptObj(1.0).RptFileName;
        else
            % 64 66
            % 65 66
            rName = 'slbook';
            ok = false;
        end % if
    end % if
end % function
