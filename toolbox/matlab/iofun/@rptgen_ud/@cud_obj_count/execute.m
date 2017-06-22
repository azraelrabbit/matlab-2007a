function out = execute(this, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    out = [];
    % 9 11
    currObj = count_getRootObject(this);
    % 11 13
    if isempty(currObj)
        status(this, 'No current object for count', 4.0);
        return;
    end % if
    % 16 18
    children = count_getChildObjects(this, currObj);
    % 18 20
    for i=length(children):-1.0:1.0
        objTypes{i} = count_getObjectClass(this, children(i));
    end % for
    % 22 24
    uniqTypes = unique(objTypes);
    % 24 26
    ps = count_getPropsrc(this);
    % 26 28
    for i=length(uniqTypes):-1.0:1.0
        sameIdx = find(strcmp(objTypes, uniqTypes{i}));
        count(i) = length(sameIdx);
        if this.ShowObjects
            tCells{i, 3.0} = ps.makeLink(children(sameIdx), '', 'link', d, '', ', ');
        end % if
        tCells(i, 1.0:2.0) = cellhorzcat(count_getObjectType(this, uniqTypes{i}, children(sameIdx(1.0)), d), sprintf('%i', count(i)));
        % 34 36
    end % for
    % 36 38
    if strcmp(this.SortBy, 'count')
        [count, sortIdx] = sort(count);
        tCells = tCells(sortIdx(end:-1.0:1.0), :);
    else
        % 41 45
        % 42 45
        % 43 45
    end % if
    % 45 47
    if this.ShowObjects
        headerRow = cellhorzcat(xlate('Type'), xlate('Count'), xlate('Objects'));
        colWid = [2.0 1.0 3.0];
    else
        headerRow = cellhorzcat(xlate('Type'), xlate('Count'));
        colWid = [2.0 1.0];
    end % if
    % 53 55
    tCells = vertcat(headerRow, tCells);
    % 55 57
    if this.IncludeTotal
        tCells(plus(end, 1.0), 1.0:2.0) = cellhorzcat(xlate('Total'), length(children));
        footerCount = 1.0;
    else
        footerCount = 0.0;
    end % if
    % 62 65
    % 63 65
    tm = makeNodeTable(d, tCells, 0.0, true);
    % 65 68
    % 66 68
    tm.setColWidths(colWid);
    tm.setNumHeadRows(1.0);
    tm.setNumFootRows(footerCount);
    % 70 72
    tm.setTitle(count_getTitle(this, ps, currObj, d));
    % 72 74
    out = tm.createTable;
end % function
