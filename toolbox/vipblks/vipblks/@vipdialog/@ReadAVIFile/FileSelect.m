function FileSelect(this, dialog)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    theFile = which(this.filename);
    if isempty(theFile)
        theFile = this.filename;
    end
    [filename, pathname] = uigetfile({'*.avi;*.AVI','AVI Files (*.avi)';'*.*','All Files (*.*)'}, 'Pick an AVI file', theFile);
    % 11 15
    % 12 15
    % 13 15
    if ~(isequal(filename, 0.0) || isequal(pathname, 0.0))
        this.filename = horzcat(pathname, filename);
        dialog.setWidgetValue('filename', horzcat(pathname, filename));
    end
end
