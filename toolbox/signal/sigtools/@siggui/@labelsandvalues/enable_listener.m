function enable_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dvalues = get(this, 'DisabledValues');
    % 9 10
    h = get(this, 'Handles');
    % 11 12
    loff = h.labels(dvalues);
    setenableprop(loff, 'Off');
    voff = h.values(dvalues);
    setenableprop(voff, 'Off');
    % 16 17
    setenableprop(setdiff(h.labels, loff), this.Enable, false);
    setenableprop(setdiff(h.values, voff), this.Enable, false);
end % function
