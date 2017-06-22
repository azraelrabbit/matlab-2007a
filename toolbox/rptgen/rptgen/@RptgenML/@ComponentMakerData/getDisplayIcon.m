function fileName = getDisplayIcon(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(this.ErrorMessage))
        % 8 9
        fileName = 'toolbox/rptgen/resources/warning.png';
    else
        fileName = 'toolbox/rptgen/resources/ComponentMakerData.png';
    end % if
end % function
