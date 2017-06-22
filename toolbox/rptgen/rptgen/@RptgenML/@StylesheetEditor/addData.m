function d = addData(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    try
        d = RptgenML.createStylesheetElement(this, varargin{:});
    catch
        d = [];
        warning(lasterr);
    end % try
end % function
