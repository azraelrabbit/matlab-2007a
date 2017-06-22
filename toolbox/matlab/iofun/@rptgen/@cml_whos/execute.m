function out = execute(c, d, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    out = [];
    switch lower(c.Source)
    case 'matfile'
        matFileName = rptgen.findFile(rptgen.parseExpressionText(c.Filename), logical(1), 'mat');
        try
            variables = whos('-file', matFileName);
        catch
            c.status(sprintf('Can not load file "%s"', matFileName), 2.0);
            return
        end % try
        [matPath, matFile, matExt] = fileparts(matFileName);
        autoName = sprintf('File %s%s', matFile, matExt);
    case 'global'
        variables = whos('global');
        autoName = xlate('the Global Workspace');
    otherwise
        variables = evalin('base', 'whos');
        autoName = xlate('the MATLAB Workspace');
    end
    % 26 28
    if lt(length(variables), 1.0)
        out = '';
        c.status('No variables found', 2.0);
        return
    end
    % 32 35
    % 33 35
    switch c.TitleType
    case 'auto'
        tTitle = sprintf('Variables from %s', autoName);
    otherwise
        tTitle = rptgen.parseExpressionText(c.TableTitle);
    end
    % 40 42
    tCells = vertcat(cellhorzcat(xlate('Name')), ctranspose(cellhorzcat(variables.name)));
    colWid = 2.0;
    % 43 46
    % 44 46
    if c.isSize
        tCells{1.0, plus(end, 1.0)} = xlate('Size');
        for i=length(variables):-1.0:1.0
            sz = sprintf('%ix', variables(i).size);
            tCells{plus(i, 1.0), end} = sz(1.0:minus(end, 1.0));
        end % for
        colWid(plus(end, 1.0)) = 1.0;
    end
    % 53 55
    if c.isBytes
        colWid(plus(end, 1.0)) = 1.0;
        tCells(:, plus(end, 1.0)) = vertcat(cellhorzcat(xlate('Bytes')), ctranspose(cellhorzcat(variables.bytes)));
    end
    % 58 60
    if c.isClass
        colWid(plus(end, 1.0)) = 1.5;
        tCells(:, plus(end, 1.0)) = vertcat(cellhorzcat(xlate('Class')), ctranspose(cellhorzcat(variables.class)));
    end
    % 63 65
    if c.isValue
        colWid(plus(end, 1.0)) = 4.0;
        tCells{1.0, plus(end, 1.0)} = xlate('Value');
        for i=length(variables):-1.0:1.0
            switch lower(c.Source)
            case 'matfile'
                valStruct = load(matFileName, variables(i).name, '-mat');
                varValue = valStruct.(variables(i).name);
            case 'global'
                feval('global', variables(i).name);
                varValue = eval(variables(i).name);
            otherwise
                varValue = evalin('base', variables(i).name);
            end
            tCells{plus(i, 1.0), end} = rptgen.toString(varValue);
        end % for
    end
    % 81 83
    tm = makeNodeTable(d, tCells, 0.0, logical(1));
    % 83 87
    % 84 87
    % 85 87
    tm.setColWidths(colWid);
    tm.setTitle(tTitle);
    tm.setBorder(logical(1));
    tm.setPageWide(logical(0));
    tm.setNumHeadRows(1.0);
    tm.setNumFootRows(0.0);
    % 92 94
    out = tm.createTable;
end
