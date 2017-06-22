function hList = loop_getLoopObjects(c)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    hList = [];
    switch c.ObjectSource
    case 'workspace'
        allVars = evalin('base', 'whos');
        if ~(isempty(c.NameList))
            allVars = intersect(cellhorzcat(allVars.name), c.NameList);
        else
            allVars = cellhorzcat(allVars.name);
        end
        for i=1.0:length(allVars)
            if evalin('base', sprintf('isa(%s,''handle'');', allVars{i}), 'logical(0)')
                try
                    var = evalin('base', allVars{i});
                    hList = vertcat(hList(:), var(:));
                end % try
            end
        end % for
        hList = locFlatFind(c, hList);
    case 'matfile'
        matFileName = rptgen.findFile(rptgen.parseExpressionText(c.Filename), logical(1), 'mat');
        try
            allVars = whos('-file', matFileName);
        catch
            c.status(sprintf('Can not load file "%s"', matFileName), 2.0);
            return
        end % try
        if ~(isempty(c.NameList))
            allVars = intersect(cellhorzcat(allVars.name), c.NameList);
        else
            allVars = cellhorzcat(allVars.name);
        end
        allValues = load(matFileName, allVars{:});
        for i=1.0:length(allVars)
            var = allValues.(allVars{i});
            if ishandle(var)
                hList = vertcat(hList(:), var(:));
            end
        end % for
        hList = locFlatFind(c, hList);
    case 'direct'
        hList = c.RuntimeCurrentObject;
    otherwise
        findRoot = c.RuntimeCurrentObject;
        if isempty(findRoot)
            findRoot = get(rptgen_ud.appdata_ud, 'CurrentObject');
            if isempty(findRoot)
                c.status('No current UDD object.  Cancelling loop.', 2.0);
                return
            end
        end
        findArgs = locNumericizeFindArgs(c.FindArguments);
        hList = find(findRoot, findArgs{:});
        if c.ExcludeRoot
            % 63 66
            % 64 66
            hList = setdiff(hList, findRoot);
        end
        hList = hList(:);
    end
end
function hList = locFlatFind(c, hList)
    % 71 75
    % 72 75
    % 73 75
    if isempty(c.FindArguments)
        return
    end
    % 77 79
    findArgs = locNumericizeFindArgs(c.FindArguments);
    % 79 81
    if ~(strcmp(findArgs{1.0}, '-depth'))
        hList = find(hList, '-depth', 0.0, findArgs{:});
    else
        hList = find(hList, findArgs{:});
    end
end
function findArgs = locNumericizeFindArgs(findArgs)
    % 87 91
    % 88 91
    % 89 91
    for i=1.0:length(findArgs)
        numResult = str2double(findArgs{i});
        if ~(isnan(numResult))
            findArgs{i} = numResult;
        end
    end % for
end
