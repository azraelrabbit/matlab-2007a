function refresh(h, filterCtrl)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if not(isempty(h.SelectedFigure)) && ishandle(h.SelectedFigure)
        wp = getappdata(h.SelectedFigure, 'Waveplot');
        if not(isempty(wp))
            h.jHandle.fcurrentPanel.faxesCombosPanel.setVarSizes(wp.createVarSizeTable(filterCtrl));
        end % if
    end % if
end % function
