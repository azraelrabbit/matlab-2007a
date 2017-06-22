function index = getAndIncrementNextIndex(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    index = this.NextSignalIndex;
    this.NextSignalIndex = plus(this.NextSignalIndex, 1.0);
end % function
