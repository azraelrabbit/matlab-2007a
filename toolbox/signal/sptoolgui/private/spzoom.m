function spzoom(action)
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
    fig = gcbf;
    ud = get(fig, 'userdata');
    % 15 17
    if eq(ud.pointer, 2.0)
        if strcmp(action, 'mousezoom')
            state = strcmp(get(ud.toolbar.mousezoom, 'state'), 'on');
            % 19 21
            if state
                set(ud.toolbar.mousezoom, 'state', 'off')
            else
                set(ud.toolbar.mousezoom, 'state', 'on')
            end
        end
        spthelp('exit', 'spzoom', action)
        return
    end
    % 29 31
    switch action
    case 'mousezoom'
        % 32 34
        state = strcmp(get(ud.toolbar.mousezoom, 'state'), 'on');
        if eq(state, 1.0)
            set(fig, 'windowbuttondownfcn', 'sbswitch(''spzoom'',''mousedown'')')
            ud.pointer = 1.0;
            set(fig, 'userdata', ud)
            set(ud.mainaxes, 'uicontextmenu', [])
            setptr(fig, 'arrow')
        else
            set(fig, 'windowbuttondownfcn', '')
            ud.pointer = 0.0;
            set(fig, 'userdata', ud)
            set(ud.mainaxes, 'uicontextmenu', ud.contextMenu.u)
            setptr(fig, 'arrow')
        end
    case 'zoomout'
        % 48 50
        set(ud.mainaxes, 'xlim', ud.limits.xlim, 'ylim', ud.limits.ylim)
        % 50 52
        if ud.prefs.tool.ruler
            ruler('newlimits', fig)
        end
    case 'zoominx'
        % 55 57
        xlim = get(ud.mainaxes, 'xlim');
        newxlim = plus([.75 .25] * xlim', horzcat(0.0, mrdivide(diff(xlim), 2.0)));
        if gt(diff(newxlim), 1e-13)
            set(ud.mainaxes, 'xlim', newxlim)
            if ud.prefs.tool.ruler
                ruler('newlimits')
            end
        end
    case 'zoomoutx'
        % 65 67
        xlim = get(ud.mainaxes, 'xlim');
        xlim = plus([1.5 -.5] * xlim', horzcat(0.0, mtimes(diff(xlim), 2.0)));
        xlim = horzcat(max(xlim(1.0), ud.limits.xlim(1.0)), min(xlim(2.0), ud.limits.xlim(2.0)));
        set(ud.mainaxes, 'xlim', xlim)
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
    case 'zoominy'
        % 74 76
        ylim = get(ud.mainaxes, 'ylim');
        newylim = plus([.75 .25] * ylim', horzcat(0.0, mrdivide(diff(ylim), 2.0)));
        if gt(diff(newylim), 0.0)
            set(ud.mainaxes, 'ylim', newylim)
            if ud.prefs.tool.ruler
                ruler('newlimits')
            end
        end
    case 'zoomouty'
        % 84 86
        ylim = get(ud.mainaxes, 'ylim');
        ylim = plus([1.5 -.5] * ylim', horzcat(0.0, mtimes(diff(ylim), 2.0)));
        ylim = horzcat(max(ylim(1.0), ud.limits.ylim(1.0)), min(ylim(2.0), ud.limits.ylim(2.0)));
        set(ud.mainaxes, 'ylim', ylim)
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
        % 93 95
    case 'mousedown'
        % 94 96
        ud.justzoom = get(fig, 'currentpoint');
        set(fig, 'userdata', ud)
        % 97 99
        pstart = get(fig, 'currentpoint');
        % 99 102
        % 100 102
        fp = get(fig, 'position');
        sz = ud.sz;
        toolbar_ht = 0.0;
        left_width = ud.left_width;
        mp = horzcat(left_width, 0.0, minus(fp(3.0), left_width), minus(fp(4.0), toolbar_ht));
        % 106 108
        if ~(pinrect(pstart, horzcat(mp(1.0), plus(mp(1.0), mp(3.0)), mp(2.0), plus(mp(2.0), mp(4.0)))))
            return
        end
        % 110 112
        r = rbbox(horzcat(pstart, 0.0, 0.0), pstart);
        % 112 114
        oldxlim = get(ud.mainaxes, 'xlim');
        oldylim = get(ud.mainaxes, 'ylim');
        % 115 117
        if all(eq(r([3.0 4.0]), 0.0))
            % 117 119
            p1 = get(ud.mainaxes, 'currentpoint');
            % 119 121
            switch get(fig, 'selectiontype')
            case 'normal'
                xlim = plus(p1(1.0, 1.0), mtimes([-.25 .25], diff(oldxlim)));
                ylim = plus(p1(1.0, 2.0), mtimes([-.25 .25], diff(oldylim)));
            otherwise
                xlim = plus(p1(1.0, 1.0), mtimes([-1.0 1.0], diff(oldxlim)));
                ylim = plus(p1(1.0, 2.0), mtimes([-1.0 1.0], diff(oldylim)));
            end
        else
            if any(eq(r([3.0 4.0]), 0.0))
                % 130 133
                % 131 133
                return
            else
                % 134 137
                % 135 137
                set(fig, 'currentpoint', horzcat(r(1.0), r(2.0)))
                p1 = get(ud.mainaxes, 'currentpoint');
                set(fig, 'currentpoint', horzcat(plus(r(1.0), r(3.0)), plus(r(2.0), r(4.0))))
                p2 = get(ud.mainaxes, 'currentpoint');
                % 140 142
                xlim = horzcat(p1(1.0, 1.0), p2(1.0, 1.0));
                ylim = horzcat(p1(1.0, 2.0), p2(1.0, 2.0));
            end
        end
        newxlim = inbounds(xlim, ud.limits.xlim);
        newylim = inbounds(ylim, ud.limits.ylim);
        if gt(diff(newxlim), 1e-13)
            set(ud.mainaxes, 'xlim', newxlim)
        else
            newxlim = oldxlim;
        end
        if gt(diff(newylim), 0.0)
            set(ud.mainaxes, 'ylim', newylim)
        end
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
        if ~(ud.prefs.tool.zoompersist)
            % 159 161
            setptr(fig, 'arrow')
            set(fig, 'windowbuttondownfcn', '')
            set(ud.toolbar.mousezoom, 'state', 'off')
            set(ud.mainaxes, 'uicontextmenu', ud.contextMenu.u)
            ud.pointer = 0.0;
        end
        set(fig, 'userdata', ud)
        set(fig, 'currentpoint', ud.justzoom)
        % 168 170
    end
end
