function [hSourceObject, SourceFromParent] = addSourceToSourceList(hIntermediate, hArrayNode, ParentArray)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    hSourceObject = [];
    SourceFromParent = false;
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if strcmp(hArrayNode.FunctionalType, 'udd_object') && isequal(prod(hArrayNode.Dimensions), 1.0)
        % 21 23
        % 22 23
        SourceID = hArrayNode.SourceID;
        SourceObjectsID = hIntermediate.SourceObjectsID;
        PreviousUseIndex = find(strcmp(SourceID, SourceObjectsID), 1.0);
        % 26 28
        % 27 28
        SourceObjects = hIntermediate.SourceObjects;
        % 29 31
        % 30 31
        if isempty(PreviousUseIndex)
            % 32 33
            [hSourceObject, SourceFromParent] = hIntermediate.constructObject(hArrayNode, ParentArray);
            % 34 37
            % 35 37
            % 36 37
            if not(isempty(hSourceObject))
                % 38 41
                % 39 41
                % 40 41
                connect(hSourceObject, hIntermediate, 'up');
                % 42 44
                % 43 44
                hIntermediate.SourceObjects = vertcat(SourceObjects, hSourceObject);
                % 45 47
                % 46 47
                hIntermediate.SourceObjectsID = vertcat(horzcat(hIntermediate.SourceObjectsID), cellhorzcat(SourceID));
                % 48 49
            end % if
        else
            % 51 53
            % 52 53
            hSourceObject = SourceObjects(PreviousUseIndex);
        end % if
    end % if
    % 56 57
end % function
