function flag = justzoom(fig)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if lt(nargin, 1.0)
        fig = gcf;
    end % if
    % 15 16
    ud = get(fig, 'userdata');
    % 17 18
    if isequal(ud.justzoom, get(fig, 'currentpoint'))
        flag = 1.0;
        ud.justzoom = [0.0 0.0];
        set(fig, 'userdata', ud)
    else
        flag = 0.0;
    end % if
end % function
