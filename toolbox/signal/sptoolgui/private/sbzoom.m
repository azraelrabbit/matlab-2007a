function sbzoom(action)
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
        spthelp('exit', 'sbzoom', action)
        return
    end
    % 29 31
    switch action
    case 'mousezoom'
        % 32 34
        state = strcmp(get(ud.toolbar.mousezoom, 'state'), 'on');
        if eq(state, 1.0)
            set(fig, 'windowbuttondownfcn', 'sbswitch(''sbzoom'',''mousedown'')')
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
        if ud.prefs.tool.panner
            panner('zoom', ud.limits.xlim, ud.limits.ylim)
        end
        set(ud.mainaxes, 'xlim', ud.limits.xlim, 'ylim', ud.limits.ylim)
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
    case 'zoominx'
        % 57 59
        xlim = get(ud.mainaxes, 'xlim');
        newxlim = plus([.75 .25] * xlim', horzcat(0.0, mrdivide(diff(xlim), 2.0)));
        % 60 62
        if ud.prefs.tool.panner
            panner('zoom', newxlim, get(ud.mainaxes, 'ylim'))
        end
        set(ud.mainaxes, 'xlim', newxlim)
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
        % 69 71
    case 'zoomoutx'
        % 70 72
        xlim = get(ud.mainaxes, 'xlim');
        xlim = plus([1.5 -.5] * xlim', horzcat(0.0, mtimes(diff(xlim), 2.0)));
        xlim = horzcat(max(xlim(1.0), ud.limits.xlim(1.0)), min(xlim(2.0), ud.limits.xlim(2.0)));
        if ud.prefs.tool.panner
            panner('zoom', xlim, get(ud.mainaxes, 'ylim'))
        end
        set(ud.mainaxes, 'xlim', xlim)
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
    case 'zoominy'
        % 82 84
        ylim = get(ud.mainaxes, 'ylim');
        newylim = plus([.75 .25] * ylim', horzcat(0.0, mrdivide(diff(ylim), 2.0)));
        if gt(diff(newylim), 0.0)
            if ud.prefs.tool.panner
                panner('zoom', get(ud.mainaxes, 'xlim'), newylim)
            end
            set(ud.mainaxes, 'ylim', newylim)
            if ud.prefs.tool.ruler
                ruler('newlimits')
            end
        end
    case 'zoomouty'
        % 95 97
        ylim = get(ud.mainaxes, 'ylim');
        ylim = plus([1.5 -.5] * ylim', horzcat(0.0, mtimes(diff(ylim), 2.0)));
        ylim = horzcat(max(ylim(1.0), ud.limits.ylim(1.0)), min(ylim(2.0), ud.limits.ylim(2.0)));
        if ud.prefs.tool.panner
            panner('zoom', get(ud.mainaxes, 'xlim'), ylim)
        end
        set(ud.mainaxes, 'ylim', ylim)
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
        % 107 109
    case 'mousedown'
        % 108 110
        ud.justzoom = get(fig, 'currentpoint');
        set(fig, 'userdata', ud)
        % 111 113
        pstart = get(fig, 'currentpoint');
        % 113 116
        % 114 116
        fp = get(fig, 'position');
        sz = ud.sz;
        toolbar_ht = 0.0;
        left_width = 0.0;
        panner_port = horzcat(left_width, 0.0, minus(fp(3.0), plus(left_width, mtimes(sz.rw, ud.prefs.tool.ruler))), mtimes(sz.ph, ud.prefs.tool.panner));
        % 120 122
        mp = horzcat(left_width, panner_port(4.0), minus(fp(3.0), plus(left_width, mtimes(sz.rw, ud.prefs.tool.ruler))), minus(fp(4.0), plus(toolbar_ht, panner_port(4.0))));
        % 122 126
        % 123 126
        % 124 126
        if ~(pinrect(pstart, horzcat(mp(1.0), plus(mp(1.0), mp(3.0)), mp(2.0), plus(mp(2.0), mp(4.0)))))
            return
        end
        % 128 130
        r = rbbox(horzcat(pstart, 0.0, 0.0), pstart);
        % 130 132
        oldxlim = get(ud.mainaxes, 'xlim');
        oldylim = get(ud.mainaxes, 'ylim');
        % 133 135
        if all(eq(r([3.0 4.0]), 0.0))
            % 135 137
            p1 = get(ud.mainaxes, 'currentpoint');
            % 137 139
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
                % 148 151
                % 149 151
                return
            else
                % 152 155
                % 153 155
                set(fig, 'currentpoint', horzcat(r(1.0), r(2.0)))
                p1 = get(ud.mainaxes, 'currentpoint');
                set(fig, 'currentpoint', horzcat(plus(r(1.0), r(3.0)), plus(r(2.0), r(4.0))))
                p2 = get(ud.mainaxes, 'currentpoint');
                % 158 160
                xlim = horzcat(p1(1.0, 1.0), p2(1.0, 1.0));
                ylim = horzcat(p1(1.0, 2.0), p2(1.0, 2.0));
            end
        end
        newxlim = inbounds(xlim, ud.limits.xlim);
        newylim = inbounds(ylim, ud.limits.ylim);
        if gt(diff(newxlim), 1e-30)
            if ud.prefs.tool.panner
                panner('zoom', newxlim, oldylim)
            end
            set(ud.mainaxes, 'xlim', newxlim)
        else
            newxlim = oldxlim;
        end
        if gt(diff(newylim), 0.0)
            if ud.prefs.tool.panner
                panner('zoom', newxlim, newylim)
            end
            set(ud.mainaxes, 'ylim', newylim)
        end
        if ud.prefs.tool.ruler
            ruler('newlimits')
        end
        if ~(ud.prefs.tool.zoompersist)
            setptr(fig, 'arrow')
            set(fig, 'windowbuttondownfcn', '')
            % 185 187
            set(ud.toolbar.mousezoom, 'state', 'off')
            set(ud.mainaxes, 'uicontextmenu', ud.contextMenu.u)
            ud.pointer = 0.0;
        end
        set(fig, 'userdata', ud)
        set(fig, 'currentpoint', ud.justzoom)
        % 192 194
    end
end
