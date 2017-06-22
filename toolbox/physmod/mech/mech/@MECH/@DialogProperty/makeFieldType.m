function ft = makeFieldType(dp)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    widget = dp.makeWidget;
    switch widget.Type
    case 'edit'
        ft = 'edit';
    case 'checkbox'
        ft = 'checkbox';
    case 'combobox'
        ft = 'popup(';
        first = false;
        for i=1.0:length(widget.Entries)
            if first
                ft = horzcat(ft, '|');
            end % if
            first = true;
            ft = horzcat(ft, widget.Entries{i});
        end % for
        ft = horzcat(ft, ')');
    end % switch
end % function
