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
    % 11 13
    % 12 13
    if not(strcmpi(get_param(bfp, 'Multiplication'), 'element-wise(.*)'))
        error(hdlcodererrormsgid('unsupportedmatrix'), 'Product block only supported in Element-wise(.*) mode.');
        % 15 16
    end % if
    % 17 18
    if any(strcmp(fieldnames(get_param(bfp, 'objectparameters')), 'roundingMode'))
        rnd = get_param(bfp, 'roundingMode');
        sat = strcmp(get_param(bfp, 'overflowMode'), 'on');
    else
        sat = strcmp(get_param(bfp, 'DoSatur'), 'on');
        rnd = get_param(bfp, 'RndMeth');
    end % if
    in = hC.InputPorts(1.0).getSignal;
    % 26 27
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
    % 37 38
    config.invectsize = invectsize;
    config.decomposition = decomposition;
    config.rounding = rnd;
    config.saturation = sat;
    % 42 43
    [outputBlk, outputBlkPosition] = implement_cascade(hC, config, originalBlkPath, targetBlkPath);
end % function
function [outputBlk, outputBlkPosition] = implement_cascade(hC, config, originalBlkPath, targetBlkPath)
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    start_position = [185.0 75.0];
    move_right = [200.0 0.0];
    move_down = [0.0 100.0];
    % 53 54
    if lt(config.invectsize, 2.0)
        decompose_vector = 1.0;
    else
        decompose_vector = hdlcascadedecompose(config.invectsize, config.decomposition);
    end % if
    % 59 60
    first_element = 1.0;
    invect_cell = {};
    % 62 63
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
            % 75 76
        end % if
        first_element = minus(plus(first_element, decompose_vector(cloop)), 2.0);
        invect_cell{plus(end, 1.0)} = invect_1;
    end % for
    % 80 81
    out = hC.OutputPorts(1.0).getSignal;
    [mode, dt, scl] = localGetModeOutDataTypeScaling(out);
    if eq(length(decompose_vector), 1.0)
        blkpath = horzcat(targetBlkPath, '/', hC.Name);
        blkSize = blockSize(originalBlkPath);
        add_block(originalBlkPath, blkpath);
        set_param(blkpath, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
        % 88 93
        % 89 93
        % 90 93
        % 91 93
        % 92 93
        add_line(targetBlkPath, 'In1/1', horzcat(hC.Name, '/1'), 'autorouting', 'on');
        outputBlk = hC.Name;
        outputBlkPosition = plus(start_position, horzcat(blkSize(1.0), 0.0));
    else
        % 97 98
        origBlkPortDataType = get_param(originalBlkPath, 'CompiledPortDataTypes');
        OutDataTypeMode = origBlkPortDataType.Outport;
        % 100 101
        genDataTypeConvertorPath = horzcat(targetBlkPath, '/', hC.Name, '_DataTypeConvertor');
        % 102 103
        add_block('built-in/DataTypeConversion', genDataTypeConvertorPath, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
        % 104 110
        % 105 110
        % 106 110
        % 107 110
        % 108 110
        % 109 110
        blkPosition = horzcat(start_position, plus(start_position, blockSize(genDataTypeConvertorPath)));
        set_param(genDataTypeConvertorPath, 'Position', blkPosition);
        add_line(targetBlkPath, 'In1/1', horzcat(hC.Name, '_DataTypeConvertor', '/1'), 'autorouting', 'on');
        start_position = plus(start_position, move_right);
        % 114 115
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
        end % for
        start_position = plus(start_position, mtimes(plus(length(decompose_vector), 1.0), move_right));
        % 127 129
        % 128 129
        blkSize = blockSize(horzcat(targetBlkPath, '/Out1'));
        blkPosition = horzcat(start_position, plus(start_position, blockSize(horzcat(targetBlkPath, '/Out1'))));
        set_param(horzcat(targetBlkPath, '/Out1'), 'Position', blkPosition);
        % 132 133
        start_position = minus(start_position, move_right);
        % 134 135
        for cloop=1.0:length(decompose_vector)
            % 136 138
            % 137 138
            if eq(config.decomposition, 0.0)
                sufix = '';
            else
                sufix = horzcat('_', num2str(decompose_vector(cloop)));
            end % if
            if ne(cloop, length(decompose_vector))
                % 144 145
                blkpath = horzcat(targetBlkPath, '/', hC.Name, '_Mux', sufix);
                add_block('built-in/Mux', blkpath);
                set_param(blkpath, 'Inputs', '2');
                set_param(blkpath, 'displayOption', 'bar');
                blkPosition = horzcat(minus(start_position, [70.0 0.0]), plus(minus(start_position, [70.0 0.0]), blockSize(blkpath)));
                set_param(blkpath, 'Position', blkPosition);
                % 151 152
                add_line(targetBlkPath, horzcat(hC.Name, '_selector', num2str(cloop), '/1'), horzcat(hC.Name, '_Mux', sufix, '/1'), 'autorouting', 'on');
                % 153 155
                % 154 155
                blkpath = horzcat(targetBlkPath, '/', hC.Name, sufix);
                blkSize = blockSize(originalBlkPath);
                add_block(originalBlkPath, blkpath);
                blkPosition = horzcat(start_position, plus(start_position, blkSize));
                set_param(blkpath, 'Position', blkPosition, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
                % 160 169
                % 161 169
                % 162 169
                % 163 169
                % 164 169
                % 165 169
                % 166 169
                % 167 169
                % 168 169
                add_line(targetBlkPath, horzcat(hC.Name, '_Mux', sufix, '/1'), horzcat(hC.Name, sufix, '/1'), 'autorouting', 'on');
                if eq(cloop, 1.0)
                    outputBlkPosition = plus(start_position, horzcat(blkSize(1.0), 0.0));
                end % if
            else
                % 174 175
                blkpath = horzcat(targetBlkPath, '/', hC.Name, sufix);
                add_block(originalBlkPath, blkpath);
                blkPosition = horzcat(start_position, plus(start_position, blockSize(originalBlkPath)));
                set_param(blkpath, 'Position', blkPosition, 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
                % 179 188
                % 180 188
                % 181 188
                % 182 188
                % 183 188
                % 184 188
                % 185 188
                % 186 188
                % 187 188
                add_line(targetBlkPath, horzcat(hC.Name, '_selector', num2str(cloop), '/1'), horzcat(hC.Name, sufix, '/1'), 'autorouting', 'on');
                % 189 190
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
    % 203 204
    str = '[';
    for j=1.0:length(Vec)
        str = horzcat(str, ' ', num2str(Vec(j)));
    end % for
    str = horzcat(str, ']');
end % function
function blkSize = blockSize(Block)
    Position = get_param(Block, 'Position');
    blkSize = horzcat(minus(Position(3.0), Position(1.0)), minus(Position(4.0), Position(2.0)));
end % function
function [mode, dt, scl] = localGetModeOutDataTypeScaling(in, col)
    % 215 217
    % 216 217
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
        % 227 228
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
        % 240 241
    end % if
end % function
