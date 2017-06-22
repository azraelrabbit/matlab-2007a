function FileSelect(this, dialog)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    [filename, pathname] = uigetfile({'*.*','All Files (*.*)'}, 'Binary video file to write', this.FileName);
    % 8 11
    % 9 11
    if ~(isequal(filename, 0.0) || isequal(pathname, 0.0))
        dialog.setWidgetValue('FileName', horzcat(pathname, filename));
    end
end
