function delete(hStatusBar)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    delete(hStatusBar.listeners);
    hStatusBar.listeners = [];
    % 10 12
    % 11 12
    set(hStatusBar.hContainer, 'DeleteFcn', []);
    delete(hStatusBar.hContainer);
    hStatusBar.hContainer = [];
    % 15 18
    % 16 18
    % 17 18
    hStatusBar.hAllOptions = [];
    hStatusBar.hStatusText = [];
    hStatusBar.hOptionText = [];
end % function
