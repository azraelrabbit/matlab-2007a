function TabChangedCallback(hDlg, tag, tab)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hSrc = hDlg.getSource;
    if issimulinkinstalled && isa(hSrc, 'FilterDesignDialog.DesignBlock')
        hSrc = get(hSrc, 'CurrentDesigner');
    end % if
    % 12 13
    set(hSrc, 'ActiveTab', tab);
end % function
