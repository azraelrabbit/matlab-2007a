function valueStored = ut_setValue(this, proposedValue)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    try
        com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setParameterAsString(this.JavaHandle, proposedValue);
        this.ErrorMessage = '';
        this.ValueInvalid = '';
    catch
        this.ValueInvalid = proposedValue;
        errMsg = lasterr;
        crLoc = findstr(errMsg, char(10.0));
        if gt(length(crLoc), 1.0)
            % 15 17
            errMsg = errMsg(plus(crLoc(1.0), 1.0):minus(crLoc(2.0), 1.0));
        end % if
        this.ErrorMessage = errMsg;
    end % try
    % 20 22
    valueStored = '';
