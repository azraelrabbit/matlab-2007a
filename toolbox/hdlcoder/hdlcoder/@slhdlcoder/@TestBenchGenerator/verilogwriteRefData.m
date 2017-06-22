function verilogwriteRefData(this, hdltbcode, tbfid)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    fprintf('### Please wait ...\n');
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    signals = '';
    cchar = hdlgetparameter('comment_char');
    % 12 15
    % 13 15
    initial = horzcat('\n\n', '  initial ', cchar, 'Input & Output data', '\n', '  begin\n');
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    for m=1.0:length(this.InportSrc)
        signame = this.InportSrc(m).loggingPortName;
        inlen0 = this.InportSrc(m).datalength;
        portvtype = this.InportSrc(m).PortVType;
        % 23 25
        if eq(this.InportSrc(m).dataIsConstant, 1.0)
            inlen0 = 1.0;
        end % if
        % 27 29
        if strcmp(portvtype(1.0:4.0), 'wire')
            inputvtype_const = horzcat('reg ', portvtype(5.0:end));
        else
            inputvtype_const = portvtype;
        end % if
        % 33 36
        % 34 36
        if gt(this.InportSrc(m).VectorPortSize, 1.0)
            for i=1.0:this.InportSrc(m).VectorPortSize
                if eq(inlen0, 1.0)
                    signals = horzcat(signals, '  ', inputvtype_const, ' ', signame, '_', num2str(i), '_force;\n');
                else
                    % 40 42
                    signals = horzcat(signals, '  ', inputvtype_const, ' ', signame, '_', num2str(i), '_force ', '[0:', num2str(minus(inlen0, 1.0)), '];\n');
                    % 42 44
                end % if
            end % for
        else
            if eq(inlen0, 1.0)
                signals = horzcat(signals, '  ', inputvtype_const, ' ', signame, '_force;\n');
            else
                % 49 51
                signals = horzcat(signals, '  ', inputvtype_const, ' ', signame, '_force [0:', num2str(minus(inlen0, 1.0)), '];\n');
                % 51 53
            end % if
        end % if
    end % for
    % 55 57
    hasrealoutput = false;
    for m=1.0:length(this.OutportSnk)
        signame = this.OutportSnk(m).loggingPortName;
        outlen0 = this.OutportSnk(m).datalength;
        portvtype = this.OutportSnk(m).PortVType;
        portsltype = this.OutportSnk(m).PortSLType;
        % 62 64
        if eq(this.OutportSnk(m).dataIsConstant, 1.0)
            outlen0 = 1.0;
        end % if
        % 66 68
        [iosize, iobp, iosigned] = hdlgetsizesfromtype(portsltype);
        % 68 70
        if eq(iosize, 0.0)
            outputvtype_const = 'real ';
            hasrealoutput = true;
        else
            if strcmp(portvtype(1.0:4.0), 'wire')
                outputvtype_const = horzcat('reg ', portvtype(5.0:end));
            else
                outputvtype_const = portvtype;
            end % if
        end % if
        if gt(outlen0, 1.0)
            sliceout = horzcat('[0:', num2str(minus(outlen0, 1.0)), ']');
        else
            sliceout = '';
        end % if
        if gt(this.OutportSnk(m).VectorPortSize, 1.0)
            for i=1.0:this.OutportSnk(m).VectorPortSize
                signals = horzcat(signals, '  ', outputvtype_const, ' ', signame, '_', num2str(i), '_expected ', sliceout, ';\n');
                % 87 89
            end % for
        else
            signals = horzcat(signals, '  ', outputvtype_const, ' ', signame, '_expected ', sliceout, ';\n');
            % 91 93
        end % if
    end % for
    % 94 96
    fprintf(tbfid, horzcat(signals, initial));
    % 96 98
    for m=1.0:length(this.InportSrc)
        signame = this.InportSrc(m).loggingPortName;
        portsltype = this.InportSrc(m).PortSLType;
        vectorSize = this.InportSrc(m).VectorPortSize;
        inlen0 = this.InportSrc(m).datalength;
        % 102 104
        if eq(this.InportSrc(m).dataIsConstant, 1.0)
            inlen0 = 1.0;
        end % if
        % 106 108
        data_comment = horzcat('    ', cchar, ' Input data for ', signame, '\n');
        fprintf(tbfid, data_comment);
        % 109 111
        [iosize, iobp, iosigned] = hdlgetsizesfromtype(portsltype);
        % 111 113
        force_data = this.InportSrc(m).data;
        % 113 115
        if eq(inlen0, 1.0)
            if gt(vectorSize, 1.0)
                inconstants = '';
                for i=1.0:vectorSize
                    inconst = hdlconstantvalue(force_data(1.0, i), iosize, iobp, iosigned, 'hex');
                    % 119 121
                    inconstants = horzcat(inconstants, '    ', signame, '_', num2str(i), '_force <= ');
                    if eq(iosize, 0.0)
                        inconstants = horzcat(inconstants, '$realtobits(', inconst, ');\n');
                    else
                        inconstants = horzcat(inconstants, inconst, ';\n');
                    end % if
                end % for
            else
                inconst = hdlconstantvalue(force_data(1.0), iosize, iobp, iosigned, 'hex');
                % 129 131
                inconstants = horzcat('    ', signame, '_force <= ');
                if eq(iosize, 0.0)
                    inconstants = horzcat(inconstants, '$realtobits(', inconst, ');\n');
                else
                    inconstants = horzcat(inconstants, inconst, ';\n');
                end % if
            end % if
            fprintf(tbfid, inconstants);
        else
            if gt(vectorSize, 1.0)
                for n=1.0:inlen0
                    if eq(mod(n, 1000.0), 0.0)
                        fprintf('.');
                    end % if
                    inconstants = '';
                    for i=1.0:vectorSize
                        inconst = hdlconstantvalue(force_data(n, i), iosize, iobp, iosigned, 'hex');
                        % 147 149
                        inconstants = horzcat(inconstants, '    ', signame, '_', num2str(i), '_force [', num2str(minus(n, 1.0)), '] <= ');
                        if eq(iosize, 0.0)
                            inconstants = horzcat(inconstants, '$realtobits(', inconst, ');\n');
                        else
                            inconstants = horzcat(inconstants, inconst, ';\n');
                        end % if
                    end % for
                    fprintf(tbfid, inconstants);
                end % for
            else
                for n=1.0:inlen0
                    if eq(mod(n, 1000.0), 0.0)
                        fprintf('.');
                    end % if
                    % 162 164
                    inconst = hdlconstantvalue(force_data(n), iosize, iobp, iosigned, 'hex');
                    % 164 166
                    inconstants = horzcat('    ', signame, '_force [', num2str(minus(n, 1.0)), '] <= ');
                    if eq(iosize, 0.0)
                        inconstants = horzcat(inconstants, '$realtobits(', inconst, ');\n');
                    else
                        inconstants = horzcat(inconstants, inconst, ';\n');
                    end % if
                    fprintf(tbfid, inconstants);
                end % for
            end % if
        end % if
        fprintf(tbfid, '\n');
    end % for
    for m=1.0:length(this.OutportSnk)
        signame = this.OutportSnk(m).loggingPortName;
        portsltype = this.OutportSnk(m).PortSLType;
        vectorSize = this.OutportSnk(m).VectorPortSize;
        outlen0 = this.OutportSnk(m).datalength;
        % 182 185
        % 183 185
        if eq(this.OutportSnk(m).dataIsConstant, 1.0)
            outlen0 = 1.0;
        end % if
        % 187 189
        data_comment = horzcat('    ', cchar, ' Output data for ', signame, '\n');
        fprintf(tbfid, data_comment);
        % 190 192
        [iosize, iobp, iosigned] = hdlgetsizesfromtype(portsltype);
        % 192 194
        expected_data = this.OutportSnk(m).data;
        % 194 196
        if eq(outlen0, 1.0)
            if gt(vectorSize, 1.0)
                outconstants = '';
                for i=1.0:vectorSize
                    outconst = hdlconstantvalue(expected_data(1.0, i), iosize, iobp, iosigned, 'hex');
                    % 200 202
                    outconstants = horzcat(outconstants, '    ', signame, '_', num2str(i), '_expected <= ', outconst, ';\n');
                    % 202 204
                end % for
            else
                outconst = hdlconstantvalue(expected_data(1.0), iosize, iobp, iosigned, 'hex');
                outconstants = horzcat('    ', signame, '_expected <= ', outconst, ';\n');
            end % if
            fprintf(tbfid, outconstants);
        else
            if gt(vectorSize, 1.0)
                for n=1.0:outlen0
                    if eq(mod(n, 1000.0), 0.0)
                        fprintf('.');
                    end % if
                    outconstants = '';
                    for i=1.0:vectorSize
                        outconst = hdlconstantvalue(expected_data(n, i), iosize, iobp, iosigned, 'hex');
                        % 218 220
                        outconstants = horzcat(outconstants, '    ', signame, '_', num2str(i), '_expected [', num2str(minus(n, 1.0)), '] <= ', outconst, ';\n');
                        % 220 222
                    end % for
                    fprintf(tbfid, outconstants);
                end % for
            else
                for n=1.0:outlen0
                    if eq(mod(n, 1000.0), 0.0)
                        fprintf('.');
                    end % if
                    % 229 231
                    outconst = hdlconstantvalue(expected_data(n), iosize, iobp, iosigned, 'hex');
                    outconstants = horzcat('    ', signame, '_expected [', num2str(minus(n, 1.0)), '] <= ', outconst, ';\n');
                    % 232 234
                    fprintf(tbfid, outconstants);
                end % for
            end % if
        end % if
        fprintf(tbfid, '\n');
    end % for
    % 239 241
    end_st = horzcat('  end ', cchar, ' Input & Output data\n\n');
    fprintf(tbfid, end_st);
    % 242 246
    % 243 246
    % 244 246
    if hasrealoutput
        abs_function = horzcat('function real abs_real;\n', 'input real ip_val;\n', hdlgetparameter('comment_char'), ' return value = |ip_val|\n', '  begin\n', '    abs_real = (ip_val > 0) ? ip_val : -ip_val;\n', '  end\n', 'endfunction //function abs_real\n\n');
        % 247 256
        % 248 256
        % 249 256
        % 250 256
        % 251 256
        % 252 256
        % 253 256
        % 254 256
        fprintf(tbfid, abs_function);
    end % if
    % 257 259
    fprintf(tbfid, '\n');
end % function
