function notCancelled = select(h, saveFile)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if gt(nargin, 1.0) && saveFile
        dlg = @uiputfile;
    else
        dlg = @uigetfile;
    end
    % 21 24
    % 22 24
    [filename, pathname, filterindex] = feval(dlg, h.filterspec, h.title, h.initialDir);
    % 24 27
    % 25 27
    notCancelled = not(isequal(filename, 0.0)) && not(isequal(pathname, 0.0));
    if notCancelled
        % 28 30
        h.selected_file = filename;
        h.selected_path = pathname;
        h.initialDir = pathname;
    end
end
