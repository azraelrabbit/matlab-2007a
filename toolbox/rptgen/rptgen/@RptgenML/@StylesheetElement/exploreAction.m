function exploreAction(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if isLibrary(this)
        currNode = getCurrentTreeNode(RptgenML.Root);
        % 10 12
        if not(isa(currNode, 'rptgen.DAObject')), else
            % 12 14
            if canAcceptDrop(currNode, this)
                acceptDrop(currNode, this);
            end
        end
    end
end
