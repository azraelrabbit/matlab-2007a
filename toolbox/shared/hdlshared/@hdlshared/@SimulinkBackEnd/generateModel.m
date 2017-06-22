function generateModel(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    disp(' ');
    % 10 12
    if strcmp(this.ShowModel, 'yes')
        hdldisp(sprintf('Begin Model Generation'), 1.0);
    end
    % 14 16
    hPir = this.hPir;
    % 16 19
    % 17 19
    if not(validatePir(this, hPir))
        return
    end
    % 21 24
    % 22 24
    createAndInitTargetModel(this);
    % 24 28
    % 25 28
    % 26 28
    useDot = strcmpi(this.useDotLayout, 'yes') || isPirSynthetic(this);
    if useDot
        this.generateDotLayoutInfo;
    end
    % 31 34
    % 32 34
    this.startLayout;
    % 34 37
    % 35 37
    vNetworks = hPir.Networks;
    for i=1.0:length(vNetworks)
        % 38 40
        hN = vNetworks(i);
        if not(isValidNetwork(this, hN))
            continue;
        end
        % 43 45
        ntwkName = hN.Name;
        mdlPath = getTargetModelPath(this, ntwkName);
        % 46 48
        hdldisp(sprintf('Working on Network ---> %s', ntwkName), 3.0);
        % 48 50
        drawSLBlocks(this, mdlPath, hN);
        % 50 52
        if strcmpi(this.useDotLayout, 'yes') || hN.Synthetic
            applyDotLayoutInfo(this, mdlPath, hN);
        else
            applySimulinkLayoutInfo(this, mdlPath, hN);
        end
        % 56 58
        drawBlkEdges(this, mdlPath, hN);
    end % for
    % 59 62
    % 60 62
    fixTopLevelSubsystem(this);
    % 62 65
    % 63 65
    this.drawTestBench;
    % 65 68
    % 66 68
    openOutputModel(this);
    % 68 70
    if strcmpi(this.ShowModel, 'yes')
        hdldisp(sprintf('Model Generation Complete.'), 1.0);
    end
    % 72 74
    cleanupFiles(this, useDot);
    % 74 76
end
function openOutputModel(this)
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    if strcmpi(this.ShowModel, 'yes')
        open_system(this.OutModelFile);
    end
end
function valid = validatePir(this, hPir)
    % 86 89
    % 87 89
    valid = 1.0;
    % 89 91
    try
        if not(isa(hPir, 'hdlcoder.pir')) || isempty(hPir.Networks) || isempty(hPir.getTopNetwork.Name)
            % 92 95
            % 93 95
            warning(hdlerrormsgid('simulinkbackend'), 'Invalid PIR, Model not exported');
        end
    catch
        valid = 0.0;
        return
    end % try
    % 100 106
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    ntwkName = hPir.getTopNetwork.Name;
    this.RootNetworkName = ntwkName;
    % 107 110
    % 108 110
    modelName = strtok(ntwkName, '/');
    searchInputMdl = find_system('type', 'block_diagram', 'name', modelName);
    % 111 113
    if not(isempty(searchInputMdl))
        this.SourceModelValid = 1.0;
        cacheInputModelParams(this, modelName);
    end
    % 116 120
    % 117 120
    % 118 120
end
function valid = isValidNetwork(this, hN)
    % 121 124
    % 122 124
    valid = 1.0;
    if strcmp(this.hPir.getTimingControllerName, hN.Name)
        valid = 0.0;
    end
    % 127 129
end
function cacheInputModelParams(this, mdlName)
    % 130 136
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    try
        load_system(mdlName);
        % 137 139
        if isempty(this.SolverName)
            this.SolverName = get_param(mdlName, 'SolverName');
            % 140 142
            if isempty(this.FixedStepSize)
                if strcmpi(this.SolverName, 'FixedStepDiscrete')
                    this.FixedStepSize = get_param(mdlName, 'FixedStep');
                end
            end
        end
        % 147 149
        if eq(this.TotalRunTime, 0.0)
            this.TotalRunTime = get_param(mdlName, 'StopTime');
        end
    catch
        error(hdlerrormsgid('simulinkbackend'), 'Could not open input model with name %s', mdlName);
    end % try
end
function mdlPath = getTargetModelPath(this, ntwkName)
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    mdlPath = regexprep(ntwkName, horzcat('^', this.InModelFile), this.OutModelFile);
    % 161 165
    % 162 165
    % 163 165
end
function outMdlFile = createAndInitTargetModel(this)
    % 166 170
    % 167 170
    % 168 170
    hdldisp(sprintf('Creating Target model'), 3.0);
    % 170 172
    modelGenDir = '.';
    inMdlFile = this.InModelFile;
    outMdlFile = this.getUniqueOutputModelName(modelGenDir, inMdlFile);
    this.createTargetModel(modelGenDir, outMdlFile);
    this.initOutputModel(inMdlFile, outMdlFile);
    % 176 178
    if strcmpi(this.ShowModel, 'yes')
        hdldisp(sprintf('Generating new model: <a href="matlab:open_system(''%s'')">%s.mdl</a>', outMdlFile, outMdlFile), 1.0);
        % 179 181
    end
    % 181 183
end
function fixTopLevelSubsystem(this)
    % 184 189
    % 185 189
    % 186 189
    % 187 189
    hdldisp(sprintf('Fixing top level subsystem...'), 3.0);
    % 189 191
    inDut = this.RootNetworkName;
    % 191 193
    if strcmp(inDut, this.InModelFile)
        % 193 196
        % 194 196
        return
    end
    % 197 199
    outDut = regexprep(inDut, horzcat('^', this.InModelFile), this.OutModelFile);
    % 199 201
    srcBlkh = get_param(inDut, 'Handle');
    srcPos = get_param(srcBlkh, 'Position');
    srcOrientation = get_param(srcBlkh, 'Orientation');
    % 203 205
    set_param(outDut, 'Position', srcPos);
    set_param(outDut, 'Orientation', srcOrientation);
    % 206 208
end
function cleanupFiles(this, useDot)
    % 209 213
    % 210 213
    % 211 213
    if useDot && strcmp(this.SaveTemps, 'no')
        delete(this.DotFile);
        delete(this.LayoutFile);
    end
    % 216 218
end
function result = isPirSynthetic(this)
    % 219 224
    % 220 224
    % 221 224
    % 222 224
    result = false;
    % 224 226
    p = this.hPir;
    vN = p.Networks;
    for ii=1.0:length(vN)
        hN = vN(ii);
        if hN.Synthetic
            result = true;
            break
        end
    end % for
end
