function fileName = getDisplayIcon(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if not(this.Active)
        fileName = 'toolbox/rptgen/resources/Component_deactivated.png';
    else
        if not(isempty(this.ErrorMessage))
            fileName = 'toolbox/rptgen/resources/warning.png';
        else
            if this.getParentable
                fileName = 'toolbox/rptgen/resources/Component_parentable.png';
            else
                fileName = 'toolbox/rptgen/resources/Component_unparentable.png';
            end % if
        end % if
    end % if
end % function
