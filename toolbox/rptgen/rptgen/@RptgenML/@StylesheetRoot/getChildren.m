function c = getChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    try
        c = this.getStylesheetLibrary('-asynchronous');
        if isa(c, 'RptgenML.Library')
            c = c.getChildren;
        end % if
    catch
        c(1.0:0.0) = handle(0.0);
        warning(lasterr);
    end % try
end % function
