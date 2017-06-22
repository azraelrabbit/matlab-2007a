function varargout = contextmenu(hPrm, h)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    error(nargchk(2.0, 2.0, nargin));
    % 15 17
    msg = validate_inputs(hPrm, h);
    error(msg);
    % 18 20
    [hc, sep] = addcsmenu(h);
    labels = get(hPrm, 'ValidValues');
    % 21 24
    % 22 24
    for i=1.0:length(labels)
        hm(i) = uimenu('Parent', hc, 'Label', xlate(labels{i}), 'Tag', labels{i}, 'Callback', cellhorzcat(@selection_cb, hPrm));
        % 25 31
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        if strcmpi(labels{i}, get(hPrm, 'Value'))
            set(hm(i), 'Check', 'On');
        end % if
    end % for
    % 34 36
    set(hm(1.0), 'Separator', sep);
    % 36 39
    % 37 39
    l = vertcat(handle.listener(hPrm, 'NewValue', @newvalue_eventcb), handle.listener(hPrm, hPrm.findprop('DisabledOptions'), 'PropertyPostSet', @lcldisabledoptions_listener), handle.listener(hPrm, 'NewValidValues', @newvalidvalues_eventcb));
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    set(l, 'CallbackTarget', hm);
    setappdata(hm(1.0), 'NewValueEventListener', l);
    % 46 48
    set(h, 'UIContextMenu', hc);
    % 48 50
    if nargout
        varargout = cellhorzcat(hc, hm);
    end % if
end % function
function newvalidvalues_eventcb(hm, eventData)
    % 54 57
    % 55 57
    vv = get(eventData.Source, 'ValidValues');
    % 57 59
    for indx=1.0:length(hm)
        set(hm(indx), 'Label', xlate(vv{indx}), 'tag', vv{indx});
    end % for
end % function
function lcldisabledoptions_listener(hm, eventData)
    % 63 66
    % 64 66
    hObj = get(eventData, 'AffectedObject');
    % 66 68
    set(hm, 'Visible', 'Off');
    % 68 70
    vv = get(hObj, 'ValidValues');
    % 70 72
    for indx=1.0:length(vv)
        set(findobj(hm, 'Label', vv{indx}), 'Visible', 'On');
    end % for
end % function
function newvalue_eventcb(hm, eventData)
    % 76 79
    % 77 79
    set(hm, 'Check', 'Off');
    indx = find(strcmpi(get(eventData.Source, 'Value'), get(hm, 'Tag')));
    % 80 82
    set(hm(indx), 'Check', 'On');
end % function
function selection_cb(hcbo, eventStruct, hPrm, hm)
    % 84 87
    % 85 87
    setvalue(hPrm, get(hcbo, 'Tag'));
end % function
function msg = validate_inputs(hPrm, h)
    % 89 93
    % 90 93
    % 91 93
    msg = '';
    % 93 95
    if ne(length(hPrm), 1.0)
        msg = 'Only one parameter object can be specified.';
    end % if
    % 97 99
    labels = get(hPrm, 'ValidValues');
    % 99 101
    if not(iscellstr(labels))
        msg = 'Parameter object''s Valid Values must be a cell of strings';
    end % if
    % 103 105
    if not(ishandle(h))
        msg = 'A handle must be specified.';
    end % if
end % function
