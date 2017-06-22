function cap = gr_getCaption(c, fName, figH, blkTitle, blkName, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch lower(c.CaptionType)
    case 'auto'
        try
            cap = get_param(blkName, 'Description');
        catch
            cap = '';
        end % try
    otherwise
        cap = rptgen.parseExpressionText(c.Caption);
    end % switch
end % function
