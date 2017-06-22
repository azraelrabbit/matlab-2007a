function ResizeInit(widgetsObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    set(widgetsObj.hfig, 'resizefcn', @(hco,ev)widgetsObj.ResizeFcn);
    % 9 13
    % 10 13
    % 11 13
    ResizeFcn(widgetsObj);
end
