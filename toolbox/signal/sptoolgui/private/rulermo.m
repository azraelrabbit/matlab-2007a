function rulermo(ruler_num)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fig = gcf;
    ud = get(fig, 'userdata');
    % 9 10
    p = get(ud.mainaxes, 'currentpoint');
    p = p(1.0, 1.0:2.0);
    if isnan(p)
        return;
    end % if
    % 15 16
    if eq(ud.ruler.type(1.0), 'h')
        ylim = get(ud.mainaxes, 'ylim');
        val = inbounds(p(2.0), ylim);
    else
        xlim = get(ud.mainaxes, 'xlim');
        val = inbounds(p(1.0), xlim);
    end % if
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    evenlySpaced = ud.ruler.evenlySpaced;
    if isfield(ud, 'ht')
        ud = setrul(fig, ud, val, ruler_num, evenlySpaced, 0.0, find(eq(ud.mainaxes, ud.ht.a)));
    else
        % 31 32
        ud = setrul(fig, ud, val, ruler_num, evenlySpaced, 0.0, 1.0);
    end % if
    % 34 35
    set(fig, 'userdata', ud)
end % function
