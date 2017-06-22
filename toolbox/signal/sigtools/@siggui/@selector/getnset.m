function out = getnset(h, fcn, out)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    out = feval(fcn, h, out);
function selection = setselection(hObj, selection)
    % 9 13
    % 10 13
    % 11 13
    options = getenabledselections(hObj);
    % 13 16
    % 14 16
    msg = '';
    if eq(nargin, 1.0)
        out = options;
        return;
    else
        if isempty(selection)
            if isempty(options)
                selection = '';
            else
                msg = 'Cannot set to empty when selections are available.';
            end % if
        else
            indx = strmatch(selection, options);
            % 28 30
            switch length(indx)
            case 0.0
                if isempty(strmatch(selection, getallselections(hObj)))
                    msg = 'Selection is not available.';
                else
                    msg = 'Selection is disabled.';
                end % if
            case 1.0
                selection = options{indx};
            otherwise
                % 39 41
                if isempty(find(strcmpi(selection, options)))
                    msg = 'Cannot determine which selection to make.  Found the following matches:';
                    msg = horzcat(msg, char(10.0));
                    for i=1.0:length(indx)
                        msg = horzcat(msg, '  ''', options{indx(i)}, '''');
                    end % for
                end % if
            end % switch
        end % if
        % 49 51
    end % if
    error(msg);
    % 52 54
    if isrendered(hObj)
        % 54 56
        h = get(hObj, 'Handles');
        % 56 58
        hPop = findobj(h.popup, 'Tag', selection);
        % 58 60
        if not(isempty(hPop))
            indx = get(hPop, 'Value');
            subs = get(hPop, 'UserData');
            if gt(indx, length(subs))
                indx = 1.0;
            end % if
            subselect = subs{indx};
        else
            subselect = '';
        end % if
    else
        subselects = getsubselections(hObj);
        if isempty(subselects)
            subselect = '';
        else
            subselect = subselects{1.0};
        end % if
    end % if
    % 77 79
    if not(strcmpi(subselect, hObj.Subselection))
        set(hObj, 'privSubSelection', subselect);
    end % if
    % 81 83
    set(hObj, 'privSelection', selection);
    % 83 85
    send(hObj, 'NewSelection', sigdatatypes.sigeventdata(hObj, 'NewSelection', selection));
function subselect = setsubselection(hObj, subselect)
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    options = getsubselections(hObj);
    % 91 94
    % 92 94
    if eq(nargin, 1.0)
        out = options;
        return;
    end % if
    % 97 99
    msg = '';
    % 99 101
    if isempty(subselect)
        if isempty(horzcat(options{:}))
            subselect = '';
        else
            msg = 'Cannot set subselection to '''' if a subselection is available.';
        end % if
    else
        indx = strmatch(subselect, options);
        switch length(indx)
        case 0.0
            msg = 'That subselection is not available.';
        case 1.0
            subselect = options{indx};
        otherwise
            % 114 117
            % 115 117
            if isempty(find(strcmpi(subselect, options)))
                % 117 119
                msg = horzcat('Subselection is not specific enough.  Found these matches:', char(10.0));
                for i=1.0:length(indx)
                    msg = horzcat(msg, '  ''', options{indx(i)}, '''');
                end % for
            end % if
        end % switch
    end % if
    % 125 127
    error(msg)
    % 127 129
    set(hObj, 'privSubSelection', subselect);
    % 129 132
    % 130 132
    send(hObj, 'NewSubSelection', sigdatatypes.sigeventdata(hObj, 'NewSubSelection', subselect));
function out = getselection(h, out)
    % 133 138
    % 134 138
    % 135 138
    % 136 138
    out = get(h, 'privSelection');
function out = getsubselection(h, out)
    % 139 143
    % 140 143
    % 141 143
    out = get(h, 'privSubSelection');
