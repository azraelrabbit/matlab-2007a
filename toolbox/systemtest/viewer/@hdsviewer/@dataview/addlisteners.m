function addlisteners(this, listeners)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 1.0)
        % 8 10
        generic_listeners(this)
        % 10 13
        % 11 13
        L1 = handle.listener(this, 'ObjectBeingDestroyed', @LocalCleanUp);
        % 13 17
        % 14 17
        % 15 17
        LocalSrcChgListener(this);
        L2 = handle.listener(this, this.findprop('DataSrc'), 'PropertyPostSet', @LocalSrcChgListener);
        % 18 22
        % 19 22
        % 20 22
        L3 = handle.listener(this, this.findprop('Visible'), 'PropertyPostSet', @LocalVisible);
        % 22 26
        % 23 26
        % 24 26
        listeners = vertcat(L1, L2, L3);
        set(listeners, 'CallbackTarget', this);
    end % if
    % 28 30
    this.Listeners = vertcat(horzcat(this.Listeners), listeners);
end % function
function LocalSrcChgListener(this, eventdata)
    % 32 42
    % 33 42
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    delete(this.DataSrcListener);
    if not(isempty(this.DataSrc))
        this.DataSrcListener = handle.listener(this.DataSrc, 'SourceChanged', @LocalRedraw);
        % 44 46
        this.DataSrcListener.CallbackTarget = this;
    else
        this.DataSrcListener = [];
    end % if
end % function
function LocalRedraw(this, eventdata)
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    set(this.DataChangedListener, 'Enable', 'off')
    % 56 59
    % 57 59
    clear(this.Data)
    % 59 62
    % 60 62
    if strcmp(this.Visible, 'on') && strcmp(this.Parent.Visible, 'on')
        draw(this)
        % 63 65
        this.Parent.AxesGrid.send('ViewChanged')
    end % if
    % 66 69
    % 67 69
    set(this.DataChangedListener, 'Enable', 'on')
end % function
function LocalVisible(this, eventdata)
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    refresh(this)
    % 76 78
    if isvisible(this)
        draw(this)
    else
        this.Parent.AxesGrid.send('ViewChanged');
    end % if
end % function
function LocalCleanUp(this, eventdata)
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    delete(this.Group(ishandle(this.Group)))
    if ishandle(this.Parent) && not(this.Parent.isBeingDestroyed)
        this.Parent.refreshLegends;
    end % if
end % function
