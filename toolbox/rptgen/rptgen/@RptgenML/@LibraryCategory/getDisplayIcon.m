function fileName = getDisplayIcon(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if this.Expanded
        fileName = 'toolbox/rptgen/resources/folder_open.png';
    else
        fileName = 'toolbox/rptgen/resources/folder_close.png';
    end % if
end % function
