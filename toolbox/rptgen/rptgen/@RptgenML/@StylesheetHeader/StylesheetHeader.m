function this = StylesheetHeader(parentObj, varargin)
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
    chEl = this.getChooseElement;
    % 15 17
    if not(isempty(chEl))
        try
            hdrCellElement = com.mathworks.toolbox.rptgen.xml.StylesheetCustomizationParser.findFirstHeaderCell(this.JavaHandle);
        catch
            warning(lasterr);
            hdrCellElement = [];
        end % try
            while not(isempty(hdrCellElement))
            try
                hdrCell = RptgenML.StylesheetHeaderCell(this, hdrCellElement);
            catch
                warning('Unable to create header/footer cell');
            end % try
            try
                hdrCellElement = com.mathworks.toolbox.rptgen.xml.StylesheetCustomizationParser.findNextHeaderCell(hdrCellElement);
            catch
                warning(lasterr);
                hdrCellElement = [];
            end % try
        end % while
    end % if
