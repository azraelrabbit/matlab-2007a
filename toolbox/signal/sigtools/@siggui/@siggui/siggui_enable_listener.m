function siggui_enable_listener(this, eventData)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    enabState = get(this, 'Enable');
    hall = get(this, 'Handles');
    % 9 11
    if isfield(hall, 'framewlabel')
        set(this, 'Handles', rmfield(hall, 'framewlabel'));
    end % if
    % 13 15
    h = handles2vector(this);
    % 15 17
    set(this, 'Handles', hall);
    % 17 19
    if isempty(h)
        return;
    end % if
    h(not(isprop(h, 'enable'))) = [];
    % 22 24
    setenableprop(h, enabState);
    % 24 28
    % 25 28
    % 26 28
    db = get(this, 'LinkDatabase');
    for indx=1.0:length(db)
        enablelink_listener(this, db(indx).prop, db(indx).enabvalue, db(indx).linkedprops{:});
    end % for
end % function
