function v = getModel(this, v)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isempty(this.modelName))
        v = get_param(this.modelName, 'ObjectAPI_FP');
    else
        % 11 14
        % 12 14
        % 13 14
        v = [];
    end % if
end % function
