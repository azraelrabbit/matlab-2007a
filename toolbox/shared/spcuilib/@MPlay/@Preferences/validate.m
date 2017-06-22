function [success, err] = validate(preferencesObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    err = '';
    success = true;
    % 11 15
    % 12 15
    % 13 15
    len = str2double(preferencesObj.dialog.getWidgetValue('RecentSourcesListLength'));
    % 15 18
    % 16 18
    success = eq(len, fix(len)) && ge(len, 1.0) && le(len, 9.0);
    if not(success)
        err = 'Recent Sources List must have from 1 to 9 entries.';
    end
end
