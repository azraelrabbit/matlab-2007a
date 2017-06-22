function this = StylesheetAttributeSet(parentObj, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    this = feval(mfilename('class'));
    this.init(parentObj, varargin{:});
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    try
        attElement = com.mathworks.toolbox.rptgen.xml.StylesheetCustomizationParser.findFirstAttribute(this.JavaHandle);
    catch
        warning(lasterr);
        attElement = [];
    end % try
        while not(isempty(attElement))
        try
            att = RptgenML.StylesheetAttribute(this, attElement);
        catch
            warning('Unable to create stylesheet attribute');
        end % try
        try
            attElement = com.mathworks.toolbox.rptgen.xml.StylesheetCustomizationParser.findNextAttribute(attElement);
        catch
            warning(lasterr);
            attElement = [];
        end % try
    end % while
