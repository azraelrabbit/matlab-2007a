function sList = loopsystem(c, sortBy, blockScope)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    if eq(nargin, 1.0)
        sList.sortCode = {'$numBlocks';'$systemalpha';'$depth';'$none'};
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        sList.sortName = {'By number of blocks in system';'Alphabetically by system name';'By system depth';'No sort'};
        % 34 41
        % 35 41
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        sList.contextCode = {'System';'Model';'Signal';'Block';''};
        % 41 48
        % 42 48
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        sList.contextName = vertcat(cellhorzcat(sprintf('Current system')), cellhorzcat(sprintf('Reported systems in current model')), cellhorzcat(sprintf('Current signal''s parent system')), cellhorzcat(sprintf('Current block''s parent system')), cellhorzcat(sprintf('All systems in all models')));
    else
        % 49 56
        % 50 56
        % 51 56
        % 52 56
        % 53 56
        % 54 56
        % 55 57
        z = zslmethods;
        % 57 59
        if iscell(blockScope)
            sList = blockScope;
        else
            switch blockScope
            case {'System','Signal','Block'}
                sList = cellhorzcat(subsref(z, substruct('.', 'System')));
            case 'Model'
                sList = subsref(z, substruct('.', 'ReportedSystemList'));
            otherwise
                mList = find_system('SearchDepth', 1.0, 'BlockDiagramType', 'model');
                % 68 70
                sList = excludesystems(z, vertcat(mList, find_system(mList, 'Type', 'block', 'BlockType', 'SubSystem')));
                % 70 74
                % 71 74
                % 72 74
            end % switch
        end % if
        % 75 77
        if not(isempty(sList))
            switch sortBy
            case '$numBlocks'
                % 79 82
                % 80 82
                blockList = propsystem(z, 'GetPropValue', sList, 'blocks');
                % 82 84
                okEntries = find(cellfun('isclass', blockList, 'cell'));
                blockList = blockList(okEntries);
                sList = sList(okEntries);
                % 86 88
                blockList = cellfun('length', blockList);
                [blockList, sortIndex] = sort(blockList);
                sList = sList(sortIndex(end:-1.0:1.0));
            case {'$alphabetical','$systemalpha'}
                nameList = propsystem(z, 'GetPropValue', sList, 'name');
                % 92 94
                okEntries = find(not(cellfun('isempty', nameList)));
                nameList = nameList(okEntries);
                sList = sList(okEntries);
                % 96 98
                [nameList, nameIndex] = sort(lower(nameList));
                sList = sList(nameIndex);
            case '$depth'
                % 100 103
                % 101 103
                depthList = propsystem(z, 'GetPropValue', sList, 'Depth');
                % 103 107
                % 104 107
                % 105 107
                depthList = ctranspose(horzcat(depthList{:}));
                okEntries = find(ge(depthList, 0.0));
                depthList = depthList(okEntries);
                sList = sList(okEntries);
                % 110 112
                [depthList, depthIndex] = sort(depthList);
                sList = sList(depthIndex);
            otherwise
                % 114 116
            end % switch
            sList = sList(:);
        else
            sList = {};
        end % if
    end % if
end % function
