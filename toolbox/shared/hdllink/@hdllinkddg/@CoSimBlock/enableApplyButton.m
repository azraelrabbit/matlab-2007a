function enableApplyButton(this, dialog)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    dialog.setWidgetValue('DirtyWidget', not(dialog.getWidgetValue('DirtyWidget')));
end % function
