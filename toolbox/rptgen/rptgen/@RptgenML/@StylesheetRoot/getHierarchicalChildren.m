function c = getHierarchicalChildren(dao)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    rightSib = down(dao);
    % 8 9
    c(1.0:0.0) = handle(0.0);
    % 10 11
        while not(isempty(rightSib))
        c(plus(end, 1.0)) = rightSib;
        rightSib = right(rightSib);
    end % while
end % function
