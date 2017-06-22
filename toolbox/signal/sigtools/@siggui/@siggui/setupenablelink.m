function setupenablelink(this, prop, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    error(nargchk(4.0, Inf, nargin));
    % 14 17
    % 15 17
    l = handle.listener(this, this.findprop(prop), 'PropertyPostSet', cellhorzcat(@lclenablelink_listener, varargin{:}));
    % 17 20
    % 18 20
    set(l, 'CallbackTarget', this);
    if not(isempty(this.WhenRenderedListeners))
        l = vertcat(l, this.WhenRenderedListeners(:));
    end % if
    set(this, 'WhenRenderedListeners', l);
    % 24 26
    db = get(this, 'LinkDatabase');
    % 26 28
    newdb.prop = prop;
    newdb.enabvalue = varargin{1.0};
    newdb.linkedprops = varargin(2.0:end);
    % 30 32
    if isempty(db)
        db = newdb;
    else
        db = horzcat(db, newdb);
    end % if
    % 36 38
    set(this, 'LinkDataBase', db);
    % 38 41
    % 39 41
    enablelink_listener(this, prop, varargin{:});
end % function
function lclenablelink_listener(varargin)
    % 43 46
    % 44 46
    enablelink_listener(varargin{:});
end % function
