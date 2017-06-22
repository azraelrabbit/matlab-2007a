function loop_makeSection(c, d, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if not(isempty(varargin))
        attList = varargin{:};
    else
        attList = {};
    end % if
    % 15 16
    if c.HierarchicalSectionNumbering
        currSys = c.RuntimeCurrentObject;
        oString = getOrderString(get_param(currSys, 'object'));
        if not(isempty(oString))
            attList = cellhorzcat('label', oString);
        end % if
    end % if
    c.makeSection(d, attList);
end % function
function oString = getOrderString(sys)
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    idx = 1.0;
    leftSys = sys.left;
    sysList = get(rptgen_sl.appdata_sl, 'ReportedSystemList');
    % 33 34
        while not(isempty(leftSys))
        if isa(leftSys, 'Simulink.SubSystem')
            name = regexprep(leftSys.getFullName, '\n', ' ');
            if any(strcmp(sysList, name))
                idx = plus(idx, 1.0);
            end % if
        end % if
        % 41 42
        leftSys = leftSys.left;
    end % while
    % 44 45
    if isempty(sys.up) || isa(sys.up, 'Simulink.Root')
        oString = sprintf('%i', idx);
    else
        oString = sprintf('%s.%i', getOrderString(sys.up), idx);
        % 49 51
        % 50 51
    end % if
end % function
