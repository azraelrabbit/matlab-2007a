function val = getFullName(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(this.ModelName)
        val = '<model>/Code';
    else
        val = horzcat(this.ModelName, '/Code');
    end % if
end % function
