function jOutputFormat = getFormat(this, fmt)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        fmt = this.Format;
    end % if
    % 9 12
    % 10 12
    if isa(fmt, 'com.mathworks.toolbox.rptgencore.output.OutputFormat')
        jOutputFormat = fmt;
    else
        % 14 16
        if isempty(this.FormatObject) || not(this.FormatObject.getID.equalsIgnoreCase(fmt))
            jOutputFormat = com.mathworks.toolbox.rptgencore.output.OutputFormat.getFormat(fmt);
            if lt(nargin, 2.0)
                this.FormatObject = jOutputFormat;
            end % if
        else
            jOutputFormat = this.FormatObject;
        end % if
    end % if
