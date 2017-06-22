function dLabel = getDisplayLabel(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    childCount = 0.0;
    thisChild = this.down;
        while not(isempty(thisChild))
        childCount = plus(childCount, 1.0);
        thisChild = thisChild.right;
    end % while
    % 13 14
    dLabel = sprintf('Stylesheet Editor (%i)', childCount);
end % function
