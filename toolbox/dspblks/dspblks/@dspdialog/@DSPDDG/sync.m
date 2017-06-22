function sync(this, dialog, tag)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    tr = DAStudio.ToolRoot;
    od = tr.getOpenDialogs;
    for i=1.0:length(od)
        if isequal(this, od(i).getDialogSource) && not(isequal(dialog, od(i)))
            % 11 12
            od(i).setWidgetValue(tag, dialog.getWidgetValue(tag));
            break
        end % if
    end % for
end % function
