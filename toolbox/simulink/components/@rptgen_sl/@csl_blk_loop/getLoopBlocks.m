function hList = getLoopBlocks(c, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if c.isFilterList
        searchTerms = horzcat(ctranspose(c.FilterTerms(:)), ctranspose(varargin(:)));
    else
        searchTerms = ctranspose(varargin(:));
    end % if
    if not(isempty(searchTerms))
        searchTerms = LocWashSearchTerms(searchTerms);
    end % if
    % 16 18
    if strcmp(c.LoopType, 'list')
        bList = rptgen_sl.rgFindBlocks(parseList(c), 0.0, searchTerms);
    else
        bList = findContextBlocks(rptgen_sl.appdata_sl, searchTerms{:});
    end % if
    % 22 24
    hList = c.sortBlocks(bList);
function t = LocWashSearchTerms(t)
    % 25 29
    % 26 29
    % 27 29
    numTerms = length(t);
    if gt(rem(numTerms, 2.0), 0.0)
        % 30 32
        t{plus(end, 1.0)} = '';
        numTerms = plus(numTerms, 1.0);
    end % if
    % 34 36
    emptyCells = find(cellfun('isempty', t));
    emptyNames = emptyCells(1.0:2.0:minus(end, 1.0));
    emptyNames = emptyNames(:);
    % 38 40
    removeCells = vertcat(emptyNames, plus(emptyNames, 1.0));
    okCells = setdiff(1.0:numTerms, removeCells);
    % 41 43
    t = t(okCells);
