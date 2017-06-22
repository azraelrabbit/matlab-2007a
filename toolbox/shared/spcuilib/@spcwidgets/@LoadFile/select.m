function notCancelled = select(h, saveFile)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if gt(nargin, 1.0) && saveFile
        dlg = @uiputfile;
    else
        dlg = @uigetfile;
    end
    % 22 25
    % 23 25
    [filename, pathname, filterindex] = feval(dlg, h.filterspec, h.title, h.initialDir);
    % 25 28
    % 26 28
    notCancelled = not(isequal(filename, 0.0)) && not(isequal(pathname, 0.0));
    if notCancelled
        % 29 31
        h.selected_file = filename;
        h.selected_path = pathname;
        h.initialDir = pathname;
    end
end
