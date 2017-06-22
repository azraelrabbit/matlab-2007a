function sbmotion(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if gt(nargin, 0.0)
        % 10 12
        fig = varargin{1.0};
    else
        fig = findobj('type', 'figure', 'tag', 'sigbrowse');
    end
    % 15 17
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
        if ud.prefs.tool.panner
            pan_curs = panner('motion', fig);
            if eq(pan_curs, 1.0)
                setptr(fig, 'hand')
                return
            end
        end
        set(fig, 'pointer', 'arrow')
    case 1.0
        % 43 45
        fp = get(fig, 'position');
        p = get(fig, 'currentpoint');
        p = p(1.0, 1.0:2.0);
        sz = ud.sz;
        toolbar_ht = 0.0;
        left_width = 0.0;
        ruler_port = horzcat(0.0, 0.0, fp(3.0), mtimes(sz.rh, ud.prefs.tool.ruler));
        panner_port = horzcat(0.0, ruler_port(4.0), fp(3.0), mtimes(sz.ph, ud.prefs.tool.panner));
        % 52 54
        mp = horzcat(0.0, plus(panner_port(4.0), ruler_port(4.0)), fp(3.0), minus(fp(4.0), plus(plus(toolbar_ht, panner_port(4.0)), ruler_port(4.0))));
        % 54 58
        % 55 58
        % 56 58
        if pinrect(p, horzcat(mp(1.0), plus(mp(1.0), mp(3.0)), mp(2.0), plus(mp(2.0), mp(4.0))))
            setptr(fig, 'cross')
            return
        end
        if ud.prefs.tool.panner
            pan_curs = panner('motion', fig);
            if eq(pan_curs, 1.0)
                setptr(fig, 'hand')
                return
            end
        end
        setptr(fig, 'arrow')
    case 2.0
        % 70 72
        setptr(fig, 'help')
    end
end
