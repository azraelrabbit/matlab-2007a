function y = isInTopGroup(hChild)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    y = false;
    hParent = hChild.up;
        while isa(hParent, 'uimgr.uimenugroup')
        if not(isempty(hParent.WidgetFcn))
            y = true;
            return;
        end % if
        if not(hParent.isFirstPlace)
            return;
        end % if
        hParent = hParent.up;
    end % while
end % function
