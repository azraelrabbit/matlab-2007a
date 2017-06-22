function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    out = '';
    % 9 11
    mdlName = get(rptgen_sl.appdata_sl, 'CurrentModel');
    if isempty(mdlName)
        c.status('No model found for change log', 2.0);
        return;
    end % if
    % 15 17
    try
        mdlHistory = get_param(mdlName, 'ModifiedHistory');
    catch
        c.status(xlate('Could not get model history'), 2.0);
        return;
    end % try
    % 22 24
    if isempty(mdlHistory)
        c.status(xlate('Model history empty.  Change log not created.'), 2.0);
        return;
    end % if
    % 27 29
    histInfo = c.parseHistory(mdlHistory);
    % 29 31
    if not(isempty(histInfo))
        % 31 33
        headerCells = cellhorzcat(xlate('Ver'), xlate('Name'), xlate('Date'), xlate('Description'));
        % 33 35
        colWid = [1.0 2.0 3.0 5.0];
        hCells = vertcat(headerCells, histInfo);
        % 36 38
        whichCol = find(horzcat(c.isVersion, c.isAuthor, c.isDate, c.isComment));
        if isempty(whichCol)
            c.status(xlate('No table columns selected - reporting "Description"'), 2.0);
            whichCol = 4.0;
        end % if
        % 42 44
        tm = makeNodeTable(d, hCells(:, whichCol), 0.0, true, 0.0);
        % 44 50
        % 45 50
        % 46 50
        % 47 50
        % 48 50
        tm.setColWidths(colWid(whichCol));
        tm.setTitle(rptgen.parseExpressionText(c.TableTitle));
        tm.setBorder(c.isBorder);
        tm.setPageWide(true);
        tm.setNumHeadRows(1.0);
        tm.setNumFootRows(0.0);
        % 55 57
        out = tm.createTable;
    else
        c.status(xlate('Could not parse model history. Change log not created.'), 2.0);
    end % if
