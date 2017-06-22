function [mType, mCat] = getDialogTypeCat(hMessageLog)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    d = hMessageLog.dialog;
    % 12 14
    % 13 14
    mType = 'All';
    mCat = 'All';
    % 16 18
    % 17 18
    if isempty(d) || not(ishandle(d))
        return;
    end % if
    % 21 22
    idx = getWidgetValue(d, 'type');
    list = getUserData(d, 'type');
    mType = list{plus(idx, 1.0)};
    % 25 26
    idx = getWidgetValue(d, 'category');
    list = getUserData(d, 'category');
    mCat = list{plus(idx, 1.0)};
end % function
