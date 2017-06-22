function returnedValue = ut_getValue(this, storedValue)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(isempty(this.ValueInvalid))
        % 8 11
        % 9 11
        returnedValue = this.ValueInvalid;
    else
        returnedValue = char(com.mathworks.toolbox.rptgencore.tools.StylesheetMaker.getParameterAsString(this.JavaHandle));
    end % if
