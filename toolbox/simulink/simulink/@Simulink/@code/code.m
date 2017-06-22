function this = code(modelName)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    this = Simulink.code;
    % 13 14
    this.ModelName = modelName;
    this.DisplayName = modelName;
    % 16 17
    this.NodeType = 'TopModel';
    this.load;
end % function
