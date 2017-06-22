function c = getChildren(this)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    c(1.0:0.0) = handle(0.0);
    % 12 13
    if not(isempty(this.JavaHandle))
        try
            c = getParamsLibrary(RptgenML.StylesheetRoot, this, '-asynchronous');
            if isa(c, 'RptgenML.Library')
                c = c.getChildren;
            end % if
        catch
            warning(lasterr);
        end % try
    end % if
end % function
