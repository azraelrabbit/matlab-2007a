function drive_compile(Connectivity)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if eq(length(Connectivity.BlockHandles), 1.0)
        if isequal(get_param(Connectivity.BlockHandles(1.0), 'MaskType'), 'Driveline Environment')
            solverName = regexprep(getfullname(Connectivity.BlockHandles(1.0)), '\n', ' ');
            error('physmod:drive:drive_compile:UnattachedSolverBlock', horzcat('No driveline attached to Driveline Environment block ''', solverName, '''.  Either attach a driveline or delete the block before simulating.'));
        end
        return
    end
    % 23 25
    l_compositeDriveLibBlockCheck(Connectivity.BlockHandles);
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    nflanges = length(Connectivity.BlockHandles);
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    blockclasses = get_param(Connectivity.BlockHandles, 'BlockClass');
    [dummy, dummy, classidx] = unique(blockclasses);
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    blocknames = getfullname(Connectivity.BlockHandles);
    [dummy, uidx, blockidx] = unique(blocknames);
    blockhandles = Connectivity.BlockHandles(uidx);
    nblocks = length(blockhandles);
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    porttags = blocknames;
    for i=1.0:nflanges
        porttags{i} = drive_get_param(Connectivity.PortHandles(i), 'Tag');
    end % for
    [dummy, dummy, portidx] = unique(porttags);
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    sortmatrix = horzcat(classidx, portidx, blockidx);
    [dummy, firstsort] = unique(sortmatrix, 'rows');
    if lt(length(firstsort), nflanges)
        error('physmod:drive:drive_compile:NonUniqueFlangeIndex', 'assertion: non-unique sort');
    end
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    im_n = unique(or(Connectivity.ConnectivityMatrix, ctranspose(Connectivity.ConnectivityMatrix)), 'rows');
    % 76 79
    % 77 79
    im_b = sparse(nblocks, nflanges);
    for i=1.0:nflanges
        im_b(blockidx(i), i) = 1.0;
    end % for
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    solver = find(strcmpi(get_param(blockhandles, 'BlockClass'), 'solver'));
    solverhandle = blockhandles(solver);
    l_checknumsolvers(solverhandle, blocknames(uidx));
    % 89 91
    [connorder, blockorder, nodeorder] = drive_dfs(im_b, im_n, solver, firstsort);
    randsort = floor(evalin('base', 'drive_random_sort', '0'));
    if randsort
        fprintf('Randomizing block sort for driveline associated with %s based on the seed %d.\n', getfullname(solverhandle), randsort);
        rand('seed', randsort);
        connorder = connorder(randperm(nflanges));
        blockorder = blockorder(randperm(nblocks));
        nodeorder = nodeorder(randperm(length(nodeorder)));
    end
    % 99 101
    im_n = im_n(nodeorder, connorder);
    im_b = im_b(blockorder, connorder);
    blockhandles = blockhandles(blockorder);
    porthandles = Connectivity.PortHandles(connorder);
    % 104 106
    Data.SizesStructure = DRIVE.IoSizes;
    [Data.FlangeMap, dummy] = find(im_n);
    Data.FlangeMap = ctranspose(Data.FlangeMap);
    % 108 111
    % 109 111
    BlockCount = 1.0;
    BlockFileData = l_getBlockFileData;
    for i=1.0:nblocks
        Data.block = [];
        Data.BlockHandle = blockhandles(i);
        Data.PortIndex = find(im_b(i, :));
        Data.PortHandle = porthandles(Data.PortIndex);
        % 117 122
        % 118 122
        % 119 122
        % 120 122
        conncount = sum(im_n(:, Data.PortIndex), 2.0);
        if any(gt(conncount, 1.0))
            Name = getfullname(Data.BlockHandle);
            error('physmod:drive:drive_compile:DriveblockConnectingToItself', horzcat('DriveBlock:', Name, ' is connected to itself. This connection is illegal.', ' Disconnect one of the lines and connect it to a different block.'));
            % 125 128
            % 126 128
        end
        % 128 133
        % 129 133
        % 130 133
        % 131 133
        BlockClass = lower(get_param(Data.BlockHandle, 'BlockClass'));
        BlockFile = BlockFileData(strcmp(cellhorzcat(BlockFileData.Type), BlockClass)).Function;
        % 134 136
        ssc_callback(get_param(Data.BlockHandle, 'Object'), 'BLK_PRECOMPILE');
        Data = BlockFile('Compile', Data);
        DriveBlock(BlockCount) = Data.block;
        BlockCount = plus(BlockCount, 1.0);
        % 139 142
        % 140 142
    end % for
    % 142 144
    DriveCompilerData = DRIVE.DriveCompilerData;
    DriveCompilerData.name = getfullname(solverhandle);
    DriveCompilerData.block = DriveBlock;
    DriveCompilerData.ioSizes = Data.SizesStructure;
    % 147 153
    % 148 153
    % 149 153
    % 150 153
    % 151 153
    mdlhdl = bdroot(solverhandle);
    newMachineID = drive_compiler('Set', DriveCompilerData, mdlhdl);
    drive_set_param(solverhandle, 'MachineID', newMachineID);
    % 155 157
    drive_initializemask(solverhandle);
end
function l_checknumsolvers(solver, blocknames)
    % 159 165
    % 160 165
    % 161 165
    % 162 165
    % 163 165
    snames = blocknames;
    for i=1.0:length(snames)
        snames{i} = drive_sanitizeblockname(snames{i});
    end % for
    snames = unique(snames);
    % 169 171
    solvrmsg1 = 'Each driveline diagram must have exactly one Driveline Environment block.';
    % 171 174
    % 172 174
    if isempty(solver)
        msg = sprintf('%s The driveline consisting of the following blocks does not have a connected Driveline Environment block:\n', solvrmsg1);
        % 175 177
        for i=1.0:length(snames)
            msg = sprintf('%s''%s'',\n', msg, snames{i});
        end % for
        msg = sprintf('%sConnect one Driveline Environment block to the driveline diagram.', msg);
        error('physmod:drive:drive_compile:MissingDrivelineEnvBlock', msg);
    else
        if gt(length(solver), 1.0)
            msg = sprintf('%s The driveline consisting of the following block has too many Driveline Environment blocks:\n', solvrmsg1);
            for i=1.0:length(snames)
                msg = sprintf('%s''%s'',\n', msg, snames{i});
            end % for
            msg = sprintf('%sRemove all but one Driveline Environment block from the driveline diagram.', msg);
            error('physmod:drive:drive_compile:TooManyDrivelineEnvBlock', msg);
        end
    end
end
function l_compositeDriveLibBlockCheck(blockItem)
    % 193 198
    % 194 198
    % 195 198
    % 196 198
    [blockList, parentList] = drive_generatehierarchy(blockItem);
    errMsgs = drive_toplevelblockvalidate(blockList, parentList);
    if not(isempty(errMsgs))
        error('physmod:drive:drive_compile:InvalidBlockParameters', errMsgs);
    end
end
function l_dump_DriveCompilerData(DriveCompilerData)
    % 204 215
    % 205 215
    % 206 215
    % 207 215
    % 208 215
    % 209 215
    % 210 215
    % 211 215
    % 212 215
    % 213 215
    numberOfBlocks = length(DriveCompilerData.block);
    fprintf(1.0, '*** START DriveCompilerData (%i blocks) ***\n', numberOfBlocks);
    fprintf(1.0, '%4s  %20s  %40s %s\n', 'Num', 'Type', 'Name', 'Flanges');
    for blockIndex=1.0:numberOfBlocks
        blockName = drive_sanitizeblockname(DriveCompilerData.block(blockIndex).name);
        blockType = DriveCompilerData.block(blockIndex).type;
        blockFlange = DriveCompilerData.block(blockIndex).flange;
        fprintf(1.0, '[%2i]: %20s  %40s', blockIndex, blockType, blockName);
        fprintf(1.0, ' %3i', blockFlange);
        fprintf(1.0, '\n');
    end % for
    fprintf(1.0, '*** END DriveCompilerData ***\n');
end
function BlockFileData = l_getBlockFileData
    % 228 236
    % 229 236
    % 230 236
    % 231 236
    % 232 236
    % 233 236
    % 234 236
    persistent fBlockData;
    % 236 238
    if isempty(fBlockData)
        % 238 240
        blockTypes = {'weld','free','clutch','impact','solver','inertia','efficiency','lossyringplanet','lossyplanetplanet','transducer','straingauge','simplegear','variablegear','ringplanet','planetplanet'};
        % 240 258
        % 241 258
        % 242 258
        % 243 258
        % 244 258
        % 245 258
        % 246 258
        % 247 258
        % 248 258
        % 249 258
        % 250 258
        % 251 258
        % 252 258
        % 253 258
        % 254 258
        % 255 258
        % 256 258
        blockFunctions = cellhorzcat(@drive_weldblock, @drive_freegearblock, @drive_clutchblock, @drive_impactblock, @drive_solverblock, @drive_inertiablock, @drive_efficiencyblock, @drive_lossyplanetringblock, @drive_lossyplanetplanetblock, @drive_transducerblock, @drive_straingaugeblock, @drive_simplegearblock, @drive_variablegearblock, @drive_ringplanetblock, @drive_planetplanetblock);
        % 258 276
        % 259 276
        % 260 276
        % 261 276
        % 262 276
        % 263 276
        % 264 276
        % 265 276
        % 266 276
        % 267 276
        % 268 276
        % 269 276
        % 270 276
        % 271 276
        % 272 276
        % 273 276
        % 274 276
        fBlockData = struct('Type', blockTypes, 'Function', blockFunctions);
        % 276 279
        % 277 279
    end
    % 279 281
    BlockFileData = fBlockData;
end
