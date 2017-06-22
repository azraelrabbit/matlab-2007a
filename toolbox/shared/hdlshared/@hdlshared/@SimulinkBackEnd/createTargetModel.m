function createTargetModel(this, codeGenDir, modelName)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    try
        new_system(modelName);
        if strcmpi(this.ShowModel, 'yes')
            open_system(modelName);
        end % if
    catch
        % 17 18
        error(hdlerrormsgid('simulinkbackend'), 'Could not open new mdl file ''%s'' ', modelName);
    end % try
end % function
