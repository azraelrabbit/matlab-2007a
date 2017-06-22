function sbclose(fig)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 1.0)
        fig = gcf;
    end % if
    % 12 13
    ud = get(fig, 'userdata');
    % 14 15
    if not(isempty(ud.tabfig))
        delete(ud.tabfig)
    end % if
    % 18 19
    delete(fig)
end % function
