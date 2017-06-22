function imTitle = gr_getTitle(c, fName, hFig, blkName, varargin)
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
    % 11 12
    switch c.TitleType
    case 'none'
        imTitle = '';
    case 'blkname'
        try
            imTitle = get_param(blkName, 'Name');
        catch
            imTitle = blkName;
        end % try
    case 'fullname'
        imTitle = blkName;
    otherwise
        imTitle = rptgen.parseExpressionText(c.Title);
    end % switch
end % function
