function [y, foundData] = getappdata(hHG, name)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    if isa(hHG, 'uimgr.uiitem')
        hRootNode = hHG;
    else
        % 26 28
        try
            hRootNode = hHG.uimgr;
        catch
            error('uimgr:getappdata:InvalidHandle', 'Handle H is not associated with a UIMgr tree node.');
            % 31 33
        end % try
    end % if
    if not(ischar(name)) && not(iscellstr(name))
        error('uimgr:getappdata:InvalidName', 'Name must be a string or a cell-array of strings.');
        % 36 38
    end % if
    % 38 40
    cellResult = iscell(name);
    if not(cellResult)
        name = cellhorzcat(name);
    end % if
    % 43 47
    % 44 47
    % 45 47
    N = numel(name);
    y = cell(1.0, N);
    foundData = false(1.0, N);
    for i=1.0:N
        hNode = hRootNode;
        while not(foundData(i)) && not(isempty(hNode))
            [y{i}, foundData(i)] = getappdata(hNode, name{i});
            hNode = hNode.up;
        end % while
    end % for
    % 56 60
    % 57 60
    % 58 60
    if not(cellResult)
        y = y{1.0};
    end % if
