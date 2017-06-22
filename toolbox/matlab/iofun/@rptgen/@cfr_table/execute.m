function out = execute(this, d, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    try
        tm = makeNodeTable(d, this.getContent, 0.0, true, mtimes(this.ShrinkEntries, 2048.0));
    catch
        % 13 17
        % 14 17
        % 15 17
        % 16 18
        out = [];
        this.status(lasterr, 1.0);
        return
    end % try
    % 21 23
    nCols = tm.getNumCols;
    if eq(nCols, 0.0)
        out = '';
        this.status('Table is empty: Empty columns.', 2.0);
        return
    end
    % 28 30
    tCells = tm.getContent;
    nRows = ceil(mrdivide(length(tCells), nCols));
    nHeadRows = min(nRows, this.numHeaderRows);
    % 32 35
    % 33 35
    switch this.Footer
    case 'NONE'
        nFootRows = 0.0;
    case 'COPY_HEADER'
        % 38 40
        nFootRows = nHeadRows;
        oldLength = length(tCells);
        for i=mtimes(nHeadRows, nCols):-1.0:1.0
            % 42 44
            tCells(plus(oldLength, i)) = tCells(i).cloneNode(true);
        end % for
        tm.setContent(tCells);
    case 'LASTROWS'
        % 47 49
        nFootRows = min(minus(nRows, nHeadRows), this.numFooterRows);
    end
    % 50 53
    % 51 53
    nContentRows = minus(minus(nRows, nHeadRows), nFootRows);
    if le(nContentRows, 0.0)
        out = '';
        this.status('Table is empty: No content row.  Number of header/footer rows is equal or greater than the total number of rows.', 2.0);
        return
    end
    % 58 61
    % 59 61
    if not(isempty(this.ColumnWidths))
        cWid = this.ColumnWidths;
        % 62 64
        if gt(length(cWid), nCols)
            % 64 66
            cWid = cWid(1.0:nCols);
        else
            if lt(length(cWid), nCols)
                % 68 70
                cWid = horzcat(cWid, ones(1.0, minus(nCols, length(cWid))));
            end
        end
        tm.setColWidths(cWid);
    end
    % 74 76
    tm.setTitle(rptgen.parseExpressionText(this.TableTitle));
    tm.setBorder(this.isBorder);
    tm.setGroupAlign(this.AllAlign);
    tm.setPageWide(this.isPgWide);
    tm.setNumHeadRows(nHeadRows);
    tm.setNumFootRows(nFootRows);
    % 81 83
    out = tm.createTable;
end
