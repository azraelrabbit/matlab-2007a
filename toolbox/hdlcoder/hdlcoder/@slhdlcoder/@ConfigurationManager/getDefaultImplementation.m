function impl = getDefaultImplementation(this, block)
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
    topSet = this.DefaultTable.getImplementationSet(this.ModelName);
    impl = topSet.getImplementation(block);
end % function
