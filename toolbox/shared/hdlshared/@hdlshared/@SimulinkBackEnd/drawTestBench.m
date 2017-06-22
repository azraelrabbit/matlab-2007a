function drawTestBench(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hdldisp(sprintf('Drawing test bench...'), 3.0);
    % 8 10
    inFileName = this.InModelFile;
    outFileName = this.OutModelFile;
    slAutoRoute = this.AutoRoute;
    % 12 16
    % 13 16
    % 14 16
    if strcmp(this.RootNetworkName, this.InModelFile)
        return
    end
    % 18 21
    % 19 21
    srcMdlObj = get_param(inFileName, 'Object');
    % 21 24
    % 22 24
    topLevelBlks = srcMdlObj.Blocks;
    % 24 26
    for ii=1.0:length(topLevelBlks)
        srcBlk = fixBlockName(topLevelBlks{ii});
        % 27 29
        if not(isValidTestBenchBlock(this, srcBlk))
            continue;
        end
        tgtBlk = regexprep(srcBlk, horzcat('^', inFileName), outFileName);
        srcBlkPath = horzcat(inFileName, '/', srcBlk);
        tgtBlkPath = horzcat(outFileName, '/', tgtBlk);
        blockType = findBlockType(horzcat(inFileName, '/', srcBlk));
        if isVirtual(blockType)
            generateSLBlock(srcBlkPath, tgtBlkPath);
        else
            add_block(srcBlkPath, tgtBlkPath);
        end
    end % for
    % 41 44
    % 42 44
    topLevelLines = srcMdlObj.Lines;
    % 44 46
    for kk=1.0:length(topLevelLines)
        line = topLevelLines(kk);
        % 47 49
        if eq(line.SrcBlock, -1.0)
            continue;
        end
        % 51 53
        srcPort = horzcat(fixBlockName(get_param(line.SrcBlock, 'Name')), '/', line.SrcPort);
        addTBLines(this, srcPort, line);
    end % for
end
function blockType = findBlockType(blk)
    libBlocks = 'SubSystem S-Function M-S-Function';
    blockType = get_param(blk, 'BlockType');
    if findstr(blockType, libBlocks)
        blockType = get_param(blk, 'ReferenceBlock');
    end
end
function addTBLines(this, srcPort, line)
    % 64 66
    if not(isempty(line.DstBlock))
        if eq(line.DstBlock, -1.0)
            return
        end
        % 69 72
        % 70 72
        dstPort = horzcat(fixBlockName(get_param(line.DstBlock, 'Name')), '/', line.DstPort);
        drawTBLine(this, srcPort, dstPort);
    else
        % 74 76
        for mm=1.0:length(line.Branch)
            branch = line.Branch(mm);
            addTBLines(this, srcPort, branch);
        end % for
    end
end
function drawTBLine(this, srcPort, dstPort)
    % 82 85
    % 83 85
    if this.AutoRoute
        add_line(this.OutModelFile, srcPort, dstPort, 'autorouting', 'on');
    else
        add_line(this.OutModelFile, srcPort, dstPort);
    end
end
function valid = isValidTestBenchBlock(this, tbBlk)
    % 91 94
    % 92 94
    valid = 1.0;
    if strcmp(tbBlk, this.InModelFile)
        % 95 97
        valid = 0.0;
    else
        if strcmp(horzcat(this.InModelFile, '/', tbBlk), this.RootNetworkName)
            valid = 0.0;
        end
    end
end
function blkName = fixBlockName(name)
    % 104 109
    % 105 109
    % 106 109
    % 107 109
    blkName = strrep(name, '/', '//');
end
function generateSLBlock(srcBlkPath, tgtBlkPath)
    % 111 113
    addSLBlockSubsystem(srcBlkPath, tgtBlkPath);
    [outputBlk, outputBlkPosition] = addSLBlockModel(srcBlkPath, tgtBlkPath);
    addSLBlockSignalConversion(srcBlkPath, tgtBlkPath, outputBlk, outputBlkPosition);
end
function addSLBlockSubsystem(originalBlkPath, targetBlkPath)
    % 117 119
    originalBlkPosition = get_param(originalBlkPath, 'Position');
    originalBlkOrientation = get_param(originalBlkPath, 'Orientation');
    % 120 122
    add_block('built-in/Subsystem', targetBlkPath);
    set_param(targetBlkPath, 'Position', originalBlkPosition);
    set_param(targetBlkPath, 'Orientation', originalBlkOrientation);
    % 124 126
    color = 'Cyan';
    turnhilitingon = 1.0;
    % 127 129
    set_param(targetBlkPath, 'BackgroundColor', color);
    % 129 131
    if turnhilitingon
        hiliteBlkAncestors(targetBlkPath, color);
    end
    % 133 135
    for ii=1.0:length(get_param(originalBlkPath, 'InputSignalNames'))
        inportPath{ii} = horzcat(targetBlkPath, '/In', num2str(ii));
        add_block('built-in/Inport', inportPath{ii});
        set_param(inportPath{ii}, 'Position', horzcat(85.0, plus(78.0, mtimes(minus(ii, 1.0), 20.0)), 115.0, plus(92.0, mtimes(minus(ii, 1.0), 20.0))));
    end % for
    % 139 141
    for ii=1.0:length(get_param(originalBlkPath, 'OutputSignalNames'))
        outportPath{ii} = horzcat(targetBlkPath, '/Out', num2str(ii));
        add_block('built-in/Outport', outportPath{ii});
        set_param(outportPath{ii}, 'Position', horzcat(395.0, plus(88.0, mtimes(minus(ii, 1.0), 20.0)), 425.0, plus(102.0, mtimes(minus(ii, 1.0), 20.0))));
    end % for
end
function hiliteBlkAncestors(blkPath, color)
    while not(isempty(blkPath))
        set_param(blkPath, 'BackgroundColor', color);
        blkPath = get_param(blkPath, 'Parent');
        if isempty(get_param(blkPath, 'Parent'))
            break
        end
    end % while
end
function [outputBlk, outputBlkPosition] = addSLBlockModel(originalBlkPath, targetBlkPath)
    % 156 159
    % 157 159
    in = get_param(originalBlkPath, 'InputSignalNames');
    Name = get_param(originalBlkPath, 'Name');
    start_position = [185.0 75.0];
    move_right = [100.0 0.0];
    move_down = [0.0 100.0];
    % 163 165
    origBlkPortDataType = get_param(originalBlkPath, 'CompiledPortDataTypes');
    OutDataTypeMode = origBlkPortDataType.Outport;
    blkpath = horzcat(targetBlkPath, '/', Name);
    blkSize = blockSize(originalBlkPath);
    add_block(originalBlkPath, blkpath);
    blkPosition = horzcat(start_position, plus(start_position, blkSize));
    start_position = plus(start_position, move_right);
    set_param(blkpath, 'Position', blkPosition);
    % 172 175
    % 173 175
    for i=1.0:length(in)
        add_line(targetBlkPath, horzcat('In', num2str(i), '/1'), horzcat(Name, '/', num2str(i)), 'autorouting', 'on');
    end % for
    outputBlk = Name;
    outputBlkPosition = start_position;
end
function blkSize = blockSize(Block)
    % 181 183
    Position = get_param(Block, 'Position');
    blkSize = horzcat(minus(Position(3.0), Position(1.0)), minus(Position(4.0), Position(2.0)));
end
function addSLBlockSignalConversion(originalBlkPath, targetBlkPath, outputBlk, outputBlkPosition)
    % 186 189
    % 187 189
    blkSize = [20.0 40.0];
    blkPosition = horzcat(plus(outputBlkPosition(1.0), 50.0), outputBlkPosition(2.0));
    move_down = [0.0 50.0];
    Name = get_param(originalBlkPath, 'Name');
    % 192 195
    % 193 195
    color = 'Cyan';
    turnhilitingon = 1.0;
    % 196 198
    for ii=1.0:length(get_param(targetBlkPath, 'OutputSignalNames'))
        blkPosition = plus(blkPosition, mtimes(minus(ii, 1.0), move_down));
        position = horzcat(blkPosition, plus(blkPosition, blkSize));
        genSignalConversionPath = horzcat(targetBlkPath, '/', Name, '_SignalConversion', num2str(ii));
        add_block('built-in/SignalConversion', genSignalConversionPath);
        set_param(genSignalConversionPath, 'Position', position);
        set_param(genSignalConversionPath, 'ConversionOutput', 'Contiguous copy');
        set_param(genSignalConversionPath, 'OverrideOpt', 'on')
        add_line(targetBlkPath, horzcat(outputBlk, '/', num2str(ii)), horzcat(Name, '_SignalConversion', num2str(ii), '/1'), 'autorouting', 'on');
        add_line(targetBlkPath, horzcat(Name, '_SignalConversion', num2str(ii), '/1'), horzcat('Out', num2str(ii), '/1'), 'autorouting', 'on');
    end % for
end
function makeSyntheticBlkPassThrough(hC, syntheticBlkPath)
    % 210 215
    % 211 215
    % 212 215
    % 213 215
    hdltargetcc = hdltargetmodelcc(hC.SimulinkHandle);
    % 215 217
    if not(isempty(hdltargetcc))
        hdltargetcc.forEach(syntheticBlkPath, 'simulink/Discrete/Integer Delay', {}, 'hdldefaults.PassThroughHDLEmission');
    else
        % 219 222
        % 220 222
        % 221 224
        % 222 224
    end
end
function found = isVirtual(blkName)
    % 226 228
    virtualBlocks = cellhorzcat('Mux', 'Selector', 'Demux', 'ComplexToRealImag', 'FrameConversion', horzcat('dspobslib/Frame Status', char(10.0), 'Conversion'));
    % 228 230
    found = 0.0;
    for i=1.0:length(virtualBlocks)
        if strcmp(blkName, virtualBlocks{i})
            found = 1.0;
            break
        end
    end % for
end
