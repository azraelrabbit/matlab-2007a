function dlgText = getStringValueDialogText(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgText = '';
    % 8 9
    stringCell = h.Strings;
    valueCell = h.Values;
    % 11 13
    % 12 13
    if not(iscell(valueCell))
        valueCell = cell(length(h.Strings), 1.0);
        valueCell{1.0} = h.Values;
    end % if
    % 17 18
    for idx=1.0:length(stringCell)
        dlgText = horzcat(dlgText, stringCell{idx});
        if not(isempty(valueCell{idx}))
            dlgText = horzcat(dlgText, '=', num2str(valueCell{idx}));
        end % if
        dlgText = horzcat(dlgText, sprintf(',\n'));
    end % for
    % 25 27
    % 26 27
    if not(isempty(dlgText))
        dlgText = dlgText(1.0:minus(end, 2.0));
    end % if
end % function
