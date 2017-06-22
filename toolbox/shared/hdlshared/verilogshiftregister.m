function [hdlbody, hdlsignals] = verilogshiftregister(input, output, loaden, extOut, outvld, startSignal, functionMode, shiftmode, initValue, processName)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    hdlbody = [];
    hdlsignals = [];
    % 20 22
    hdlsequentialcontext(true);
    bdt = hdlgetparameter('base_data_type');
    singlequote = char(39.0);
    % 24 26
    if isempty(input) || isempty(output) || isempty(loaden)
        error('The input, output and loaden indexes should be passed to the function.');
    end
    % 28 30
    if lt(nargin, 3.0)
        error('hdlserdes should be called with at least four arguments:input, output, functionMode.');
    else
        if eq(nargin, 3.0)
            extOut = [];
            outvld = [];
            startSignal = [];
            functionMode = 'PARRALLEL';
            shiftmode = 'SHIFTRIGHT';
            initValue = 0.0;
            processName = 'SERIALIZER';
        else
            if eq(nargin, 4.0)
                outvld = [];
                startSignal = [];
                functionMode = 'PARRALLEL';
                shiftmode = 'SHIFTRIGHT';
                initValue = 0.0;
                processName = 'SERIALIZER';
            else
                if eq(nargin, 5.0)
                    startSignal = [];
                    functionMode = 'PARRALLEL';
                    shiftmode = 'SHIFTRIGHT';
                    initValue = 0.0;
                    processName = 'SERIALIZER';
                else
                    if eq(nargin, 6.0)
                        functionMode = 'PARRALLEL';
                        shiftmode = 'SHIFTRIGHT';
                        initValue = 0.0;
                        if strcmpi(functionMode, 'DESERIALIZER')
                            processName = 'DESERIALIZER';
                        else
                            processName = 'SERIALIZER';
                        end
                    else
                        if eq(nargin, 7.0)
                            shiftmode = 'SHIFTRIGHT';
                            initValue = 0.0;
                            if strcmpi(functionMode, 'DESERIALIZER')
                                processName = 'DESERIALIZER';
                            else
                                if strcmpi(functionMode, 'SHIFTER')
                                    processName = 'SHIFTER';
                                else
                                    processName = 'SERIALIZER';
                                end
                            end
                        else
                            if eq(nargin, 8.0)
                                initValue = 0.0;
                                if strcmpi(functionMode, 'DESERIALIZER')
                                    processName = 'DESERIALIZER';
                                else
                                    if strcmpi(functionMode, 'SHIFTER')
                                        processName = 'SHIFTER';
                                    else
                                        processName = 'SERIALIZER';
                                    end
                                end
                            else
                                if eq(nargin, 9.0)
                                    if strcmpi(functionMode, 'DESERIALIZER')
                                        processName = 'DESERIALIZER';
                                    else
                                        if strcmpi(functionMode, 'SHIFTER')
                                            processName = 'SHIFTER';
                                        else
                                            processName = 'SERIALIZER';
                                        end
                                    end
                                else
                                    if gt(nargin, 10.0)
                                        error('Too many arguments');
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    cclk = hdlgetcurrentclock;
    if isempty(cclk) || eq(cclk, 0.0)
        clockname = hdlgetparameter('clockname');
    else
        clockname = hdlsignalname(cclk);
    end
    cclken = hdlgetcurrentclockenable;
    if isempty(cclken)
        clockenablename = '';
    else
        if eq(cclken, 0.0)
            clockenablename = hdlgetparameter('clockenablename');
        else
            clockenablename = hdlsignalname(cclken);
        end
    end
    creset = hdlgetcurrentreset;
    if isempty(creset)
        resetname = '';
    else
        if eq(creset, 0.0)
            resetname = hdlgetparameter('resetname');
        else
            resetname = hdlsignalname(creset);
        end
    end
    if (strcmpi(functionMode, 'DESERIALIZER')) | (strcmpi(functionMode, 'SHIFTER'))
        vtype = hdlsignalvtype(output);
        sltype = hdlsignalsltype(output);
        [name, shiftreg] = hdlnewsignal(hdllegalname('shiftreg'), 'filter', -1.0, 0.0, 0.0, vtype, sltype);
        hdlregsignal(shiftreg);
        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(shiftreg));
        if ~(isempty(outvld))
            [name, dvldreg] = hdlnewsignal(hdllegalname('dvldreg'), 'filter', -1.0, 0.0, 0.0, vtype, sltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(dvldreg));
        end
        regsltype = hdlsignalsltype(shiftreg);
        [regsize, outbp, outsigned] = hdlwordsize(regsltype);
    else
        vtype = hdlsignalvtype(input);
        sltype = hdlsignalsltype(input);
        [name, shiftreg] = hdlnewsignal(hdllegalname('shiftreg'), 'filter', -1.0, 0.0, 0.0, vtype, sltype);
        hdlregsignal(shiftreg);
        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(shiftreg));
        if ~(isempty(outvld))
            [name, dvldreg] = hdlnewsignal(hdllegalname('dvldreg'), 'filter', -1.0, 0.0, 0.0, vtype, sltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(dvldreg));
        end
        regsltype = hdlsignalsltype(shiftreg);
        [regsize, outbp, outsigned] = hdlwordsize(regsltype);
    end
    if eq(hdlgetparameter('reset_asserted_level'), 1.0)
        resetedge = 'posedge ';
    else
        resetedge = 'negedge ';
    end
    if eq(hdlgetparameter('async_reset'), 1.0)
        sensList = horzcat('always @ (posedge ', clockname, ' or ', resetedge, resetname, ')\n');
        asyncIf = horzcat('if (', resetname, ' == 1''b', num2str(hdlgetparameter('reset_asserted_level')), ') begin\n');
        asyncElsif = 'else begin\n';
        reset_body_spaces = 8.0;
    else
        sensList = horzcat('always @ ( posedge ', clockname, ')\n');
        asyncIf = horzcat('if (', resetname, ' == 1''b', num2str(hdlgetparameter('reset_asserted_level')), ') begin\n');
        asyncElsif = 'else begin\n';
        reset_body_spaces = 8.0;
    end
    asyncbody = [];
    regname = hdlsignalname(shiftreg);
    asyncbody = horzcat(asyncbody, spaces(reset_body_spaces), scalarAsyncBody(regname, hdlconstantvalue(initValue, regsize, outbp, outsigned)));
    if ~(isempty(outvld))
        regname = hdlsignalname(dvldreg);
        asyncbody = horzcat(asyncbody, spaces(reset_body_spaces), scalarAsyncBody(regname, hdlconstantvalue(0.0, regsize, outbp, outsigned)));
    end
    syncbody = [];
    space = spaces(reset_body_spaces);
    if (strcmpi(functionMode, 'DESERIALIZER')) | (strcmpi(functionMode, 'SHIFTER'))
        syncbody = horzcat(syncbody, spaces(10.0), 'if (', hdlsignalname(loaden), ' == 1''b1 ) begin\n');
        if strcmpi(shiftmode, 'SHIFTLEFT')
            syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(shiftreg), ' <= {', hdlsignalname(shiftreg), '[', num2str(minus(regsize, 2.0)), ' : 0], ', hdlsignalname(input), '};\n');
            if ~(isempty(outvld))
                if isempty(startSignal)
                    syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(dvldreg), ' <= {', hdlsignalname(dvldreg), '[', num2str(minus(regsize, 2.0)), ' : 0],', hdlsignalname(dvldreg), '[', num2str(minus(regsize, 1.0)), ']} ;\n');
                else
                    syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(dvldreg), ' <= {', hdlsignalname(dvldreg), '[', num2str(minus(regsize, 2.0)), ' : 0], ', hdlsignalname(startSignal), '};\n');
                    % 198 201
                    % 199 201
                end
            end
        else
            syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(shiftreg), ' <= {', hdlsignalname(input), ', ', hdlsignalname(shiftreg), '[', num2str(minus(regsize, 1.0)), ' : 1]};\n');
            % 204 206
            if ~(isempty(outvld))
                if isempty(startSignal)
                    syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(dvldreg), ' <= {', hdlsignalname(dvldreg), '[', num2str(0.0), '], ', hdlsignalname(dvldreg), '[', num2str(minus(regsize, 1.0)), ' : 1]} ;\n');
                else
                    % 209 211
                    % 210 212
                    syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(dvldreg), ' <= {', hdlsignalname(startSignal), ', ', hdlsignalname(dvldreg), '[', num2str(minus(regsize, 1.0)), ' : 1]} ;\n');
                    % 212 215
                    % 213 215
                end
            end
        end
        syncbody = horzcat(syncbody, spaces(10.0), 'end\n');
    else
        % 219 221
        syncbody = horzcat(syncbody, spaces(10.0), 'if (', hdlsignalname(loaden), ' == 1''b1) begin\n', spaces(10.0), '  ', hdlsignalname(shiftreg), ' <= ', hdlsignalname(input), ';\n');
        % 221 224
        % 222 224
        if ~(isempty(outvld))
            regname = hdlsignalname(dvldreg);
            regvalue = minus(mpower(2.0, regsize), 1.0);
            syncbody = horzcat(syncbody, spaces(reset_body_spaces), scalarAsyncBody(regname, hdlconstantvalue(regvalue, regsize, outbp, outsigned)));
            % 227 229
        end
        syncbody = horzcat(syncbody, spaces(10.0), 'end\n', spaces(10.0), 'else begin\n');
        % 230 233
        % 231 233
        if strcmpi(shiftmode, 'SHIFTLEFT')
            syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(shiftreg), ' <= {', hdlsignalname(shiftreg), '[', num2str(minus(regsize, 2.0)), ' : 0], 1''b0};\n');
            % 234 236
            if ~(isempty(outvld))
                syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(dvldreg), ' <= {', hdlsignalname(dvldreg), '[', num2str(minus(regsize, 2.0)), ' : 0], 1''b0};\n');
                % 237 239
            end
        else
            syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(shiftreg), ' <= {1''b0, ', hdlsignalname(shiftreg), '[', num2str(minus(regsize, 1.0)), ' : 1]};\n');
            % 241 243
            if ~(isempty(outvld))
                syncbody = horzcat(syncbody, spaces(10.0), '  ', hdlsignalname(dvldreg), ' <= {1''b0, ', hdlsignalname(dvldreg), '[', num2str(minus(regsize, 1.0)), ' : 1]};\n');
                % 244 246
            end
        end
        syncbody = horzcat(syncbody, spaces(10.0), 'end\n');
        % 248 250
    end
    % 250 254
    % 251 254
    % 252 254
    if isempty(clockenablename)
        sync_statement = syncbody;
    else
        sync_statement = horzcat(spaces(8.0), 'if (', clockenablename, ' == 1''b1) begin\n', syncbody, spaces(8.0), 'end\n');
        % 257 260
        % 258 260
    end
    hdlbody = horzcat(spaces(2.0), sensList, spaces(4.0), 'begin: ', processName, '\n', spaces(6.0), asyncIf, asyncbody, spaces(6.0), 'end\n', spaces(6.0), asyncElsif, sync_statement, spaces(6.0), 'end \n', spaces(4.0), 'end ', hdlgetparameter('comment_char'), ' ', processName, ';\n\n');
    % 261 271
    % 262 271
    % 263 271
    % 264 271
    % 265 271
    % 266 271
    % 267 271
    % 268 271
    % 269 271
    hdlsequentialcontext(false);
    % 271 275
    % 272 275
    % 273 275
    if strcmpi(functionMode, 'DESERIALIZER')
        [assign_prefix, assign_op] = hdlassignforoutput(output);
        hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(output), assign_op, hdlsignalname(shiftreg), ';\n');
        % 277 280
        % 278 280
        [assign_prefix, assign_op] = hdlassignforoutput(outvld);
        if ~(isempty(outvld))
            if strcmpi(shiftmode, 'SHIFTLEFT')
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(outvld), assign_op, hdlsignalname(dvldreg), '[', num2str(minus(regsize, 1.0)), '];\n');
            else
                % 284 286
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(outvld), assign_op, hdlsignalname(dvldreg), '[', num2str(0.0), '];\n');
                % 286 288
            end
        end
    else
        if strcmpi(functionMode, 'SHIFTER')
            [assign_prefix, assign_op] = hdlassignforoutput(extOut);
            if strcmpi(shiftmode, 'SHIFTLEFT')
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(extOut), assign_op, hdlsignalname(shiftreg), '[', num2str(minus(regsize, 1.0)), '];\n');
            else
                % 295 297
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(extOut), assign_op, hdlsignalname(shiftreg), '[', num2str(0.0), '];\n');
                % 297 299
            end
        else
            [assign_prefix, assign_op] = hdlassignforoutput(output);
            if strcmpi(shiftmode, 'SHIFTLEFT')
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(output), assign_op, hdlsignalname(shiftreg), '[', num2str(minus(regsize, 1.0)), '];\n');
            else
                % 304 306
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(output), assign_op, hdlsignalname(shiftreg), '[', num2str(0.0), '];\n');
                % 306 308
            end
            if ~(isempty(outvld))
                [assign_prefix, assign_op] = hdlassignforoutput(outvld);
                if strcmpi(shiftmode, 'SHIFTLEFT')
                    hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(outvld), assign_op, hdlsignalname(dvldreg), '[', num2str(minus(regsize, 1.0)), '];\n');
                else
                    % 313 315
                    hdlbody = horzcat(hdlbody, '  ', assign_prefix, '  ', hdlsignalname(outvld), assign_op, hdlsignalname(dvldreg), '[', num2str(0.0), '];\n');
                    % 315 317
                end
            end
        end
    end
    hdlbody = horzcat(hdlbody, ' \n');
end
function formatbody = formatbody(body)
    % 323 329
    % 324 329
    % 325 329
    % 326 329
    % 327 329
    formatbody = strrep(body, '\n\n', '\n');
    formatbody = strrep(formatbody, '\n', '\n      ');
end
function space = spaces(indent)
    space = mtimes(fix(' '), ones(1.0, indent));
end
function asyncbody = scalarAsyncBody(outname, ICstr)
    asyncbody = horzcat(outname, ' <= ', ICstr, ';\n');
end
