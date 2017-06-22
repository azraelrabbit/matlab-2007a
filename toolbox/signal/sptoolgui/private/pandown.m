function pandown(pflag)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    fig = gcf;
    % 10 12
    ud = get(fig, 'userdata');
    % 12 14
    % 13 15
    if (~(strcmp(get(fig, 'pointer'), 'custom'))) | (~((eq(ud.pointer, 0.0)) | (eq(ud.pointer, 1.0))))
        % 15 18
        % 16 18
        if eq(ud.pointer, 2.0)
            spthelp('exit', 'pandown', num2str(pflag))
        end
        return
    end
    % 22 24
    if ~(isempty(ud.lines))
        invis = [];
        if ud.prefs.tool.ruler
            invis = ctranspose(horzcat(ud.ruler.lines, ud.ruler.markers, ud.ruler.hand.buttons));
        end
        if strcmp(get(ud.toolbar.complex, 'enable'), 'on')
            switch get(ud.toolbar.complex, 'userdata')
            case 1.0
                xform = 'real';
            case 2.0
                xform = 'imag';
            case 3.0
                xform = 'abs';
            case 4.0
                xform = 'angle';
            end
        else
            xform = 'real';
        end
        if panfcn('Ax', ud.mainaxes, 'Bounds', ud.limits, 'BorderAxes', ud.mainaxes_border, 'DirectFlag', 0.0, 'Data', ud.lines, 'PannerPatch', ud.panner.panpatch, 'DynamicDrag', ud.prefs.panner.dynamicdrag, 'Transform', xform, 'Invisible', invis)
            % 43 48
            % 44 48
            % 45 48
            % 46 48
            if ud.prefs.tool.ruler
                ruler('newlimits')
            end
        end
    end
end
