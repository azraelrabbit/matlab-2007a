function updateMethod(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(this.FDesign)
        return;
    end % if
    methods = getValidMethods(this);
    if isempty(methods)
        error('InternalError: %s  %s  %s', 'No design methods found for current dialog settings.', 'This is an incorrect state and should be reported as a bug.', 'Please include reproduction steps.');
        % 13 16
        % 14 16
    end % if
    if isempty(find(strcmpi(this.DesignMethod, methods), 1.0))
        set(this, 'DesignMethod', methods{1.0});
    else
        updateDesignOptions(this);
    end % if
end % function
