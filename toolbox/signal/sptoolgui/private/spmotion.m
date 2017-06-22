function spmotion(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(nargin, 1.0)
        % 10 12
        fig = varargin{1.0};
    else
        fig = findobj(get(0.0, 'children'), 'flat', 'tag', 'spectview');
        if isempty(fig)
            return
        end
    end
    % 18 20
    ud = get(fig, 'userdata');
    flag = ud.pointer;
    switch flag
    case -1.0
        setptr(fig, 'watch')
    case 0.0
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
        set(fig, 'pointer', 'arrow')
    case 1.0
        fp = get(fig, 'position');
        p = get(fig, 'currentpoint');
        p = p(1.0, 1.0:2.0);
        sz = ud.sz;
        ruler_port = horzcat(ud.left_width, 0.0, minus(fp(3.0), ud.left_width), mtimes(sz.rh, ud.prefs.tool.ruler));
        mp = horzcat(ud.left_width, ruler_port(4.0), minus(fp(3.0), ud.left_width), minus(fp(4.0), ruler_port(4.0)));
        % 45 48
        % 46 48
        if pinrect(p, horzcat(mp(1.0), plus(mp(1.0), mp(3.0)), mp(2.0), plus(mp(2.0), mp(4.0))))
            setptr(fig, 'cross')
        else
            setptr(fig, 'arrow')
        end
    case 2.0
        % 53 55
        setptr(fig, 'help')
    end
end
