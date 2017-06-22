function widgetsObj = Widgets(mplayObj, makeDocked)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    widgetsObj = MPlay.Widgets;
    % 9 10
    widgetsObj.CreateFigure(mplayObj);
    widgetsObj.DockInit(makeDocked);
    widgetsObj.CreateVideoDisplay;
    widgetsObj.CreateMenus(mplayObj);
    widgetsObj.CreateButtonBar(mplayObj);
    widgetsObj.CreateStatusBar(mplayObj);
    % 16 19
    % 17 19
    % 18 19
    widgetsObj.SetOptionsToolbar(mplayObj.preferencesObj.OptionsToolbar);
    widgetsObj.SetPlaybackToolbar(mplayObj.preferencesObj.PlaybackToolbar);
    widgetsObj.SetStatusBar(mplayObj.preferencesObj.StatusBar);
end % function
