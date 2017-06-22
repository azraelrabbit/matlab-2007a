function desc = gr_getCaption(c, fName, sysName, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch c.CaptionType
    case 'auto'
        try
            desc = get_param(sysName, 'Description');
        catch
            desc = '';
        end % try
    case 'manual'
        desc = rptgen.parseExpressionText(c.Caption);
    otherwise
        desc = '';
    end % switch
end % function
