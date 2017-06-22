function sibNodes = hierSibling(thisNode, parentNode, isLeft)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    sibNodes = find(parentNode, '-isa', class(thisNode));
    currIdx = find(eq(sibNodes, thisNode));
    if isempty(currIdx)
        if isLeft
            sibNodes = [];
        else
            % 16 17
        end % if
    else
        if isLeft
            sibNodes = sibNodes(1.0:minus(currIdx, 1.0));
        else
            sibNodes = sibNodes(plus(currIdx, 1.0):end);
        end % if
    end % if
end % function
