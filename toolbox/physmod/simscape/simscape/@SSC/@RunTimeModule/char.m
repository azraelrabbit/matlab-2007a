function c = char(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    c = sprintf('\t%s\n\tclassDate: %s\n\tobjectDate: %s\n\n', class(this), this.classDate, this.objectDate);
end % function
