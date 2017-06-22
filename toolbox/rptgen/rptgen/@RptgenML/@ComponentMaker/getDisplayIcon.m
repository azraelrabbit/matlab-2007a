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
        if this.Parentable
            fileName = 'toolbox/rptgen/resources/Component_parentable.png';
        else
            fileName = 'toolbox/rptgen/resources/Component_unparentable.png';
        end % if
    end % if
end % function
