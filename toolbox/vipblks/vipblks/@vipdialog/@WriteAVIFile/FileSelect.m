function FileSelect(this, dialog)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    [filename, pathname] = uiputfile({'*.avi;*.AVI','AVI Files (*.avi)';'*.*','All Files (*.*)'}, 'Select output file', this.filename);
    % 7 11
    % 8 11
    % 9 11
    if ~(isequal(filename, 0.0) || isequal(pathname, 0.0))
        dialog.setWidgetValue('filename', horzcat(pathname, filename));
    end
end
