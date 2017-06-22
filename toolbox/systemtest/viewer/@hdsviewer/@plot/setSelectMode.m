function setSelectMode(h, filterCtrl, status)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmp(status, 'off')
        filterCtrl.Selectedgridpoint = NaN;
    else
        tb = findall(h.AxesGrid.Parent, 'Type', 'uitoolbar');
        if not(isempty(tb))
            lockTB = findall(tb, 'Tag', 'SystemTest.Lock');
            if not(isempty(lockTB))
                set(lockTB, 'State', 'off')
            end % if
        end % if
    end % if
    for k=1.0:length(h.Waves)
        h.Waves(k).View.SelectionMode = status;
    end % for
end % function
