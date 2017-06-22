function thisCopy = doCopy(this, copySiblings)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    thisCopy = copy(this);
    % 9 10
    thisCopy.LoopComp = doCopy(this.LoopComp);
end % function
