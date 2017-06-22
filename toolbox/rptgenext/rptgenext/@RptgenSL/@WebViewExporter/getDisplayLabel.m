function dLabel = getDisplayLabel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(this.StartPoint) || not(ishandle(this.StartPoint(1.0)))
        printScope = xlate('current system');
    else
        if isa(this.StartPoint(1.0), 'DAStudio.Object')
            printScope = getDisplayLabel(this.StartPoint(1.0));
            printScope = strrep(printScope, char(10.0), ' ');
        else
            printScope = xlate('unknown');
        end % if
    end % if
    dLabel = sprintf('Web View - %s', printScope);
end % function
