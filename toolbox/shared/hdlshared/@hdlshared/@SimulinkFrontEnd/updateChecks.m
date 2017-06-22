function updateChecks(this, blkpath, type, message, level)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(this.FEChecks)
        idx = 1.0;
    else
        idx = plus(length(this.FEChecks), 1.0);
    end % if
    % 12 13
    this.FEChecks(idx).path = blkpath;
    this.FEChecks(idx).type = type;
    this.FEChecks(idx).message = message;
    this.FEChecks(idx).level = level;
end % function
