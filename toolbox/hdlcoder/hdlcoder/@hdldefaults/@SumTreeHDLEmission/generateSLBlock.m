function generateSLBlock(this, hC, targetBlkPath)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    validBlk = 1.0;
    % 10 11
    try
        originalBlkPath = getfullname(hC.SimulinkHandle);
    catch
        validBlk = 0.0;
    end % try
    % 16 17
    if validBlk
        in1 = hC.InputPorts(1.0).getSignal;
        in1vect = hdlsignalvector(in1);
        vectorsize = max(in1vect);
        % 21 23
        % 22 23
        if gt(length(hC.InputPorts), 1.0) || lt(vectorsize, 2.0)
            error(hdlcodererrormsgid('TooManyInputs'), 'Sum block with tree implementation requires a single vector as input.');
            % 25 26
        end % if
        % 27 31
        % 28 31
        % 29 31
        % 30 31
        out = hC.OutputPorts(1.0).getSignal;
        % 32 33
        xstep = 80.0;
        ystep = 80.0;
        yqtrstep = mrdivide(ystep, 4.0);
        xqtrstep = mrdivide(ystep, 4.0);
        yinc = mtimes(vectorsize, yqtrstep);
        ycenter = plus(85.0, yinc);
        xpos = 85.0;
        ypos = ycenter;
        % 41 42
        add_block('built-in/Subsystem', targetBlkPath);
        % 43 44
        [turnhilitingon, color] = getHiliteInfo(hC);
        set_param(targetBlkPath, 'BackgroundColor', color);
        % 46 47
        if turnhilitingon
            hiliteBlkAncestors(targetBlkPath, color);
        end % if
        % 50 51
        for ii=1.0:length(hC.InputPorts)
            inportPath{ii} = horzcat(targetBlkPath, '/In', num2str(ii));
            add_block('built-in/Inport', inportPath{ii}, 'Position', horzcat(xpos, minus(plus(ypos, mtimes(minus(ii, 1.0), yqtrstep)), 7.0), plus(xpos, 30.0), plus(plus(ypos, mtimes(minus(ii, 1.0), yqtrstep)), 7.0)));
            % 54 57
            % 55 57
            % 56 57
        end % for
        % 58 59
        xpos = plus(xpos, xstep);
        demuxPath = sprintf('%s/demux1', targetBlkPath);
        add_block('built-in/Demux', demuxPath);
        set_param(demuxPath, 'Outputs', num2str(vectorsize), 'Position', horzcat(xpos, minus(ypos, yinc), plus(xpos, xqtrstep), plus(ypos, yinc)));
        % 63 66
        % 64 66
        % 65 66
        add_line(targetBlkPath, portPath(inportPath{1.0}, 1.0), portPath(demuxPath, 1.0), 'autorouting', 'on');
        % 67 69
        % 68 69
        for ii=1.0:vectorsize
            column_ins{ii} = portPath(demuxPath, ii);
        end % for
        % 72 73
        xpos = plus(xpos, xstep);
        ypos = minus(plus(ycenter, yqtrstep), yinc);
        for col=1.0:ceil(log2(vectorsize))
            ii = 1.0;
            column_outs = {};
            for row=2.0:2.0:length(column_ins)
                sumcol{ii} = sprintf('%s/sum_level%dpos%d', targetBlkPath, col, ii);
                % 80 81
                [mode, dt, scl] = localGetModeOutDataTypeScaling(in1, col);
                % 82 83
                add_block('built-in/Sum', sumcol{ii}, 'Position', horzcat(xpos, ypos, plus(xpos, xqtrstep), plus(ypos, yqtrstep)), 'InputSameDT', 'off', 'OutDataTypeMode', mode, 'OutputDataTypeScalingMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
                % 84 94
                % 85 94
                % 86 94
                % 87 94
                % 88 94
                % 89 94
                % 90 94
                % 91 94
                % 92 94
                % 93 94
                add_line(targetBlkPath, column_ins{minus(row, 1.0)}, portPath(sumcol{ii}, 1.0), 'autorouting', 'off');
                % 95 96
                add_line(targetBlkPath, column_ins{row}, portPath(sumcol{ii}, 2.0), 'autorouting', 'off');
                % 97 98
                column_outs{ii} = portPath(sumcol{ii}, 1.0);
                ii = plus(ii, 1.0);
                ypos = plus(ypos, ystep);
            end % for
            if mod(length(column_ins), 2.0)
                column_outs{plus(end, 1.0)} = column_ins{end};
            end % if
            column_ins = column_outs;
            xpos = plus(xpos, xstep);
            ypos = minus(plus(ycenter, yqtrstep), mtimes(yqtrstep, mrdivide(plus(length(column_ins), 1.0), 2.0)));
        end % for
        % 109 110
        ypos = ycenter;
        % 111 112
        [mode, dt, scl] = localGetModeOutDataTypeScaling(out);
        add_block('built-in/DataTypeConversion', horzcat(targetBlkPath, '/FinalConvert'), 'Position', horzcat(xpos, minus(ypos, 15.0), plus(xpos, 30.0), plus(ypos, 15.0)), 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
        % 114 122
        % 115 122
        % 116 122
        % 117 122
        % 118 122
        % 119 122
        % 120 122
        % 121 122
        add_line(targetBlkPath, column_outs{end}, portPath(horzcat(targetBlkPath, '/FinalConvert'), 1.0), 'autorouting', 'off');
        % 123 127
        % 124 127
        % 125 127
        % 126 127
        xpos = plus(xpos, xstep);
        % 128 129
        for ii=1.0:length(hC.OutputPorts)
            outportPath{ii} = horzcat(targetBlkPath, '/Out', num2str(ii));
            add_block('built-in/Outport', outportPath{ii})
            set_param(outportPath{ii}, 'Position', horzcat(xpos, plus(minus(ypos, 7.0), mtimes(minus(ii, 1.0), yqtrstep)), plus(xpos, 30.0), plus(plus(ypos, 7.0), mtimes(minus(ii, 1.0), yqtrstep))));
            % 133 135
            % 134 135
        end % for
        % 136 137
        add_line(targetBlkPath, portPath(horzcat(targetBlkPath, '/FinalConvert'), 1.0), portPath(outportPath{1.0}, 1.0), 'autorouting', 'off');
    else
        % 139 143
        % 140 143
        % 141 143
        % 142 143
        % 143 144
        error(hdlcodererrormsgid('invalidblockpath'), 'Cannot find path to Simulink handle %e', hC.SimulinkHandle);
        % 145 146
    end % if
end % function
function path = portPath(blkPath, portNumber)
    % 149 151
    % 150 151
    sep = strfind(blkPath, '/');
    if not(isempty(sep))
        blkPath = blkPath(plus(sep(end), 1.0):end);
    end % if
    path = sprintf('%s/%d', blkPath, portNumber);
end % function
function hiliteBlkAncestors(blkPath, color)
    % 158 159
        while not(isempty(blkPath))
        set_param(blkPath, 'BackgroundColor', color);
        blkPath = get_param(blkPath, 'Parent');
        if isempty(get_param(blkPath, 'Parent'))
            break
        end % if
    end % while
end % function
function [turnhilitingon, color] = getHiliteInfo(hC)
    % 168 171
    % 169 171
    % 170 171
    srcMdlName = strtok(getfullname(hC.SimulinkHandle), '/');
    % 172 174
    % 173 174
    srcMdlCoderObj = hdlmodeldriver(srcMdlName);
    % 175 178
    % 176 178
    % 177 178
    color = srcMdlCoderObj.getParameter('hilitecolor');
    turnhilitingon = srcMdlCoderObj.getParameter('hiliteancestors');
end % function
function [mode, dt, scl] = localGetModeOutDataTypeScaling(in, col)
    % 182 183
    sizes = hdlsignalsizes(in);
    if eq(sizes(1.0), 0.0)
        mode = 'double';
        dt = 'sfix(32)';
        scl = '2^0';
    else
        if gt(nargin, 1.0)
            sizes(1.0) = plus(sizes(1.0), col);
            sizes(2.0) = sizes(2.0);
        end % if
        % 193 194
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
        % 206 207
    end % if
end % function
