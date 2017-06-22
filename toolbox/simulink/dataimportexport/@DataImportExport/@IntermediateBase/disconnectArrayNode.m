function disconnectArrayNode(hIntermediate, hArrayNode)
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
    for i=1.0:length(hArrayNode)
        % 12 14
        % 13 14
        if isa(hArrayNode(i).Parent, 'DataImportExport.Node')
            % 15 16
            ChildIndex = find(eq(hArrayNode, hArrayNode(i).Parent.Children));
            % 17 19
            % 18 19
            hArrayNode(i).Parent.Children(ChildIndex) = [];
        end % if
    end % for
    % 22 23
end % function
