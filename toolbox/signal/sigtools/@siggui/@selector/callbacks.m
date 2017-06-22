function cbs = callbacks(hSct)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    cbs.radio = @radio_cb;
    cbs.popup = @popup_cb;
end % function
function radio_cb(hcbo, eventStruct, hSct)
    % 14 16
    % 15 16
    h = get(hSct, 'Handles');
    % 17 18
    set(setdiff(h.radio, hcbo), 'Value', 0.0);
    set(hcbo, 'Value', 1.0);
    % 20 21
    tag = get(hcbo, 'Tag');
    % 22 24
    % 23 24
    set(hSct, 'selection', tag);
end % function
function popup_cb(hcbo, eventStruct, hSct)
    % 27 29
    % 28 29
    tag = get(hcbo, 'Tag');
    tags = get(hcbo, 'UserData');
    indx = get(hcbo, 'Value');
    % 32 33
    h = get(hSct, 'Handles');
    % 34 35
    hon = findobj(h.radio, 'tag', tag);
    set(setdiff(h.radio, hon), 'Value', 0.0);
    set(hon, 'Value', 1.0);
    % 38 40
    % 39 40
    set(hSct, 'selection', tag);
    % 41 43
    % 42 43
    set(hSct, 'subselection', tags{indx});
end % function
