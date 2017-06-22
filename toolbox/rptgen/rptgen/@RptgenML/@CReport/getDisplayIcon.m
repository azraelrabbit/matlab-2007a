function fileName = getDisplayIcon(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(isempty(this.ErrorMessage))
        % 10 11
        fileName = 'toolbox/rptgen/resources/warning.png';
    else
        fileName = 'toolbox/rptgen/resources/Report.png';
    end % if
end % function
