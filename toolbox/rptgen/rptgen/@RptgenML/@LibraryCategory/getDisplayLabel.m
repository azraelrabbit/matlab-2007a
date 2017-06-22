function dLabel = getDisplayLabel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if this.Expanded
        dLabel = '-';
    else
        dLabel = '+';
    end % if
    % 12 13
    postLine = char(mtimes('-', ones(1.0, max(minus(32.0, length(this.CategoryName)), 8.0))));
    % 14 15
    dLabel = horzcat(dLabel, '  ', this.CategoryName, '  ', postLine);
end % function
