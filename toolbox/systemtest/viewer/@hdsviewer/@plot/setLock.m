function setLock(h, currentPlotPanel, state)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if isempty(h.Waves)
        return;
    end % if
    set(h.AxesGrid.Parent, 'Pointer', 'watch')
    drawnow
    h.Locked = state;
    if strcmp(state, 'off')
        awtinvoke(currentPlotPanel, 'resetStatus()');
        for k=1.0:length(h.Waves)
            h.waves(k).View.setselect(h.waves(k).DataSrc.FilterControl.selectedgridpoint);
            h.waves(k).DataSrc.SrcListener.Enabled = 'on';
            h.waves(k).SelectionListener.Enabled = 'on';
            % 18 19
            h.waves(k).DataSrc.send('sourcechange');
        end % for
    else
        tb = findall(h.AxesGrid.Parent, 'type', 'uitoolbar');
        if not(isempty(tb))
            selectTB = findall(tb, 'tag', 'SystemTest.Select');
            if not(isempty(selectTB))
                set(selectTB, 'State', 'off')
            end % if
        end % if
        currentPlotPanel.updateStatus('Locked figure')
        for k=1.0:length(h.Waves)
            h.waves(k).View.setselect(NaN);
            h.waves(k).DataSrc.SrcListener.Enabled = 'off';
            h.waves(k).SelectionListener.Enabled = 'off';
        end % for
    end % if
    set(h.AxesGrid.Parent, 'Color', mtimes([1.0 1.0 1.0], minus(1.0, mtimes(.2, strcmp(state, 'off')))));
    awtinvoke(currentPlotPanel, 'setEnabled', strcmp(state, 'off'));
    set(h.AxesGrid.Parent, 'Pointer', 'arrow')
end % function
