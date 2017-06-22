function valueStored = ut_setValue(this, proposedValue)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    try
        com.mathworks.toolbox.rptgen.xml.StylesheetEditor.setParameterAsStringXML(this.JavaHandle, proposedValue);
        this.ErrorMessage = '';
        this.ValueInvalid = '';
    catch
        this.ValueInvalid = proposedValue;
        errMsg = lasterr;
        crLoc = findstr(errMsg, char(10.0));
        if gt(length(crLoc), 1.0)
            % 17 19
            errMsg = errMsg(plus(crLoc(1.0), 1.0):minus(crLoc(2.0), 1.0));
        end % if
        this.ErrorMessage = errMsg;
    end % try
    % 22 24
    valueStored = '';
