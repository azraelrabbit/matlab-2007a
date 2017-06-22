function desCecTreeData = des_initMdlCecTree(mdlName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    feature_state = feature('EngineInterface');
    % 10 11
    feature('EngineInterface', 1001.0);
    % 12 13
    uddObj = get_param(mdlName, 'object');
    % 14 15
    cectree = uddObj.getCondExecTree;
    % 16 17
    feature('EngineInterface', feature_state);
    % 18 19
    cecTreeSize = size(cectree);
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    desCecIdx = 1.0;
    desCecTreeData = [];
    % 26 27
    for idx=1.0:cecTreeSize
        parentBlk = find_system(mdlName, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'handle', cectree(idx).owner, 'IsProcessed', 'on');
        % 29 31
        % 30 31
        if not(isempty(parentBlk))
            desCecTreeData(desCecIdx).id = cectree(idx).id;
            desCecTreeData(desCecIdx).parentId = cectree(idx).parentId;
            desCecTreeData(desCecIdx).owner = cectree(idx).owner;
            desCecTreeData(desCecIdx).cecType = cectree(idx).cecType;
            desCecTreeData(desCecIdx).portIdx = cectree(idx).portIdx;
            desCecTreeData(desCecIdx).cecHandle = cectree(idx).cecHandle;
            desCecTreeData(desCecIdx).nCondExecBlks = cectree(idx).nCondExecBlks;
            desCecTreeData(desCecIdx).blocksMovedToCECInputSide = cectree(idx).blocksMovedToCECInputSide;
            desCecTreeData(desCecIdx).blocksMovedToCECOutputSide = cectree(idx).blocksMovedToCECOutputSide;
            % 41 42
            desCecTreeData(desCecIdx).isFCSS = or(or(not(isempty(find_system(cectree(idx).owner, 'blocktype', 'EnablePort'))), not(isempty(find_system(cectree(idx).owner, 'blocktype', 'TriggerPort')))), not(isempty(find_system(cectree(idx).owner, 'blocktype', 'ActionPort'))));
            % 43 45
            % 44 45
            desCecIdx = plus(desCecIdx, 1.0);
        else
            % 47 48
            childBlk = '';
            inChildBlk = '';
            setFields = 0.0;
            % 51 53
            % 52 53
            for inputChildIdx=1.0:length(cectree(idx).blocksMovedToCECInputSide)
                inChildBlk = find_system(mdlName, 'Lookundermasks', 'all', 'FollowLinks', 'on', 'handle', cectree(idx).blocksMovedToCECInputSide(inputChildIdx), 'IsProcessed', 'on');
                % 55 57
                % 56 57
                if not(isempty(inChildBlk))
                    setFields = 1.0;
                    break
                end % if
            end % for
            % 62 63
            if ne(setFields, 1.0)
                for outputChildIdx=1.0:length(cectree(idx).blocksMovedToCECOutputSide)
                    outChildBlk = find_system(mdlName, 'Lookundermasks', 'all', 'FollowLinks', 'on', 'handle', cectree(idx).blocksMovedToCECOutputSide(outputChildIdx), 'IsProcessed', 'on');
                    % 66 68
                    % 67 68
                    if not(isempty(outChildBlk))
                        setFields = 1.0;
                        break
                    end % if
                end % for
            end % if
            % 74 75
            if eq(setFields, 1.0)
                % 76 77
                desCecTreeData(desCecIdx).id = cectree(idx).id;
                desCecTreeData(desCecIdx).parentId = cectree(idx).parentId;
                desCecTreeData(desCecIdx).owner = cectree(idx).owner;
                desCecTreeData(desCecIdx).cecType = cectree(idx).cecType;
                desCecTreeData(desCecIdx).portIdx = cectree(idx).portIdx;
                desCecTreeData(desCecIdx).cecHandle = cectree(idx).cecHandle;
                desCecTreeData(desCecIdx).nCondExecBlks = cectree(idx).nCondExecBlks;
                desCecTreeData(desCecIdx).blocksMovedToCECInputSide = cectree(idx).blocksMovedToCECInputSide;
                desCecTreeData(desCecIdx).blocksMovedToCECOutputSide = cectree(idx).blocksMovedToCECOutputSide;
                % 86 87
                desCecTreeData(desCecIdx).isFCSS = or(or(not(isempty(find_system(cectree(idx).owner, 'blocktype', 'EnablePort'))), not(isempty(find_system(cectree(idx).owner, 'blocktype', 'TriggerPort')))), not(isempty(find_system(cectree(idx).owner, 'blocktype', 'ActionPort'))));
                % 88 91
                % 89 91
                % 90 91
                desCecIdx = plus(desCecIdx, 1.0);
            end % if
            % 93 94
        end % if
    end % for
    % 96 97
    desCecTreeData = ctranspose(desCecTreeData);
    % 98 99
    feature('EngineInterface', 0.0);
end % function
