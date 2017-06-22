function dName = getDisplayName(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if strncmpi(this.source, 'd', 1.0)
        dName = class(this.SourceDirect);
    else
        dName = rptgen.parseExpressionText(this.variable);
        % 11 12
        if isempty(dName)
            error('Variable name is empty');
        end % if
    end % if
end % function
