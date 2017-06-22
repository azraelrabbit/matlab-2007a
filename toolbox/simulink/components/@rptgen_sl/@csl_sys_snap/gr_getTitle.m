function iTitle = gr_getTitle(c, fName, sysName, varargin)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    switch c.TitleType
    case 'manual'
        iTitle = rptgen.parseExpressionText(c.Title);
    case 'sysname'
        try
            iTitle = get_param(sysName, 'Name');
        catch
            iTitle = sysName;
        end % try
    case 'fullname'
        iTitle = sysName;
    otherwise
        iTitle = '';
    end % switch
end % function
