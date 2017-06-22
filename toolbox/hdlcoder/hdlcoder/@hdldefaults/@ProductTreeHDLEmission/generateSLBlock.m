function generateSLBlock(this, hC, targetBlkPath)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    validBlk = 1.0;
    % 9 10
    try
        originalBlkPath = getfullname(hC.SimulinkHandle);
    catch
        validBlk = 0.0;
    end % try
    % 15 16
    if validBlk
        % 17 18
        in1 = hC.InputPorts(1.0).getSignal;
        in1vect = hdlsignalvector(in1);
        vectorsize = max(in1vect);
        % 21 23
        % 22 23
        if gt(length(hC.InputPorts), 1.0) || lt(vectorsize, 2.0)
            error(hdlcodererrormsgid('TooManyInputs'), 'Product block with tree implementation requires a single vector as input.');
            % 25 26
        end % if
        % 27 28
        out = hC.OutputPorts(1.0).getSignal;
        % 29 30
        xstep = 80.0;
        ystep = 80.0;
        yqtrstep = mrdivide(ystep, 4.0);
        xqtrstep = mrdivide(ystep, 4.0);
        yinc = mtimes(vectorsize, yqtrstep);
        ycenter = plus(85.0, yinc);
        xpos = 85.0;
        ypos = ycenter;
        % 38 39
        add_block('built-in/Subsystem', targetBlkPath);
        % 40 41
        [turnhilitingon, color] = getHiliteInfo(hC);
        set_param(targetBlkPath, 'BackgroundColor', color);
        % 43 44
        if turnhilitingon
            hiliteBlkAncestors(targetBlkPath, color);
        end % if
        % 47 48
        for ii=1.0:length(hC.InputPorts)
            inportPath{ii} = horzcat(targetBlkPath, '/In', num2str(ii));
            add_block('built-in/Inport', inportPath{ii}, 'Position', horzcat(xpos, minus(plus(ypos, mtimes(minus(ii, 1.0), yqtrstep)), 7.0), plus(xpos, 30.0), plus(plus(ypos, mtimes(minus(ii, 1.0), yqtrstep)), 7.0)));
            % 51 54
            % 52 54
            % 53 54
        end % for
        % 55 56
        xpos = plus(xpos, xstep);
        demuxPath = sprintf('%s/demux1', targetBlkPath);
        add_block('built-in/Demux', demuxPath);
        set_param(demuxPath, 'Outputs', num2str(vectorsize), 'Position', horzcat(xpos, minus(ypos, yinc), plus(xpos, xqtrstep), plus(ypos, yinc)));
        % 60 63
        % 61 63
        % 62 63
        add_line(targetBlkPath, portPath(inportPath{1.0}, 1.0), portPath(demuxPath, 1.0), 'autorouting', 'on');
        % 64 66
        % 65 66
        for ii=1.0:vectorsize
            column_ins{ii} = portPath(demuxPath, ii);
        end % for
        % 69 70
        xpos = plus(xpos, xstep);
        ypos = minus(plus(ycenter, yqtrstep), yinc);
        for col=1.0:ceil(log2(vectorsize))
            ii = 1.0;
            column_outs = {};
            for row=2.0:2.0:length(column_ins)
                prodcol{ii} = sprintf('%s/prod_level%dpos%d', targetBlkPath, col, ii);
                % 77 78
                [mode, dt, scl] = localGetModeOutDataTypeScaling(in1, col);
                % 79 80
                add_block('built-in/Product', prodcol{ii}, 'Position', horzcat(xpos, ypos, plus(xpos, xqtrstep), plus(ypos, yqtrstep)), 'InputSameDT', 'off', 'OutDataTypeMode', mode, 'OutputDataTypeScalingMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
                % 81 91
                % 82 91
                % 83 91
                % 84 91
                % 85 91
                % 86 91
                % 87 91
                % 88 91
                % 89 91
                % 90 91
                add_line(targetBlkPath, column_ins{minus(row, 1.0)}, portPath(prodcol{ii}, 1.0), 'autorouting', 'off');
                % 92 93
                add_line(targetBlkPath, column_ins{row}, portPath(prodcol{ii}, 2.0), 'autorouting', 'off');
                % 94 95
                column_outs{ii} = portPath(prodcol{ii}, 1.0);
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
        % 106 107
        ypos = ycenter;
        % 108 109
        [mode, dt, scl] = localGetModeOutDataTypeScaling(out);
        add_block('built-in/DataTypeConversion', horzcat(targetBlkPath, '/FinalConvert'), 'Position', horzcat(xpos, minus(ypos, 15.0), plus(xpos, 30.0), plus(ypos, 15.0)), 'OutDataTypeMode', mode, 'OutDataType', dt, 'OutScaling', scl, 'RndMeth', get_param(hC.SimulinkHandle, 'RndMeth'), 'SaturateOnIntegerOverflow', get_param(hC.SimulinkHandle, 'SaturateOnIntegerOverflow'));
        % 111 119
        % 112 119
        % 113 119
        % 114 119
        % 115 119
        % 116 119
        % 117 119
        % 118 119
        add_line(targetBlkPath, column_outs{end}, portPath(horzcat(targetBlkPath, '/FinalConvert'), 1.0), 'autorouting', 'off');
        % 120 124
        % 121 124
        % 122 124
        % 123 124
        xpos = plus(xpos, xstep);
        % 125 126
        for ii=1.0:length(hC.OutputPorts)
            outportPath{ii} = horzcat(targetBlkPath, '/Out', num2str(ii));
            add_block('built-in/Outport', outportPath{ii})
            set_param(outportPath{ii}, 'Position', horzcat(xpos, plus(minus(ypos, 7.0), mtimes(minus(ii, 1.0), yqtrstep)), plus(xpos, 30.0), plus(plus(ypos, 7.0), mtimes(minus(ii, 1.0), yqtrstep))));
            % 130 132
            % 131 132
        end % for
        % 133 134
        add_line(targetBlkPath, portPath(horzcat(targetBlkPath, '/FinalConvert'), 1.0), portPath(outportPath{1.0}, 1.0), 'autorouting', 'off');
    else
        % 136 140
        % 137 140
        % 138 140
        % 139 140
        % 140 141
        error(hdlcodererrormsgid('invalidblockpath'), 'Cannot find path to Simulink handle %e', hC.SimulinkHandle);
        % 142 143
    end % if
end % function
function path = portPath(blkPath, portNumber)
    % 146 148
    % 147 148
    sep = strfind(blkPath, '/');
    if not(isempty(sep))
        blkPath = blkPath(plus(sep(end), 1.0):end);
    end % if
    path = sprintf('%s/%d', blkPath, portNumber);
end % function
function hiliteBlkAncestors(blkPath, color)
    % 155 156
        while not(isempty(blkPath))
        set_param(blkPath, 'BackgroundColor', color);
        blkPath = get_param(blkPath, 'Parent');
        if isempty(get_param(blkPath, 'Parent'))
            break
        end % if
        % 162 163
    end % while
end % function
function [turnhilitingon, color] = getHiliteInfo(hC)
    % 166 168
    % 167 168
    srcMdlName = strtok(getfullname(hC.SimulinkHandle), '/');
    % 169 171
    % 170 171
    srcMdlCoderObj = hdlmodeldriver(srcMdlName);
    % 172 175
    % 173 175
    % 174 175
    color = srcMdlCoderObj.getParameter('hilitecolor');
    turnhilitingon = srcMdlCoderObj.getParameter('hiliteancestors');
end % function
function [mode, dt, scl] = localGetModeOutDataTypeScaling(in, col)
    % 179 180
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
        % 190 191
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
        % 203 204
    end % if
end % function
