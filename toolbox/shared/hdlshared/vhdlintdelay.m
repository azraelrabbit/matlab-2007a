function [hdlbody, hdlsignals] = vhdlintdelay(in, out, processName, numdelays, scalarIC)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hdlsequentialcontext(true);
    % 10 12
    if lt(nargin, 5.0) || isempty(scalarIC)
        scalarIC = 0.0;
    end % if
    % 14 16
    hdlsignals = '';
    singlequote = char(39.0);
    % 17 19
    vector = hdlsignalvector(in);
    sltype = hdlsignalsltype(in);
    cplx = hdlsignalcomplex(in);
    [size, bp, signed] = hdlwordsize(sltype);
    % 22 24
    outname = hdlsignalname(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 26 28
    if cplx
        outname_im = hdlsignalname(hdlsignalimag(out));
    end % if
    % 30 32
    cclk = hdlgetcurrentclock;
    if isempty(cclk) || eq(cclk, 0.0)
        clockname = hdlgetparameter('clockname');
    else
        clockname = hdlsignalname(cclk);
    end % if
    % 37 39
    cclken = hdlgetcurrentclockenable;
    if isempty(cclken)
        clockenablename = '';
    else
        if eq(cclken, 0.0)
            clockenablename = hdlgetparameter('clockenablename');
        else
            clockenablename = hdlsignalname(cclken);
        end % if
    end % if
    creset = hdlgetcurrentreset;
    if isempty(creset)
        resetname = '';
    else
        if eq(creset, 0.0)
            resetname = hdlgetparameter('resetname');
        else
            resetname = hdlsignalname(creset);
        end % if
        % 57 59
    end % if
    newvhdltype = vhdlvectorblockdatatype(cplx, horzcat(numdelays, 0.0), hdlblockdatatype(outsltype), outsltype);
    % 60 63
    % 61 63
    if eq(vector, 0.0)
        % 63 65
        [tempnames, ptr] = hdlnewsignal('int_delay_pipe', 'block', -1.0, cplx, horzcat(numdelays, 0.0), newvhdltype, sltype);
        % 65 67
        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(ptr));
        if cplx
            tempstore = tempnames{1.0};
            tempstore_im = tempnames{2.0};
        else
            tempstore = tempnames;
        end % if
    else
        % 74 76
        vectsize = max(vector(1.0), vector(2.0));
        for k=1.0:vectsize
            [tempnames, ptr] = hdlnewsignal('int_delay_pipe', 'block', -1.0, cplx, horzcat(numdelays, 0.0), newvhdltype, sltype);
            % 78 80
            if cplx
                tempstore{k} = tempnames{1.0};
                tempstore_im{k} = tempnames{2.0};
            else
                tempstore{k} = tempnames;
            end % if
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(ptr));
        end % for
    end % if
    % 88 91
    % 89 91
    if eq(hdlgetparameter('async_reset'), 1.0) && not(isempty(creset))
        sensList = horzcat('PROCESS (', clockname, ', ', resetname, ')\n');
        % 92 95
        % 93 95
        asyncIfCond = horzcat(resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), '''');
        % 95 98
        % 96 98
        if eq(hdlgetparameter('clock_rising_edge'), 0.0)
            asyncElsifCond = horzcat(clockname, singlequote, 'event AND ', clockname, ' = ''1''');
        else
            % 100 102
            asyncElsifCond = horzcat('rising_edge(', clockname, ')');
        end % if
    else
        sensList = horzcat('PROCESS (', clockname, ')\n');
        % 105 107
        if eq(hdlgetparameter('clock_rising_edge'), 0.0)
            asyncIfCond = horzcat(clockname, singlequote, 'event AND ', clockname, ' = ''1''');
        else
            % 109 111
            asyncIfCond = horzcat('rising_edge(', clockname, ')');
        end % if
        % 112 115
        % 113 115
        if not(isempty(creset))
            asyncElsifCond = horzcat(resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), '''');
            % 116 118
        end % if
        % 118 120
    end % if
    % 120 123
    % 121 123
    if not(strcmp(sltype, 'double')) && all(eq(scalarIC, 0.0)) && gt(outsize, 1.0)
        ICstr = '(OTHERS => ''0'')';
    else
        if strcmp(sltype, 'double') && all(eq(scalarIC, 0.0))
            ICstr = '0.0';
        else
            vsize = max(vector);
            if gt(vsize, 1.0)
                if gt(length(scalarIC), 1.0) && not(all(eq(scalarIC, 0.0)))
                    warning(hdlerrormsgid('icignored'), 'Vector initial conditions are ignored in this release.  Using the first element instead.')
                    % 132 134
                end % if
                ICstr = hdlconstantvalue(scalarIC(1.0), outsize, outbp, outsigned);
            else
                ICstr = hdlconstantvalue(scalarIC(1.0), outsize, outbp, outsigned);
            end % if
        end % if
        % 139 141
    end % if
    if eq(vector, 0.0)
        asyncbody = scalarAsyncBody(size, sltype, tempstore, numdelays, ICstr);
        name = hdlsafeinput(in, outsltype);
        syncbody = scalarSyncBody(name, tempstore, numdelays);
        if cplx
            asyncbody = horzcat(asyncbody, spaces(6.0), scalarAsyncBody(size, sltype, tempstore_im, numdelays, ICstr));
            name_im = hdlsafeinput(hdlsignalimag(in), outsltype);
            syncbody = horzcat(syncbody, spaces(8.0), scalarSyncBody(name_im, tempstore_im, numdelays));
        end % if
    else
        % 151 153
        asyncbody = scalarAsyncBody(size, sltype, tempstore{1.0}, numdelays, ICstr);
        name = hdlsafeinput(in, outsltype, '0');
        syncbody = scalarSyncBody(name, tempstore{1.0}, numdelays);
        if cplx
            asyncbody = horzcat(asyncbody, spaces(6.0), scalarAsyncBody(size, sltype, tempstore_im{1.0}, numdelays, ICstr));
            name_im = hdlsafeinput(hdlsignalimag(in), outsltype, '0');
            syncbody = horzcat(syncbody, spaces(8.0), scalarSyncBody(name_im, tempstore_im{1.0}, numdelays));
        end % if
        for k=2.0:vectsize
            asyncbody = horzcat(asyncbody, spaces(6.0), scalarAsyncBody(size, sltype, tempstore{k}, numdelays, ICstr));
            name = hdlsafeinput(in, outsltype, num2str(minus(k, 1.0)));
            syncbody = horzcat(syncbody, spaces(8.0), scalarSyncBody(name, tempstore{k}, numdelays));
            if cplx
                asyncbody = horzcat(asyncbody, spaces(6.0), scalarAsyncBody(size, sltype, tempstore_im{k}, numdelays, ICstr));
                name_im = hdlsafeinput(hdlsignalimag(in), outsltype, num2str(minus(k, 1.0)));
                syncbody = horzcat(syncbody, spaces(8.0), scalarSyncBody(name_im, tempstore_im{k}, numdelays));
            end % if
        end % for
    end % if
    % 171 174
    % 172 174
    if eq(hdlgetparameter('async_reset'), 1.0) && not(isempty(creset))
        hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), 'IF ', asyncIfCond, ' THEN\n', spaces(6.0), asyncbody, spaces(4.0), 'ELSIF ', asyncElsifCond, ' THEN \n', spaces(6.0), horzcat('IF ', clockenablename, ' = ''1'' THEN\n'), spaces(8.0), syncbody, spaces(6.0), 'END IF;\n', spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
    else
        % 176 185
        % 177 185
        % 178 185
        % 179 185
        % 180 185
        % 181 185
        % 182 185
        % 183 185
        if isempty(creset)
            hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), 'IF ', asyncIfCond, ' THEN\n', spaces(6.0), horzcat('IF ', clockenablename, ' = ''1'' THEN\n'), spaces(8.0), syncbody, spaces(6.0), 'END IF;\n', spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
        else
            % 187 194
            % 188 194
            % 189 194
            % 190 194
            % 191 194
            % 192 194
            % 193 195
            hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), 'IF ', asyncIfCond, ' THEN\n', spaces(6.0), 'IF ', asyncElsifCond, ' THEN\n', spaces(8.0), asyncbody, spaces(6.0), horzcat('ELSIF ', clockenablename, ' = ''1'' THEN\n'), spaces(8.0), syncbody, spaces(6.0), 'END IF;\n', spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
            % 195 205
            % 196 205
            % 197 205
            % 198 205
            % 199 205
            % 200 205
            % 201 205
            % 202 205
            % 203 205
        end % if
        % 205 209
        % 206 209
        % 207 209
    end % if
    outdelayidx = horzcat('(', num2str(minus(numdelays, 1.0)), ')');
    if eq(vector, 0.0)
        hdlbody = horzcat(hdlbody, spaces(2.0), horzcat(outname, ' <= ', tempstore, outdelayidx, ';\n\n'));
        if cplx
            hdlbody = horzcat(hdlbody, spaces(2.0), horzcat(outname_im, ' <= ', tempstore_im, outdelayidx, ';\n\n'));
        end % if
    else
        % 216 218
        hdlbody = horzcat(hdlbody, vectorprocessoutput(outname, tempstore, vectsize, numdelays), ');\n\n');
        if cplx
            hdlbody = horzcat(hdlbody, vectorprocessoutput(outname_im, tempstore_im, vectsize, numdelays), ');\n\n');
        end % if
    end % if
    % 222 224
    hdlsequentialcontext(false);
end % function
function space = spaces(indent)
    % 226 230
    % 227 230
    % 228 230
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
function asyncbody = scalarAsyncBody(size, sltype, tempstore, numdelays, ICstr)
    idxstr = horzcat('(0 TO ', num2str(minus(numdelays, 1.0)), ')');
    asyncbody = horzcat(tempstore, idxstr, ' <= (OTHERS => ', ICstr, ');\n');
end % function
function syncbody = scalarSyncBody(name, tempstore, numdelays)
    syncbody = horzcat(tempstore, '(0)', ' <= ', name, ';\n');
    if gt(numdelays, 2.0)
        idxstr1 = horzcat('(1 TO ', num2str(minus(numdelays, 1.0)), ')');
        idxstr2 = horzcat('(0 TO ', num2str(minus(numdelays, 2.0)), ')');
    else
        idxstr1 = '(1)';
        idxstr2 = '(0)';
    end % if
    syncbody = horzcat(syncbody, spaces(8.0), tempstore, idxstr1, ' <= ', tempstore, idxstr2, ';\n');
end % function
function assignstr = vectorprocessoutput(outname, tempstore, vectsize, numdelays)
    outdelayidx = horzcat('(', num2str(minus(numdelays, 1.0)), ')');
    assignstr = horzcat(spaces(2.0), outname, '(0 TO ', num2str(minus(vectsize, 1.0)), ')', ' <= ', '(');
    for k=1.0:minus(vectsize, 1.0)
        assignstr = horzcat(assignstr, tempstore{k}, outdelayidx, ', ');
    end % for
    assignstr = horzcat(assignstr, tempstore{vectsize}, outdelayidx);
end % function
