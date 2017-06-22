function rsl = getReportedSystems(h, mdl, currSys)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        mdl = h.RuntimeMdlName;
    end
    if lt(nargin, 3.0)
        currSys = gcs;
        if ~(strcmp(bdroot(currSys), mdl))
            currSys = mdl;
        end
    end
    % 15 17
    if (isempty(h.MdlCurrSys)) | (isempty(mdl))
        h.RuntimeStartSystems = {};
        rsl = {};
    else
        % 20 22
        h.RuntimeStartSystems = unique(strrep(strrep(strrep(h.MdlCurrSys, '$current', currSys), '$top', mdl), char(10.0), ' '));
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        switch h.SysLoopType
        case 'current'
            rsl = h.RuntimeStartSystems;
            libPostProcess = 0.0;
        case 'currentAbove'
            rsl = {};
            for i=1.0:length(h.RuntimeStartSystems)
                rsl = vertcat(rsl, LocTraverseUp(h.RuntimeStartSystems(i)));
            end % for
            rsl = unique(rsl);
            libPostProcess = 0.0;
        otherwise
            if strcmp(h.SysLoopType, 'all')
                startSystem = cellhorzcat(mdl);
            else
                startSystem = h.RuntimeStartSystems;
            end
            % 43 45
            switch h.isMask
            case 'none'
                maskSwitch = 'none';
                maskFind = {'mask','off'};
            case 'functional'
                maskSwitch = 'functional';
                maskFind = {'MaskHelp','','MaskDescription','','MaskVariables',''};
                % 52 54
            case cellhorzcat('all', 'on', true)
                % 53 55
                maskSwitch = 'all';
                maskFind = {'type','block'};
            otherwise
                % 57 59
                maskSwitch = 'graphical';
                maskFind = {'MaskHelp','','MaskDescription','','MaskVariables','','MaskInitialization',''};
                % 60 64
                % 61 64
                % 62 64
            end
            % 64 66
            switch h.isLibrary
            case {'on',logical(1)}
                libSwitch = 'on';
                libPostProcess = 0.0;
            case 'unique'
                libSwitch = 'on';
                libPostProcess = 1.0;
            otherwise
                % 73 75
                libSwitch = 'off';
                libPostProcess = -1.0;
            end
            % 77 79
            findCell = cellhorzcat('LookUnderMasks', maskSwitch, 'FollowLinks', libSwitch, 'blocktype', 'SubSystem');
            % 79 83
            % 80 83
            % 81 83
            rsl = strrep(find_system(startSystem, findCell{:}, maskFind{:}), char(10.0), ' ');
            % 83 85
            rsl = union(rsl, startSystem);
            % 85 87
            if ne(libPostProcess, 0.0)
                rsl = LocFilterLibraries(rsl, libPostProcess);
            else
                % 89 91
                rsl = rsl(:);
            end
        end
        % 93 95
        rsl = excludesystems(rsl);
        % 95 97
    end
end
function strOnOff = LocOnOff(logOnOff)
    % 99 103
    % 100 103
    % 101 103
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end
end
function sList = LocTraverseUp(sList)
    % 109 112
    % 110 112
    sParent = get_param(sList{end}, 'Parent');
    if ~(isempty(sParent))
        sList{plus(end, 1.0), 1.0} = strrep(sParent, char(10.0), ' ');
    end
end
function uniqueList = LocFilterLibraries(allList, actionType)
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    blockList = strrep(find_system(allList, 'SearchDepth', 0.0, 'type', 'block'), char(10.0), ' ');
    % 122 125
    % 123 125
    unlinkedBlocks = strrep(find_system(blockList, 'SearchDepth', 0.0, 'LinkStatus', 'none'), char(10.0), ' ');
    % 125 128
    % 126 128
    linkedBlocks = setdiff(blockList, unlinkedBlocks);
    % 128 130
    if ~(isempty(linkedBlocks))
        modelList = setdiff(allList, blockList);
        if gt(actionType, 0.0)
            refBlocks = rptgen.safeGet(linkedBlocks, 'referenceblock', 'get_param');
            [uniqRefBlocks, uniqIndex] = unique(refBlocks);
            % 134 136
            uniqLinkedBlocks = linkedBlocks(uniqIndex);
            % 136 138
            uniqueList = vertcat(modelList(:), unlinkedBlocks(:), uniqLinkedBlocks(:));
        else
            % 139 141
            % 140 142
            uniqueList = vertcat(modelList(:), unlinkedBlocks(:));
            % 142 144
        end
    else
        uniqueList = allList(:);
    end
end
function cleanList = excludesystems(rawList)
    % 149 155
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    if ~(iscell(rawList))
        rawList = cellhorzcat(rawList);
    end
    % 157 159
    allBadTypes = {{'MaskType','Stateflow'}};
    % 159 163
    % 160 163
    % 161 163
    badList = {};
    % 163 165
    for i=1.0:length(allBadTypes)
        try
            thisBad = strrep(find_system(rawList, 'SearchDepth', 0.0, allBadTypes{i}{:}), char(10.0), ' ');
        catch
            % 168 170
            % 169 171
            thisBad = {};
        end % try
        badList = vertcat(badList, thisBad);
    end % for
    % 174 176
    cleanList = setdiff(rawList, badList);
end
