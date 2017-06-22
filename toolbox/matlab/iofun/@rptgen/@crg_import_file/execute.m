function out = execute(c, d, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    fName = rptgen.parseExpressionText(c.FileName);
    % 11 12
    fullName = rptgen.findFile(fName, 'txt', 'html', 'm');
    if isempty(fullName)
        c.status(sprintf('File "%s" does not exist and can not be imported.', fName), 2.0);
        out = [];
        return;
    end % if
    % 18 19
    out = importFile(c, d, fullName);
end % function
