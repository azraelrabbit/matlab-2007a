function [hdlbody, hdlsignals] = vhdlshiftregister(input, output, loaden, extOut, outvld, startSignal, functionMode, shiftmode, initValue, processName)
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
        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(shiftreg));
        if ~(isempty(outvld))
            [name, dvldreg] = hdlnewsignal(hdllegalname('dvldreg'), 'filter', -1.0, 0.0, 0.0, vtype, sltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(dvldreg));
        end
        regsltype = hdlsignalsltype(shiftreg);
        [regsize, outbp, outsigned] = hdlwordsize(regsltype);
    end
    if eq(hdlgetparameter('async_reset'), 1.0)
        sensList = horzcat('PROCESS (', clockname, ', ', resetname, ')\n');
        asyncIf = horzcat('IF ', resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), ''' THEN', '\n');
        if eq(hdlgetparameter('clock_rising_edge'), 0.0)
            asyncElsif = horzcat('ELSIF ', clockname, singlequote, 'event AND ', clockname, ' = ''1'' THEN\n');
        else
            asyncElsif = horzcat('ELSIF ', 'rising_edge(', clockname, ') THEN\n');
        end
        reset_body_spaces = 6.0;
    else
        sensList = horzcat('PROCESS (', clockname, ')\n');
        if eq(hdlgetparameter('clock_rising_edge'), 0.0)
            asyncIf = horzcat('IF ', clockname, singlequote, 'event AND ', clockname, ' = ''1'' THEN\n');
        else
            asyncIf = horzcat('IF ', 'rising_edge(', clockname, ') THEN\n');
        end
        asyncElsif = horzcat('IF ', resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), ''' THEN', '\n');
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
        syncbody = horzcat(syncbody, '  IF ', hdlsignalname(loaden), ' = ''1'' THEN\n');
        % 192 194
        if strcmpi(shiftmode, 'SHIFTLEFT')
            syncbody = horzcat(syncbody, '    ', hdlsignalname(shiftreg), ' <= ', hdlsignalname(shiftreg), '(', num2str(minus(regsize, 2.0)), ' DOWNTO 0) & ', hdlsignalname(input), ';\n');
            % 195 197
            if ~(isempty(outvld))
                if isempty(startSignal)
                    syncbody = horzcat(syncbody, '    ', hdlsignalname(dvldreg), ' <= ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 2.0)), ' DOWNTO 0) & ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 1.0)), ') ;\n');
                else
                    % 200 202
                    % 201 203
                    syncbody = horzcat(syncbody, '    ', hdlsignalname(dvldreg), ' <= ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 2.0)), ' DOWNTO 0) & ', hdlsignalname(startSignal), ';\n');
                    % 203 206
                    % 204 206
                end
            end
        else
            syncbody = horzcat(syncbody, '    ', hdlsignalname(shiftreg), ' <= ', hdlsignalname(input), ' & ', hdlsignalname(shiftreg), '(', num2str(minus(regsize, 1.0)), ' DOWNTO 1);\n');
            % 209 211
            if ~(isempty(outvld))
                if isempty(startSignal)
                    syncbody = horzcat(syncbody, '    ', hdlsignalname(dvldreg), ' <= ', hdlsignalname(dvldreg), '(', num2str(0.0), ') & ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 1.0)), ' DOWNTO 1) ;\n');
                else
                    % 214 216
                    % 215 217
                    syncbody = horzcat(syncbody, '    ', hdlsignalname(dvldreg), ' <= ', hdlsignalname(startSignal), ' & ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 1.0)), ' DOWNTO 1) ;\n');
                    % 217 220
                    % 218 220
                end
            end
        end
        syncbody = horzcat(syncbody, '  END IF;\n');
    else
        % 224 226
        syncbody = horzcat(syncbody, '  IF ', hdlsignalname(loaden), ' = ''1'' THEN\n', '    ', hdlsignalname(shiftreg), ' <= ', hdlsignalname(input), ';\n');
        % 226 229
        % 227 229
        if ~(isempty(outvld))
            syncbody = horzcat(syncbody, '    ', hdlsignalname(dvldreg), ' <= (OTHERS => ''1'');\n');
            % 230 232
        end
        syncbody = horzcat(syncbody, '  ELSE\n');
        % 233 235
        if strcmpi(shiftmode, 'SHIFTLEFT')
            syncbody = horzcat(syncbody, '    ', hdlsignalname(shiftreg), ' <= ', hdlsignalname(shiftreg), '(', num2str(minus(regsize, 2.0)), ' DOWNTO 0) & ''0'';\n');
            % 236 238
            if ~(isempty(outvld))
                syncbody = horzcat(syncbody, '    ', hdlsignalname(dvldreg), ' <= ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 2.0)), ' DOWNTO 0) & ''0'';\n');
                % 239 241
            end
        else
            syncbody = horzcat(syncbody, '    ', hdlsignalname(shiftreg), ' <= ''0'' & ', hdlsignalname(shiftreg), '(', num2str(minus(regsize, 1.0)), ' DOWNTO 1);\n');
            % 243 245
            if ~(isempty(outvld))
                syncbody = horzcat(syncbody, '    ', hdlsignalname(dvldreg), ' <= ''0'' & ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 1.0)), ' DOWNTO 1);\n');
                % 246 248
            end
        end
        syncbody = horzcat(syncbody, '  END IF;\n');
        % 250 252
    end
    % 252 255
    % 253 255
    if eq(hdlgetparameter('async_reset'), 1.0)
        if isempty(clockenablename)
            sync_statement = horzcat(spaces(6.0), formatbody(syncbody), '\n');
        else
            sync_statement = horzcat(spaces(6.0), 'IF ', clockenablename, ' = ''1'' THEN\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
            % 259 262
            % 260 262
        end
        hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, asyncbody, spaces(4.0), asyncElsif, sync_statement, spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
    else
        % 264 271
        % 265 271
        % 266 271
        % 267 271
        % 268 271
        % 269 271
        % 270 272
        if isempty(clockenablename)
            sync_statement = horzcat(spaces(6.0), 'ELSE\n', spaces(4.0), formatbody(syncbody), 'END IF;\n');
        else
            % 274 276
            % 275 277
            sync_statement = horzcat(spaces(6.0), 'ELSIF ', clockenablename, ' = ''1'' THEN\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
            % 277 280
            % 278 280
        end
        hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, spaces(6.0), asyncElsif, asyncbody, sync_statement, spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
        % 281 289
        % 282 289
        % 283 289
        % 284 289
        % 285 289
        % 286 289
        % 287 289
    end
    % 289 292
    % 290 292
    if strcmpi(functionMode, 'DESERIALIZER')
        hdlbody = horzcat(hdlbody, '  ', hdlsignalname(output), ' <= ', hdlsignalname(shiftreg), ';\n');
        % 293 296
        % 294 296
        if ~(isempty(outvld))
            if strcmpi(shiftmode, 'SHIFTLEFT')
                hdlbody = horzcat(hdlbody, '  ', hdlsignalname(outvld), ' <= ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 1.0)), ');\n');
            else
                % 299 301
                hdlbody = horzcat(hdlbody, '  ', hdlsignalname(outvld), ' <= ', hdlsignalname(dvldreg), '(', num2str(0.0), ');\n');
                % 301 303
            end
        end
    else
        if strcmpi(functionMode, 'SHIFTER')
            if strcmpi(shiftmode, 'SHIFTLEFT')
                hdlbody = horzcat(hdlbody, '  ', hdlsignalname(extOut), ' <= ', hdlsignalname(shiftreg), '(', num2str(minus(regsize, 1.0)), ');\n');
            else
                % 309 311
                hdlbody = horzcat(hdlbody, '  ', hdlsignalname(extOut), ' <= ', hdlsignalname(shiftreg), '(', num2str(0.0), ');\n');
                % 311 313
            end
        else
            if strcmpi(shiftmode, 'SHIFTLEFT')
                hdlbody = horzcat(hdlbody, '  ', hdlsignalname(output), ' <= ', hdlsignalname(shiftreg), '(', num2str(minus(regsize, 1.0)), ');\n');
            else
                % 317 319
                hdlbody = horzcat(hdlbody, '  ', hdlsignalname(output), ' <= ', hdlsignalname(shiftreg), '(', num2str(0.0), ');\n');
                % 319 321
            end
            if ~(isempty(outvld))
                if strcmpi(shiftmode, 'SHIFTLEFT')
                    hdlbody = horzcat(hdlbody, '  ', hdlsignalname(outvld), ' <= ', hdlsignalname(dvldreg), '(', num2str(minus(regsize, 1.0)), ');\n');
                else
                    % 325 327
                    hdlbody = horzcat(hdlbody, '  ', hdlsignalname(outvld), ' <= ', hdlsignalname(dvldreg), '(', num2str(0.0), ');\n');
                    % 327 329
                end
            end
        end
    end
    hdlbody = horzcat(hdlbody, ' \n');
    % 333 336
    % 334 336
    hdlsequentialcontext(false);
end
function formatbody = formatbody(body)
    % 338 343
    % 339 343
    % 340 343
    % 341 343
    formatbody = strrep(body, '\n\n', '\n');
    formatbody = strrep(formatbody, '\n', '\n      ');
end
function space = spaces(indent)
    space = mtimes(fix(' '), ones(1.0, indent));
end
function asyncbody = scalarAsyncBody(outname, ICstr)
    asyncbody = horzcat(outname, ' <= ', ICstr, ';\n');
end
