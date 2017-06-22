function fName = cbkConvert(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    this.RuntimeConverting = true;
    % 9 11
    r = this.up;
    if not(isempty(r)) && isa(r, 'RptgenML.Root')
        % 12 16
        % 13 16
        % 14 16
        if not(warnDirtyStylesheet(RptgenML.StylesheetRoot, this.getStylesheetID))
            fName = '';
            this.RuntimeConverting = false;
            return;
        end % if
        % 20 22
        r.getDisplayClient;
    end % if
    % 23 25
    javaMethod('staticClearMessages', 'com.mathworks.toolbox.rptgencore.GenerationDisplayClient');
    % 25 28
    % 26 28
    rptgen.displayMessage(sprintf('Converting file "%s"', this.SrcFileName), 3.0);
    % 28 30
    this.DstFileName = '';
    try
        isOK = this.convertReport;
        fName = this.DstFileName;
    catch
        isOK = false;
        fName = '';
        errMsg = lasterr;
        crLoc = findstr(errMsg, char(10.0));
        if not(isempty(crLoc))
            errMsg = errMsg(plus(crLoc(1.0), 1.0):end);
        end % if
        rptgen.displayMessage(sprintf('Conversion error: "%s"', errMsg), 2.0);
    end % try
    % 43 45
    if not(ischar(fName))
        fName = '';
    end % if
    % 47 49
    if not(isempty(fName)) && this.View
        try
            rptgen.viewFile(fName);
            rptgen.displayMessage(xlate('File viewer launched'), 4.0);
        catch
            errMsg = lasterr;
            rptgen.displayMessage(sprintf('File view error: "%s"', errMsg), 2.0);
        end % try
    end % if
    this.RuntimeConverting = false;
    % 58 60
    rptgen.displayMessage(xlate('File conversion complete'), 3.0);
    % 60 63
    % 61 63
    com.mathworks.toolbox.rptgencore.GenerationDisplayClient.reset;
    % 63 65
    this.setDirty(false);
