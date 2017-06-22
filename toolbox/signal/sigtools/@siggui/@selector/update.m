function update(this, fcn, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 1.0)
        fcn = 'update_all';
    end % if
    feval(fcn, this, varargin{:});
end % function
function update_all(this)
    % 13 15
    update_enablestates(this);
    update_popup(this);
    update_radiobtns(this);
    update_cshtags(this);
end % function
function update_enablestates(this)
    % 20 24
    % 21 24
    % 22 24
    enabState = get(this, 'Enable');
    h = get(this, 'Handles');
    % 25 28
    % 26 28
    if strcmpi(enabState, 'off')
        setenableprop(h.popup, enabState, false);
        setenableprop(h.radio, enabState, false);
    else
        dSelects = get(this, 'DisabledSelections');
        % 32 36
        % 33 36
        % 34 36
        for i=1.0:length(h.radio)
            tag = get(h.radio(i), 'Tag');
            if not(isempty(strmatch(tag, dSelects)))
                enabState = 'Off';
            else
                enabState = 'On';
            end % if
            setenableprop(h.popup(i), enabState, false);
            setenableprop(h.radio(i), enabState, false);
        end % for
    end % if
end % function
function update_popup(this)
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    selection = get(this, 'Selection');
    subselect = get(this, 'SubSelection');
    h = get(this, 'Handles');
    % 57 59
    hPop = [];
    if not(isempty(h.popup))
        % 60 63
        % 61 63
        hPop = findobj(h.popup, 'Tag', selection);
    end % if
    % 64 66
    if not(isempty(hPop))
        % 66 69
        % 67 69
        tags = get(hPop, 'UserData');
        indx = find(strcmpi(subselect, tags));
        % 70 72
        if isempty(indx)
            indx = 1.0;
        end % if
        set(hPop, 'Value', indx);
    end % if
end % function
function update_radiobtns(this)
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    h = get(this, 'Handles');
    sel = get(this, 'Selection');
    % 84 87
    % 85 87
    set(h.radio, 'value', 0.0);
    hOn = findobj(h.radio, 'tag', sel);
    % 88 91
    % 89 91
    set(hOn, 'value', 1.0);
end % function
function update_cshtags(this)
    % 93 96
    % 94 96
    h = get(this, 'Handles');
    % 96 98
    tags = get(this, 'CSHTags');
    % 98 100
    for indx=1.0:min(length(tags), length(h.radio))
        cshelpcontextmenu(h.radio(indx), tags{indx}, 'fdatool');
        cshelpcontextmenu(h.popup(indx), tags{indx}, 'fdatool');
    end % for
end % function
