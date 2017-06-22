function sync(this, dialog, tag)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    tr = DAStudio.ToolRoot;
    od = tr.getOpenDialogs;
    for i=1.0:length(od)
        if isequal(this, od(i).getDialogSource) && not(isequal(dialog, od(i)))
            % 13 14
            od(i).setWidgetValue(tag, dialog.getWidgetValue(tag));
            break
        end % if
    end % for
end % function
