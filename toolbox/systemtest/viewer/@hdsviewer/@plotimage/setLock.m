function setLock(h, currentPlotPanel, state)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    h.Locked = state;
    h.SrcListener.Enabled = state;
    % 9 10
    if strcmp(state, 'off')
        h.SrcListener.Enabled = 'on';
        awtinvoke(currentPlotPanel, 'resetStatus()');
        feval(h.SrcListener.callback{1.0}, [], [], h.SrcListener.callback{2.0:end})
    else
        h.SrcListener.Enabled = 'off';
        currentPlotPanel.updateStatus('Locked figure')
    end % if
    set(h.Figure, 'Color', mtimes([1.0 1.0 1.0], minus(1.0, mtimes(.2, strcmp(state, 'off')))));
    awtinvoke(currentPlotPanel, 'setEnabled', strcmp(state, 'off'));
end % function
