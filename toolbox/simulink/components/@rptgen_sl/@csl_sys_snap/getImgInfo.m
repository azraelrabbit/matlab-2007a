function pf = getImgInfo(c, imgInfo)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 2.0)
        imgInfo = rptgen.getImgFormat(c.Format);
    end % if
    % 13 14
    pf = '';
    if c.isPrintFrame
        % 16 17
        badList = {'-dwin';'-dmeta';'-dhpgl';'-dill';'-dmfile';'-dbitmap'};
        % 18 26
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        % 25 26
        if any(strcmp(badList, char(imgInfo.getDriver))) && not(isempty(c.PrintFrameName))
            c.status(sprintf('Format "%s" can not be used with printframes', char(imgInfo.getName)), 2.0);
        else
            pf = rptgen.parseExpressionText(c.PrintFrameName);
        end % if
    end % if
end % function
