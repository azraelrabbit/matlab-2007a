function outputHandle = insert(rootOfTree, uddObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    canonFlag = 1.0;
    % 9 12
    % 10 12
    outputHandle = find(rootOfTree, 'ClassPointer', uddObj, 'IsCanonical', 1.0);
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if not(isempty(outputHandle))
    else
        if isempty(uddObj.Superclasses)
            % 19 21
            outputHandle = rootOfTree.newClassNode(uddObj, canonFlag);
            connect(outputHandle, rootOfTree, 'up');
        else
            for i=1.0:length(uddObj.Superclasses)
                % 24 26
                holdHandle = rootOfTree.newClassNode(uddObj, canonFlag);
                % 26 29
                % 27 29
                tempHandle = insert(rootOfTree, uddObj.Superclasses(i));
                % 29 31
                connect(holdHandle, tempHandle, 'up');
                % 31 34
                % 32 34
                if canonFlag
                    outputHandle = holdHandle;
                    % 35 38
                    % 36 38
                    canonFlag = 0.0;
                end % if
            end % for
        end % if
    end % if
end % function
