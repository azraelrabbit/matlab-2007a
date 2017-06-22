function updateDialog(src, dlg, widget_type, tag, entries)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    slDialogUtil(src, 'sync', dlg, widget_type, tag);
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    value = dlg.getWidgetValue(tag);
    switch widget_type
    case 'checkbox'
        if value
            value = 'on';
        else
            value = 'off';
        end % if
    case 'combobox'
        value = entries{plus(value, 1.0)};
    end % switch
    % 26 28
    [enabled, disabled] = src.UpdateCallback(src, tag, value);
    for i=1.0:length(enabled)
        dlg.setEnabled(enabled{i}, 1.0);
    end % for
    for i=1.0:length(disabled)
        dlg.setEnabled(disabled{i}, 0.0);
    end % for
