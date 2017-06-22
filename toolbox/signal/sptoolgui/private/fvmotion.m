function fvmotion(toolnum)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    figname = prepender('Filter Viewer');
    fig = findobj('name', figname);
    if isempty(fig)
        return
    end
    ud = get(fig, 'userdata');
    % 14 16
    switch ud.pointer
    case 0.0
        ptr = 'arrow';
        if ud.prefs.tool.ruler
            ruler_curs = ruler('motion', fig);
            if eq(ruler_curs, 1.0)
                setptr(fig, 'hand1')
                return
            else
                if eq(ruler_curs, 2.0)
                    setptr(fig, 'hand2')
                    return
                end
            end
        end
    case 1.0
        fp = get(fig, 'position');
        sz = ud.sz;
        ruler_port = horzcat(ud.left_width, 0.0, minus(fp(3.0), ud.left_width), mtimes(sz.rh, ud.prefs.tool.ruler));
        mp = horzcat(ud.left_width, ruler_port(4.0), minus(fp(3.0), ud.left_width), minus(fp(4.0), ruler_port(4.0)));
        pt = get(fig, 'currentpoint');
        if pinrect(pt(1.0, 1.0:2.0), horzcat(mp(1.0), plus(mp(1.0), mp(3.0)), mp(2.0), plus(mp(2.0), mp(4.0))))
            ptr = 'cross';
        else
            ptr = 'arrow';
        end
    case 2.0
        ptr = 'help';
    case -1.0
        ptr = 'watch';
    otherwise
        ptr = 'arrow';
    end
    % 48 50
    setptr(fig, ptr)
end
