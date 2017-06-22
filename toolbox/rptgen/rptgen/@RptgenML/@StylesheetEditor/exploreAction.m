function exploreAction(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isLibrary(this)
        r = RptgenML.Root;
        treeNode = r.getCurrentTreeNode;
        if isempty(treeNode) || not(isa(treeNode, 'rptgen.DAObject'))
            % 13 15
            % 14 15
            treeNode = RptgenML.StylesheetRoot;
        end % if
        if canAcceptDrop(treeNode, this)
            acceptDrop(treeNode, this);
        end % if
    end % if
end % function
