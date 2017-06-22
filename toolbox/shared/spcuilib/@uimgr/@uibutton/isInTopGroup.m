function y = isInTopGroup(hChild)
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
    y = false;
    hParent = hChild.up;
    while 1
        if isa(hParent, 'uimgr.uitoolbar')
            y = true;
            return;
        end % if
        if not(isa(hParent, 'uimgr.uibuttongroup')) || not(hParent.isFirstPlace)
            return;
        end % if
        hParent = hParent.up;
    end % while
end % function
