function varargout = simulateModel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    simCommand = horzcat('sim(''', bdroot(this.ModelName), ''');');
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    varargout = cellhorzcat(evalin('caller', simCommand));
end % function
