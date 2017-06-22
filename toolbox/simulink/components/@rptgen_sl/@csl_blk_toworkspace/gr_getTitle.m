function imTitle = gr_getTitle(c, fName, figH, varName, blkName, prefix, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    switch c.TitleType
    case 'varname'
        imTitle = horzcat(prefix, ' ', varName);
    case 'blkname'
        imTitle = horzcat(prefix, ' ', blkName);
    case 'manual'
        imTitle = horzcat(prefix, ' ', rptgen.parseExpressionText(c.Title));
    otherwise
        imTitle = '';
    end % switch
