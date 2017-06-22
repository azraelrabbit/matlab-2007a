function FileSelect(this, dialog)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    [filename, pathname] = uigetfile({'*.png;*.jpg;*.gif;*.bmp;*.tif','Image Files (*.png,*.jpg,*.gif,*.bmp,*.tif)';'*.*','All Files (*.*)'}, 'Pick an image file', this.FileName);
    % 8 12
    % 9 12
    % 10 12
    if ~(isequal(filename, 0.0) || isequal(pathname, 0.0))
        this.FileName = horzcat(pathname, filename);
        dialog.setWidgetValue('FileName', horzcat(pathname, filename));
    end
end
