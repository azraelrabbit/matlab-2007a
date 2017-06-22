function append(this, signal)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    connect(this, signal, 'down');
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    this.Signals = vertcat(horzcat(this.Signals), signal);
end % function
