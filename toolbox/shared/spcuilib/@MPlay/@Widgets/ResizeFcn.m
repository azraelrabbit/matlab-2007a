function ResizeFcn(widgetsObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    widgetsObj.hStatusBar.ResizeFcn;
    % 11 13
    % 12 13
    MoveScrollPanel(widgetsObj);
    % 14 16
    % 15 16
    widgetsObj.FitToView;
    % 17 19
    % 18 19
    if widgetsObj.ScreenMsg
        widgetsObj.ScreenMsg(true);
    end % if
end % function
function MoveScrollPanel(widgetsObj)
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    isVis = strcmp(widgetsObj.hStatusBar.Visible, 'on');
    if isVis
        hf = widgetsObj.hStatusBar.hRegionFrame;
        set(hf, 'unit', 'pix');
        bottomPanelPos = get(hf, 'pos');
    else
        bottomPanelPos = zeros(1.0, 4.0);
    end % if
    % 37 39
    % 38 39
    hSP = widgetsObj.hScrollPanel;
    if not(isempty(hSP))
        set(widgetsObj.hfig, 'units', 'pix');
        figPos = get(widgetsObj.hfig, 'pos');
        % 43 44
        spB = plus(bottomPanelPos(4.0), 1.0);
        spH = minus(figPos(4.0), bottomPanelPos(4.0));
        sp_pos = horzcat(1.0, spB, figPos(3.0), spH);
        % 47 48
        set(hSP, 'units', 'pix', 'pos', sp_pos);
    end % if
end % function
