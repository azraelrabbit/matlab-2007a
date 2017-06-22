function setTableStrings(c, tStrings, isSplit, tableTitle, cellRender, titleRender)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 6.0)
        titleRender = 'v';
        if lt(nargin, 5.0)
            cellRender = 'N v';
            if lt(nargin, 4.0)
                tableTitle = '';
                if lt(nargin, 3.0)
                    isSplit = false;
                    if lt(nargin, 2.0)
                        tStrings = cell(4.0, 4.0);
                        tableTitle = xlate('Table Title');
                    end % if
                else
                    isSplit = logical(isSplit);
                end % if
            end % if
        end % if
    end % if
    % 27 28
    if isSplit
        cellAlign = 'center';
    else
        cellAlign = 'left';
    end % if
    % 33 35
    % 34 35
    c.TableTitle.Render = titleRender;
    c.TableTitle.Text = tableTitle;
    c.SingleValueMode = isSplit;
    c.isBorder = true;
    c.ColWid = ones(mtimes(size(tStrings, 2.0), plus(1.0, isSplit)));
    % 40 41
    tStrings = ctranspose(tStrings);
    tStrings = tStrings(:);
    % 43 44
    oldContents = c.TableContent;
    % 45 46
    if not(isempty(oldContents))
        % 47 49
        % 48 49
        for i=1.0:length(oldContents)
            disconnect(oldContents(i));
            delete(oldContents(i));
        end % for
    end % if
    % 54 55
    for i=1.0:length(tStrings)
        tCells(i, 1.0) = rptgen.rpt_prop_cell(c);
        set(tCells(i, 1.0), 'Text', tStrings{i}, 'Render', cellRender, 'Align', cellAlign);
        % 58 61
        % 59 61
        % 60 61
    end % for
    c.TableContent = tCells;
end % function
