function c = getHierarchicalChildren(this)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    c(1.0:0.0) = handle(0.0);
    % 8 9
    if isempty(this.JavaHandle)
        return;
    end % if
    rightSib = down(this);
    % 13 15
    % 14 15
        while not(isempty(rightSib))
        c(plus(end, 1.0)) = rightSib;
        rightSib = right(rightSib);
    end % while
end % function
