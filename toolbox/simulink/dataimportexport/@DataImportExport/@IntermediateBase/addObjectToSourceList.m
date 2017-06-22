function [SourceID, NeedToProcessFlag] = addObjectToSourceList(hIntermediate, Array, FunctionalType, hParent)
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
    SourceID = '';
    NeedToProcessFlag = true;
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if strcmp(FunctionalType, 'udd_object') && isequal(numel(Array), 1.0)
        % 21 22
        SourceObjects = hIntermediate.SourceObjects;
        PreviousUseIndex = find(eq(Array, SourceObjects), 1.0);
        % 24 27
        % 25 27
        % 26 27
        if isempty(PreviousUseIndex)
            % 28 29
            PreviousUseIndex = plus(numel(SourceObjects), 1.0);
            % 30 32
            % 31 32
            hIntermediate.SourceObjectsLastIndex = plus(hIntermediate.SourceObjectsLastIndex, 1.0);
            % 33 38
            % 34 38
            % 35 38
            % 36 38
            % 37 38
            connect(Array, hIntermediate, 'up');
            % 39 41
            % 40 41
            hIntermediate.SourceObjects = vertcat(SourceObjects, Array);
            SourceObjects = [];
            % 43 50
            % 44 50
            % 45 50
            % 46 50
            % 47 50
            % 48 50
            % 49 50
            SourceID = sprintf('%d', hIntermediate.SourceObjectsLastIndex);
            % 51 53
            % 52 53
            hIntermediate.SourceObjectsID = vertcat(horzcat(hIntermediate.SourceObjectsID), cellhorzcat(SourceID));
            % 54 57
            % 55 57
            % 56 57
            SourceProcessedFlag = false;
            hIntermediate.SourceObjectsProcessedFlag = vertcat(horzcat(hIntermediate.SourceObjectsProcessedFlag), SourceProcessedFlag);
        else
            % 60 61
            % 61 63
            % 62 63
            SourceID = hIntermediate.SourceObjectsID{PreviousUseIndex};
            % 64 66
            % 65 66
            SourceProcessedFlag = hIntermediate.SourceObjectsProcessedFlag(PreviousUseIndex);
            % 67 68
        end % if
        % 69 71
        % 70 71
        if isequal(hParent, 0.0)
            % 72 73
            if SourceProcessedFlag
                % 74 75
                NeedToProcessFlag = false;
            else
                % 77 79
                % 78 79
                hIntermediate.SourceObjectsProcessedFlag(PreviousUseIndex) = true;
            end % if
        else
            % 82 83
            if not(SourceProcessedFlag)
                % 84 95
                % 85 95
                % 86 95
                % 87 95
                % 88 95
                % 89 95
                % 90 95
                % 91 95
                % 92 95
                % 93 95
                % 94 95
                hIntermediate.appendArrayQueue(Array, SourceID, 0.0);
            end % if
        end % if
    end % if
    % 99 100
end % function
