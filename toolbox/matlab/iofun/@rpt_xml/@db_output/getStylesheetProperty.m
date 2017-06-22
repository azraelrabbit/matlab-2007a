function propName = getStylesheetProperty(this, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    theFormat = this.getFormat(varargin{:});
    % 12 14
    if isa(theFormat, 'com.mathworks.toolbox.rptgencore.output.OutputFormatXSLT')
        if isa(theFormat, 'com.mathworks.toolbox.rptgencore.output.OutputFormatFOP') || theFormat.getID.equalsIgnoreCase('fot')
            % 15 18
            % 16 18
            propName = 'StylesheetFO';
        else
            if theFormat.getID.equalsIgnoreCase('latex')
                propName = 'StylesheetLaTeX';
            else
                propName = 'StylesheetHTML';
            end
        end
    else
        if isa(theFormat, 'com.mathworks.toolbox.rptgencore.output.OutputFormatDSSSL')
            propName = 'StylesheetDSSSL';
        else
            propName = '';
        end
    end
end
