function this = ConfigurationContainer(fileName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = slhdlcoder.ConfigurationContainer;
    % 10 11
    if lt(nargin, 1.0)
        this.FileName = '';
    else
        this.FileName = fileName;
    end % if
end % function
