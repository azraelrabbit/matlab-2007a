function varargout = userdefinedmask(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    h = getcomponent(this, 'siggui.masklinedlg');
    % 8 10
    if isempty(h)
        h = siggui.masklinedlg;
        addcomponent(this, h);
        % 12 14
        opts_listener(this);
        % 14 16
        l = vertcat(handle.listener(h, 'DialogApplied', @apply_listener), handle.listener(this, this.findprop('UserDefinedMask'), 'PropertyPostSet', @opts_listener), handle.listener(this, 'NewPlot', @newplot_listener));
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        set(l, 'CallbackTarget', this);
        set(this, 'MaskListeners', l);
        % 23 25
        newplot_listener(this);
    end % if
    % 26 28
    if not(isrendered(h))
        render(h);
        centerdlgonfig(h, this);
    end % if
    % 31 33
    set(h, 'Visible', 'On');
    figure(h.FigureHandle);
    % 34 36
    if nargout
        varargout = cellhorzcat(h);
    end % if
end % function
function newplot_listener(this, eventData)
    % 40 43
    % 41 43
    hdlg = getcomponent(this, 'siggui.masklinedlg');
    if not(strcmpi(this.Analysis, 'magnitude'))
        close(hdlg);
        return;
    end % if
    % 47 49
    eu = getappdata(this.Handles.axes(2.0), 'EngUnitsFactor');
    % 49 51
    units = 'Hz';
    if not(isempty(eu))
        % 52 55
        % 53 55
        units = getunits(this.CurrentAnalysis);
        % 55 57
        if isempty(units)
            units = 'Hz';
        end % if
        set(hdlg, 'FrequencyUnits', units);
    end % if
end % function
function opts_listener(this, eventData)
    % 63 66
    % 64 66
    hdlg = getcomponent(this, '-class', 'siggui.masklinedlg');
    opts = get(this, 'UserDefinedMask');
    if not(isempty(opts))
        setmaskline(hdlg, opts);
    end % if
end % function
function apply_listener(this, eventData)
    % 72 75
    % 73 75
    h = get(eventData, 'Source');
    % 75 77
    set(this, 'UserDefinedMask', getmaskline(h));
end % function
