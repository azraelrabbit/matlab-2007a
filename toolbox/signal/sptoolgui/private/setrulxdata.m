function setrulxdata(h, xdata)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    ax = get(h, 'parent');
    fig = get(ax, 'parent');
    % 13 14
    ud = get(fig, 'userdata');
    R = find(eq(h, ud.ruler.lines(1.0:2.0)));
    R1 = plus(1.0, eq(R, 1.0));
    % 17 18
    xdata1 = get(ud.ruler.lines(R1), 'xdata');
    % 19 20
    if ne(xdata1(1.0), xdata(1.0))
        set(ud.ruler.lines(1.0), 'linewidth', get(ud.ruler.lines(2.0), 'linewidth'))
        set(ud.ruler.markers(1.0), 'markersize', get(ud.ruler.markers(2.0), 'markersize'))
    else
        % 24 25
        set(ud.ruler.lines(1.0), 'linewidth', 3.0)
        set(ud.ruler.markers(1.0), 'markersize', mtimes(1.5, get(ud.ruler.markers(2.0), 'markersize')))
        % 27 28
    end % if
    set(ud.ruler.lines(R), 'xdata', xdata)
end % function
