function varargout = export(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hXP = getcomponent(this, '-class', 'sigio.export');
    % 8 10
    if isempty(hXP)
        % 10 13
        % 11 13
        hXP = sigio.export(getfilter(this));
        % 13 16
        % 14 16
        set(hXP, 'CSHelpTag', 'fdatool_exportto_frame');
        % 16 18
        if eq(this.launchedBySPTool, true)
            set(hXP, 'ExcludeItem', 'SPTool');
        end % if
        % 20 22
        addcomponent(this, hXP);
        hU = siggetappdata(this.FigureHandle, 'siggui', 'undomanager', 'handle');
        l = horzcat(handle.listener(this, 'FilterUpdated', cellhorzcat(@local_filter_listener, this)), handle.listener(hU, 'UndoPerformed', cellhorzcat(@local_filter_listener, this)), handle.listener(hU, 'RedoPerformed', cellhorzcat(@local_filter_listener, this)));
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        set(l, 'CallbackTarget', hXP);
        p = schema.prop(hXP, 'fdatool_filter_listener', 'handle.listener vector');
        set(hXP, 'fdatool_filter_listener', l);
        set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    end % if
    % 33 36
    % 34 36
    if not(isrendered(hXP))
        render(hXP);
        fdaddcontextmenu(hXP.FigureHandle, handles2vector(hXP), 'fdatool_exportto_frame');
        centerdlgonfig(hXP, this);
    end % if
    % 40 42
    set(hXP, 'Visible', 'On');
    figure(hXP.FigureHandle);
    % 43 45
    if nargout
        varargout = cellhorzcat(hXP);
    end % if
end % function
function local_filter_listener(hXP, eventData, this)
    % 49 52
    % 50 52
    filtobj = getfilter(this);
    % 52 54
    if not(isequal(filtobj, hXP.Data.elementat(1.0)))
        hXP.Data = filtobj;
    end % if
end % function
