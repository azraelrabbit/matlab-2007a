function power_LicMgrUpdate
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    objList = find_system(gcs, 'findall', 'on', 'SearchDepth', 2.0, 'FollowLinks', 'off', 'LookUnderMasks', 'all', 'type', 'block', 'mask', 'on');
    isJustTest = 0.0;
    % 8 10
    for idx=1.0:size(objList)
        % 10 14
        % 11 14
        % 12 14
        refBlock = get_param(objList(idx), 'ReferenceBlock');
        if isempty(refBlock)
            % 15 17
            testStr = get_param(objList(idx), 'OpenFcn');
            if isempty(testStr)
                if not(isJustTest)
                    set_param(objList(idx), 'OpenFcn', 'power_openblockproxy();');
                end
            else
                newStr = sprintf('if (power_openblockproxy (''secondary''))\n%s\nend;', testStr);
                set_param(objList(idx), 'OpenFcn', newStr);
                % 24 26
                tmpName = get_param(objList(idx), 'Name');
                disp(horzcat('Block: ''', tmpName, ''' already has OpenFcn ', testStr));
                disp(newStr);
            end
            % 29 33
            % 30 33
            % 31 33
            tmpInitCode = get_param(objList(idx), 'MaskInitialization');
            tmpInitCode = strtrim(tmpInitCode);
            % 34 36
            if not(isempty(tmpInitCode)) || gt(size(tmpInitCode, 1.0), 0.0)
                newInit = sprintf('%s\n%s', ctranspose(tmpInitCode), 'power_initmask();')
            else
                % 38 40
                newInit = 'power_initmask();';
            end
            if not(isJustTest)
                set_param(objList(idx), 'MaskInitialization', newInit);
            end
            % 44 46
            isModifiable = get_param(objList(idx), 'MaskSelfModifiable');
            if strcmp(isModifiable, 'off')
                blkName = get_param(gcb, 'Name');
                disp(horzcat('Now Modifiable: ', blkName));
            end
            if not(isJustTest)
                set_param(objList(idx), 'MaskSelfModifiable', 'on');
            end
        end
    end % for
end
