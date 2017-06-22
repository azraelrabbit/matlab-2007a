function out = searchhandler(varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    models = varargin{1.0};
    % 14 15
    try
        models = horzcat(models{:});
    catch
        out = [];
        return;
    end % try
    % 21 23
    % 22 23
    if eq(length(models), 0.0)
        out = [];
        return;
    end % if
    % 27 29
    % 28 29
    pvpairs = varargin{2.0};
    pvpairsToSearchFor = {};
    % 31 32
    for i=1.0:3.0:length(pvpairs)
        type = pvpairs{i};
        values = pvpairs{plus(i, 1.0)};
        andType = pvpairs{plus(i, 2.0)};
        % 36 37
        if strcmp(type, 'object')
            pvpairsToSearchFor = localCopyObjectCellContents(pvpairsToSearchFor, models, values);
        else
            pvpairsToSearchFor = localCopyCellContents(pvpairsToSearchFor, values);
        end % if
        % 42 43
        if strcmp(andType, 'or')
            pvpairsToSearchFor{plus(end, 1.0)} = 'or';
        end % if
    end % for
    % 47 48
    if eq(length(pvpairsToSearchFor), 0.0)
        out = [];
        return;
    end % if
    % 52 54
    % 53 54
    try
        results = sbioselect(models, pvpairsToSearchFor{:});
    catch
        out = lasterr;
        return;
    end % try
    % 60 62
    % 61 62
    if eq(length(results), 0.0)
        out = [];
        return;
    end % if
    % 66 69
    % 67 69
    % 68 69
    types = get(results, {'Type'});
    % 70 72
    % 71 72
    uniqueTypes = unique(types);
    if eq(length(uniqueTypes), 1.0)
        out = cellhorzcat(java(results), uniqueTypes{1.0});
        return;
    end % if
    % 77 79
    % 78 79
    [newTypes, indices] = sort(types);
    out = {};
    for i=1.0:length(uniqueTypes)
        idx = strcmp(newTypes, uniqueTypes{i});
        idx = indices(idx);
        for j=1.0:length(idx)
            temp(j) = results(idx(j));
        end % for
        out = cellhorzcat(out{:}, java(temp), uniqueTypes{i});
        clear('temp');
    end % for
end % function
function out = localCopyCellContents(out, valuesToCopy)
    % 92 94
    % 93 94
    for i=1.0:length(valuesToCopy)
        out{plus(end, 1.0)} = valuesToCopy{i};
    end % for
end % function
function out = localCopyObjectCellContents(out, models, valuesToCopy)
    % 99 101
    % 100 101
    count = 3.0;
    if strcmp(valuesToCopy{1.0}, 'Type')
        count = 5.0;
    end % if
    % 105 106
    if gt(count, length(valuesToCopy))
        count = length(valuesToCopy);
    end % if
    % 109 110
    for i=1.0:count
        out{plus(end, 1.0)} = valuesToCopy{i};
    end % for
    % 113 114
    if ne(count, length(valuesToCopy))
        out{plus(end, 1.0)} = sbioselect(models, valuesToCopy{plus(count, 1.0):end});
    end % if
end % function
