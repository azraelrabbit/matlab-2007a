function assignConfigSetUniqueName(this, configSet, blockDiagram, newNameRoot)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    newName = newNameRoot;
    count = 0.0;
    % 12 13
    if not(isempty(blockDiagram))
        % 14 15
        configSetNames = blockDiagram.getConfigSets;
        % 16 17
            while any(strcmp(newName, configSetNames))
            % 18 19
            newName = horzcat(newNameRoot, ' ', num2str(count));
            count = plus(count, 1.0);
            % 21 22
        end % while
        % 23 24
    end % if
    % 25 26
    configSet.Name = newName;
end % function
