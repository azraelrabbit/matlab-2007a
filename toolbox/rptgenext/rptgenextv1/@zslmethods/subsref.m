function B = subsref(A, S)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    d = rgstoredata(A);
    if isempty(d)
        d = initialize(A, '-noinitialize');
    end
    % 11 13
    B = subsref(d, S);
    if isempty(B)
        d = LocGuess(d, S(1.0).subs);
        rgstoredata(A, d);
        B = subsref(d, S);
    end
end
function slData = LocGuess(slData, whichField)
    % 20 23
    % 21 23
    if isfield(slData, whichField)
        fieldVal = getfield(slData, whichField);
        if ~(isempty(fieldVal))
            return
        end
    else
        fieldVal = [];
    end
    % 30 32
    switch whichField
    case 'Model'
        % 33 35
        slData.Model = bdroot(get_param(0.0, 'CurrentSystem'));
        if ~(isempty(slData.Model))
            if ~(strcmp(get_param(slData.Model, 'blockdiagramtype'), 'model'))
                mdlList = find_system('SearchDepth', 1.0, 'blockdiagramtype', 'model');
                if isempty(mdlList)
                    slData.Model = [];
                else
                    slData.Model = mdlList{1.0};
                    set_param(0.0, 'CurrentSystem', slData.Model);
                end
            end
        end
    case 'System'
        % 47 49
        slData = LocGuess(slData, 'Model');
        if ~(isempty(slData.Model))
            if ~(isempty(find_system('SearchDepth', 1.0, 'blockdiagramtype', 'model', 'Name', slData.Model)))
                % 51 54
                % 52 54
                slData.System = get_param(0.0, 'CurrentSystem');
            else
                slData.Model = [];
                slData = LocGuess(slData, 'Model');
                slData = LocGuess(slData, 'System');
            end
        end
    case 'Block'
        % 61 63
        slData = LocGuess(slData, 'System');
        if ~(isempty(slData.System))
            try
                slData.Block = horzcat(slData.System, '/', get_param(slData.System, 'CurrentBlock'));
            catch
                % 67 69
                slData.System = [];
                slData = LocGuess(slData, 'System');
                slData = LocGuess(slData, 'Block');
            end % try
        end
        if ~(isempty(find_system(slData.Block, 'SearchDepth', 0.0, 'Regexp', 'on', 'PhysicalDomain', '.')))
            % 74 78
            % 75 78
            % 76 78
            slData.Block = [];
            % 78 80
        end
    case 'Signal'
        % 81 83
        slData = LocGuess(slData, 'System');
        if ~(isempty(slData.System))
            try
                signalList = find_system(slData.System, 'findall', 'on', 'SearchDepth', 1.0, 'type', 'port', 'porttype', 'outport');
                % 86 91
                % 87 91
                % 88 91
                % 89 91
                if gt(length(signalList), 1.0)
                    slData.Signal = signalList(1.0);
                end
            catch
                slData.System = [];
                slData = LocGuess(slData, 'System');
                slData = LocGuess(slData, 'Signal');
            end % try
        end
        % 100 102
    case 'MdlCurrSys'
        % 101 103
        slData.MdlCurrSys = {'$current'};
    case 'SysLoopType'
        % 104 106
        slData.SysLoopType = '$current';
    case 'isMask'
        % 107 109
        slData.isMask = 'graphical';
    case 'isLibrary'
        % 110 112
        slData.isLibrary = 'off';
        % 113 115
    case 'ReportedSystemList'
        % 114 116
        slData = LocGuess(slData, 'Model');
        slData = LocGuess(slData, 'System');
        slData = LocGuess(slData, 'MdlCurrSys');
        slData = LocGuess(slData, 'SysLoopType');
        slData = LocGuess(slData, 'isMask');
        slData = LocGuess(slData, 'isLibrary');
        % 121 123
        slData.ReportedSystemList = LocReportedSystems(slData);
    case 'ReportedBlockList'
        % 124 126
        slData = LocGuess(slData, 'ReportedSystemList');
        bList = find_system(slData.ReportedSystemList, 'SearchDepth', 1.0, 'type', 'block');
        % 127 132
        % 128 132
        % 129 132
        % 130 132
        slData.ReportedBlockList = LocRemovePhysmod(bList);
        % 133 135
    case 'ReportedSignalList'
        % 134 137
        % 135 137
        slData = LocGuess(slData, 'ReportedSystemList');
        sList = find_system(slData.ReportedSystemList, 'findall', 'on', 'SearchDepth', 1.0, 'type', 'port', 'porttype', 'outport');
        % 138 144
        % 139 144
        % 140 144
        % 141 144
        % 142 144
        slData.ReportedSignalList = unique(sList);
        % 145 159
        % 146 159
        % 147 159
        % 148 159
        % 149 159
        % 150 159
        % 151 159
        % 152 159
        % 153 159
        % 154 159
        % 155 159
        % 156 159
        % 157 159
    case 'WordAllList'
        % 158 160
        slData = LocGuess(slData, 'ReportedBlockList');
        slData.WordAllList = wordlist(zslmethods, 'LocGetWordList', slData.ReportedBlockList);
        % 162 165
        % 163 165
    case 'WordFunctionList'
        % 164 166
        slData = LocGuess(slData, 'WordAllList');
        slData.WordFunctionList = wordlist(zslmethods, 'LocGetFunctionList', slData.WordAllList);
        % 168 171
        % 169 171
    case 'WordVariableList'
        % 170 172
        slData = LocGuess(slData, 'WordAllList');
        slData.WordVariableList = wordlist(zslmethods, 'LocGetVariableList', slData.WordAllList);
        % 174 178
        % 175 178
        % 176 178
    case 'PreRunOpenModels'
        % 177 179
        slData.PreRunOpenModels = find_system('SearchDepth', 1.0, 'type', 'block_diagram', 'blockdiagramtype', 'model');
        % 179 190
        % 180 190
        % 181 190
        % 182 190
        % 183 190
        % 184 190
        % 185 190
        % 186 190
        % 187 190
        % 188 190
    end
end
function rsl = LocReportedSystems(slData)
    % 192 206
    % 193 206
    % 194 206
    % 195 206
    % 196 206
    % 197 206
    % 198 206
    % 199 206
    % 200 206
    % 201 206
    % 202 206
    % 203 206
    % 204 206
    if (isempty(slData.MdlCurrSys)) | (isempty(slData.Model))
        rsl = {};
    else
        % 208 210
        csl = unique(strrep(strrep(slData.MdlCurrSys, '$current', slData.System), '$top', slData.Model));
        % 210 215
        % 211 215
        % 212 215
        % 213 215
        switch slData.SysLoopType
        case '$current'
            rsl = csl;
            libPostProcess = 0.0;
        case '$currentAbove'
            rsl = {};
            for i=1.0:length(csl)
                rsl = vertcat(rsl, LocTraverseUp(csl(i)));
            end % for
            rsl = unique(rsl);
            libPostProcess = 0.0;
        otherwise
            if strcmp(slData.SysLoopType, '$all')
                startSystem = cellhorzcat(slData.Model);
            else
                startSystem = csl;
            end
            % 231 233
            switch slData.isMask
            case 'none'
                maskSwitch = 'none';
                maskFind = {'mask','off'};
            case 'functional'
                maskSwitch = 'functional';
                maskFind = {'MaskHelp','','MaskDescription','','MaskVariables',''};
                % 240 242
            case {'all','on',logical(1)}
                % 241 243
                maskSwitch = 'all';
                maskFind = {'type','block'};
            otherwise
                % 245 247
                maskSwitch = 'graphical';
                maskFind = {'MaskHelp','','MaskDescription','','MaskVariables','','MaskInitialization',''};
                % 248 252
                % 249 252
                % 250 252
            end
            % 252 254
            switch slData.isLibrary
            case {'on',logical(1)}
                libSwitch = 'on';
                libPostProcess = 0.0;
            case 'unique'
                libSwitch = 'on';
                libPostProcess = 1.0;
            otherwise
                % 261 263
                libSwitch = 'off';
                libPostProcess = -1.0;
            end
            % 265 267
            findCell = cellhorzcat('LookUnderMasks', maskSwitch, 'FollowLinks', libSwitch, 'blocktype', 'SubSystem');
            % 267 271
            % 268 271
            % 269 271
            rsl = union(find_system(startSystem, findCell{:}, maskFind{:}), startSystem);
            % 271 274
            % 272 274
            if ne(libPostProcess, 0.0)
                rsl = LocFilterLibraries(rsl, libPostProcess);
            else
                % 276 278
                rsl = rsl(:);
            end
        end
        % 280 282
        rsl = excludesystems(zslmethods, rsl);
        % 282 284
    end
end
function strOnOff = LocOnOff(logOnOff)
    % 286 290
    % 287 290
    % 288 290
    if logOnOff
        strOnOff = 'on';
    else
        strOnOff = 'off';
    end
end
function sList = LocTraverseUp(sList)
    % 296 299
    % 297 299
    sParent = get_param(sList{end}, 'Parent');
    if ~(isempty(sParent))
        sList = vertcat(sList, cellhorzcat(sParent));
    end
end
function uniqueList = LocFilterLibraries(allList, actionType)
    % 304 309
    % 305 309
    % 306 309
    % 307 309
    blockList = find_system(allList, 'SearchDepth', 0.0, 'type', 'block');
    % 309 312
    % 310 312
    unlinkedBlocks = find_system(blockList, 'SearchDepth', 0.0, 'LinkStatus', 'none');
    % 312 315
    % 313 315
    linkedBlocks = setdiff(blockList, unlinkedBlocks);
    % 315 317
    if ~(isempty(linkedBlocks))
        modelList = setdiff(allList, blockList);
        if gt(actionType, 0.0)
            refBlocks = getparam(zslmethods, linkedBlocks, 'referenceblock');
            [uniqRefBlocks, uniqIndex] = unique(refBlocks);
            % 321 323
            uniqLinkedBlocks = linkedBlocks(uniqIndex);
            % 323 325
            uniqueList = vertcat(modelList(:), unlinkedBlocks(:), uniqLinkedBlocks(:));
        else
            % 326 328
            % 327 329
            uniqueList = vertcat(modelList(:), unlinkedBlocks(:));
            % 329 331
        end
    else
        uniqueList = allList(:);
    end
end
function bList = LocRemovePhysmod(bList)
    % 336 340
    % 337 340
    % 338 340
    pmBlocks = find_system(bList, 'SearchDepth', 0.0, 'Regexp', 'on', 'PhysicalDomain', '.');
    % 340 345
    % 341 345
    % 342 345
    % 343 345
    if ~(isempty(pmBlocks))
        % 345 347
        bList = setdiff(bList, pmBlocks);
    else
        bList = unique(bList);
    end
end
