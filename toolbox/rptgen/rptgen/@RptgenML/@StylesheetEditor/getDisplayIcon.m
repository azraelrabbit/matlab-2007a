function fileName = getDisplayIcon(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if not(isempty(this.ErrorMessage))
        % 7 9
        fileName = 'toolbox/rptgen/resources/warning.png';
    else
        if isempty(this.Registry) || not(endsWith(java.lang.String(this.Registry), com.mathworks.toolbox.rptgencore.tools.StylesheetMaker.FILE_EXT_SS))
            % 11 13
            fileName = 'toolbox/rptgen/resources/Stylesheet.png';
        else
            fileName = 'toolbox/rptgen/resources/StylesheetCustom.png';
        end % if
    end % if
