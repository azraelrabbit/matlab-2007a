function t = gr_getTitle(c, fName, varargin)
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
    switch c.isTitle
    case 'none'
        t = '';
    case 'filename'
        [fPath, fFile, fExt] = fileparts(fName);
        t = horzcat(fFile, fExt);
    otherwise
        t = rptgen.parseExpressionText(c.Title);
    end % switch
