function [outputBlk, outputBlkPosition] = addSLBlockModel(this, hC, originalBlkPath, targetBlkPath)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    decomposition = 1.0;
    bfp = hC.SimulinkHandle;
    % 11 12
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        rnd = get_param(bfp, 'roundingMode');
        sat = strcmp(get_param(bfp, 'overflowMode'), 'on');
    else
        sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
        rnd = get_param(bfp, 'RndMeth');
    end % if
    % 19 20
    in = hC.InputPorts(1.0).getSignal;
    % 21 22
    if eq(length(in), 1.0)
        invectsize = max(hdlsignalvector(in));
        if all(eq(invectsize, 0.0))
            invect = in;
        else
            invect = hdlexpandvectorsignal(in);
        end % if
    else
        invect = in;
    end % if
    % 32 33
    config.invectsize = invectsize;
    config.decomposition = decomposition;
    config.rounding = rnd;
    config.saturation = sat;
    % 37 38
    [outputBlk, outputBlkPosition] = implement_cascade(hC, config, originalBlkPath, targetBlkPath);
end % function
function [outputBlk, outputBlkPosition] = implement_cascade(hC, config, originalBlkPath, targetBlkPath)
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    start_position = [185.0 75.0];
    move_right = [200.0 0.0];
    move_down = [0.0 100.0];
    % 48 49
    if lt(config.invectsize, 2.0)
        decompose_vector = 1.0;
    else
        decompose_vector = hdlcascadedecompose(config.invectsize, config.decomposition);
    end % if
    % 54 55
    first_element = 1.0;
    invect_cell = {};
    for cloop=1.0:length(decompose_vector)
        invect_1 = [];
        if eq(cloop, length(decompose_vector))
            last_element = minus(plus(decompose_vector(cloop), first_element), 1.0);
            for i=first_element:last_element
                invect_1 = horzcat(invect_1, minus(plus(cloop, i), 1.0));
            end % for
        else
            last_element = minus(plus(decompose_vector(cloop), first_element), 2.0);
            for i=first_element:last_element
                invect_1 = horzcat(invect_1, minus(plus(cloop, i), 1.0));
            end % for
            % 69 70
        end % if
        first_element = minus(plus(first_element, decompose_vector(cloop)), 2.0);
        invect_cell{plus(end, 1.0)} = invect_1;
    end % for
    % 74 75
    out = hC.OutputPorts(1.0).getSignal;
    [mode, dt, scl] = localGetModeOutDataTypeScaling(out);
    if eq(length(decompose_vector), 1.0)
        blkpath = horzcat(targetBlkPath, '/', hC.Name);
        blkSize = blockSize(originalBlkPath);
        add_block(originalBlkPath, blkpath);
        set_param(blkpath, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
        % 82 87
        % 83 87
        % 84 87
        % 85 87
        % 86 87
        add_line(targetBlkPath, 'In1/1', horzcat(hC.Name, '/1'), 'autorouting', 'on');
        outputBlk = hC.Name;
        outputBlkPosition = plus(start_position, horzcat(blkSize(1.0), 0.0));
    else
        % 91 92
        origBlkPortDataType = get_param(originalBlkPath, 'CompiledPortDataTypes');
        OutDataTypeMode = origBlkPortDataType.Outport;
        % 94 95
        genDataTypeConvertorPath = horzcat(targetBlkPath, '/', hC.Name, '_DataTypeConvertor');
        % 96 97
        add_block('built-in/DataTypeConversion', genDataTypeConvertorPath, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
        % 98 104
        % 99 104
        % 100 104
        % 101 104
        % 102 104
        % 103 104
        blkPosition = horzcat(start_position, plus(start_position, blockSize(genDataTypeConvertorPath)));
        set_param(genDataTypeConvertorPath, 'Position', blkPosition);
        add_line(targetBlkPath, 'In1/1', horzcat(hC.Name, '_DataTypeConvertor', '/1'), 'autorouting', 'on');
        start_position = plus(start_position, move_right);
        % 108 109
        for cloop=1.0:length(decompose_vector)
            genSelectorPath = horzcat(targetBlkPath, '/', hC.Name, '_selector', num2str(cloop));
            add_block('built-in/Selector', genSelectorPath);
            set_param(genSelectorPath, 'inputtype', 'Vector');
            set_param(genSelectorPath, 'inputPortWidth', num2str(config.invectsize));
            set_param(genSelectorPath, 'elements', vector2str(invect_cell{cloop}));
            localMoveDown = mtimes(move_down, minus(cloop, 1.0));
            blkPosition = horzcat(plus(start_position, localMoveDown), plus(plus(start_position, localMoveDown), blockSize(genSelectorPath)));
            set_param(genSelectorPath, 'Position', blkPosition);
            add_line(targetBlkPath, horzcat(hC.Name, '_DataTypeConvertor', '/1'), horzcat(hC.Name, '_selector', num2str(cloop), '/1'), 'autorouting', 'on');
            % 119 120
        end % for
        start_position = plus(start_position, mtimes(plus(length(decompose_vector), 1.0), move_right));
        % 122 124
        % 123 124
        blkPosition = horzcat(start_position, plus(start_position, blockSize(horzcat(targetBlkPath, '/Out1'))));
        set_param(horzcat(targetBlkPath, '/Out1'), 'Position', blkPosition);
        % 126 127
        start_position = minus(start_position, move_right);
        % 128 129
        for cloop=1.0:length(decompose_vector)
            % 130 132
            % 131 132
            if eq(config.decomposition, 0.0)
                sufix = '';
            else
                sufix = horzcat('_', num2str(decompose_vector(cloop)));
            end % if
            if ne(cloop, length(decompose_vector))
                % 138 139
                blkpath = horzcat(targetBlkPath, '/', hC.Name, '_Mux', sufix);
                add_block('built-in/Mux', blkpath);
                set_param(blkpath, 'Inputs', '2');
                set_param(blkpath, 'displayOption', 'bar');
                blkPosition = horzcat(minus(start_position, [70.0 0.0]), plus(minus(start_position, [70.0 0.0]), blockSize(blkpath)));
                set_param(blkpath, 'Position', blkPosition);
                % 145 146
                add_line(targetBlkPath, horzcat(hC.Name, '_selector', num2str(cloop), '/1'), horzcat(hC.Name, '_Mux', sufix, '/1'), 'autorouting', 'on');
                % 147 149
                % 148 149
                blkpath = horzcat(targetBlkPath, '/', hC.Name, sufix);
                blkSize = blockSize(originalBlkPath);
                add_block(originalBlkPath, blkpath);
                blkPosition = horzcat(start_position, plus(start_position, blkSize));
                set_param(blkpath, 'Position', blkPosition, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
                % 154 162
                % 155 162
                % 156 162
                % 157 162
                % 158 162
                % 159 162
                % 160 162
                % 161 162
                add_line(targetBlkPath, horzcat(hC.Name, '_Mux', sufix, '/1'), horzcat(hC.Name, sufix, '/1'), 'autorouting', 'on');
                if eq(cloop, 1.0)
                    outputBlkPosition = plus(start_position, horzcat(blkSize(1.0), 0.0));
                end % if
            else
                % 167 168
                blkpath = horzcat(targetBlkPath, '/', hC.Name, sufix);
                add_block(originalBlkPath, blkpath);
                blkPosition = horzcat(start_position, plus(start_position, blockSize(originalBlkPath)));
                set_param(blkpath, 'Position', blkPosition, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
                % 172 180
                % 173 180
                % 174 180
                % 175 180
                % 176 180
                % 177 180
                % 178 180
                % 179 180
                add_line(targetBlkPath, horzcat(hC.Name, '_selector', num2str(cloop), '/1'), horzcat(hC.Name, sufix, '/1'), 'autorouting', 'on');
                % 181 182
            end % if
            if eq(cloop, 1.0)
                outputBlk = horzcat(hC.Name, sufix);
                preSufix = sufix;
            else
                add_line(targetBlkPath, horzcat(hC.Name, sufix, '/1'), horzcat(hC.Name, '_Mux', preSufix, '/2'), 'autorouting', 'on');
                preSufix = sufix;
            end % if
            start_position = plus(minus(start_position, move_right), move_down);
        end % for
    end % if
end % function
function str = vector2str(Vec)
    % 195 196
    str = '[';
    for j=1.0:length(Vec)
        str = horzcat(str, ' ', num2str(Vec(j)));
    end % for
    str = horzcat(str, ']');
end % function
function blkSize = blockSize(Block)
    % 203 204
    Position = get_param(Block, 'Position');
    blkSize = horzcat(minus(Position(3.0), Position(1.0)), minus(Position(4.0), Position(2.0)));
end % function
function [mode, dt, scl] = localGetModeOutDataTypeScaling(in, col)
    % 208 210
    % 209 210
    sizes = hdlsignalsizes(in);
    if eq(sizes(1.0), 0.0)
        mode = 'double';
        dt = 'sfix(32)';
        scl = '2^0';
    else
        if gt(nargin, 1.0)
            sizes(1.0) = mtimes(mtimes(sizes(1.0), 2.0), col);
            sizes(2.0) = mtimes(sizes(2.0), 2.0);
        end % if
        % 220 221
        mode = 'Specify via dialog';
        dt = sprintf('fix(%d)', sizes(1.0));
        if lt(sizes(2.0), 0.0)
            scl = sprintf('2^%d', sizes(2.0));
        else
            scl = sprintf('2^-%d', sizes(2.0));
        end % if
        if sizes(3.0)
            dt = horzcat('s', dt);
        else
            dt = horzcat('u', dt);
        end % if
        % 233 234
    end % if
end % function
