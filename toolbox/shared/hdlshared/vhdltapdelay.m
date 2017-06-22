function [hdlbody, hdlsignals] = vhdltapdelay(in, out, processName, numdelays, delayorder, scalarIC, includecurrent)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if eq(nargin, 6.0)
        includecurrent = 'off';
    end % if
    % 13 15
    hdlsignals = '';
    singlequote = char(39.0);
    % 16 18
    name = hdlsignalname(in);
    vtype = hdlsignalvtype(in);
    sltype = hdlsignalsltype(in);
    cplx = hdlsignalcomplex(in);
    [size, bp, signed] = hdlwordsize(sltype);
    % 22 24
    outname = hdlsignalname(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 26 28
    if eq(numdelays, 1.0)
        if strcmp(includecurrent, 'on')
            finalname = outname;
            outname_tmp = horzcat(outname, '_tmp');
            block = '';
            complexity = hdlsignalcomplex(out);
            % 33 35
            vector = hdlsignalvector(in);
            vtype = hdlsignalvtype(in);
            sltype = hdlsignalsltype(in);
            % 37 39
            rate = hdlsignalrate(out);
            [outname, tmpidx] = hdlnewsignal(outname_tmp, block, -1.0, complexity, vector, vtype, sltype, rate);
            [hdlbody, hdlsignals] = hdlunitdelay(in, tmpidx, processName, scalarIC);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tmpidx));
            % 42 44
            [name, size] = hdlsignaltypeconvert(name, size, signed, vtype, outsigned);
            % 44 46
            if strcmp(delayorder, 'Newest')
                concbody = horzcat(spaces(2.0), finalname, '(0) <= ', name, ';\n');
                concbody = horzcat(concbody, spaces(2.0), finalname, '(1) <= ', outname, ';\n');
            else
                concbody = horzcat(spaces(2.0), finalname, '(0) <= ', outname, ';\n');
                concbody = horzcat(concbody, spaces(2.0), finalname, '(1) <= ', name, ';\n');
            end % if
            hdlbody = horzcat(hdlbody, concbody, '\n');
        else
            [hdlbody, hdlsignals] = hdlunitdelay(in, out, processName, scalarIC);
        end % if
    else
        % 57 59
        hdlsequentialcontext(true);
        if strcmp(includecurrent, 'on')
            finalname = outname;
            outname_tmp = horzcat(outname, '_tmp');
            block = '';
            complexity = hdlsignalcomplex(out);
            vector = minus(hdlsignalvector(out), 1.0);
            outvtype = hdlsignalvtype(out);
            rate = hdlsignalrate(out);
            [outname, tmpidx] = hdlnewsignal(outname_tmp, block, -1.0, complexity, vector, outvtype, outsltype, rate);
            hdlsignals = makehdlsignaldecl(tmpidx);
        end % if
        % 70 72
        cclk = hdlgetcurrentclock;
        if isempty(cclk) || eq(cclk, 0.0)
            clockname = hdlgetparameter('clockname');
        else
            clockname = hdlsignalname(cclk);
        end % if
        % 77 79
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
        end % if
        if cplx
            name_im = hdlsignalname(hdlsignalimag(in));
            outname_im = hdlsignalname(hdlsignalimag(out));
        end % if
        if not(strcmp(sltype, 'double')) && eq(scalarIC, 0.0) && gt(outsize, 1.0)
            ICstr = '(OTHERS => ''0'')';
        else
            ICstr = vhdlconstantvalue(scalarIC, outsize, outbp, outsigned);
        end % if
        % 107 110
        % 108 110
        if eq(hdlgetparameter('async_reset'), 1.0)
            sensList = horzcat('PROCESS (', clockname, ', ', resetname, ')\n');
            % 111 114
            % 112 114
            asyncIf = horzcat('IF ', resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), ''' THEN', '\n');
            % 114 117
            % 115 117
            if eq(hdlgetparameter('clock_rising_edge'), 0.0)
                asyncElsif = horzcat('ELSIF ', clockname, singlequote, 'event AND ', clockname, ' = ''1'' THEN\n');
            else
                % 119 121
                asyncElsif = horzcat('ELSIF ', 'rising_edge(', clockname, ') THEN\n');
            end % if
        else
            % 123 125
            sensList = horzcat('PROCESS (', clockname, ')\n');
            % 125 127
            if eq(hdlgetparameter('clock_rising_edge'), 0.0)
                asyncIf = horzcat('IF ', clockname, singlequote, 'event AND ', clockname, ' = ''1'' THEN\n');
            else
                % 129 131
                asyncIf = horzcat('IF ', 'rising_edge(', clockname, ') THEN\n');
            end % if
            % 132 135
            % 133 135
            asyncElsif = horzcat('IF ', resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), ''' THEN', '\n');
            % 135 139
            % 136 139
            % 137 139
        end % if
        % 139 142
        % 140 142
        asyncbody = scalarAsyncBody(outname, numdelays, ICstr);
        [name, size] = hdlsignaltypeconvert(name, size, signed, vtype, outsigned);
        syncbody = scalarSyncBody(name, outname, numdelays, delayorder);
        if cplx
            asyncbody = horzcat(asyncbody, spaces(6.0), scalarAsyncBody(outname_im, numdelays, ICstr));
            [name_im, size] = hdlsignaltypeconvert(name_im, size, signed, vtype, outsigned);
            syncbody = horzcat(syncbody, spaces(8.0), scalarSyncBody(name_im, outname_im, numdelays, delayorder));
        end % if
        % 149 152
        % 150 152
        if eq(hdlgetparameter('async_reset'), 1.0)
            hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, spaces(6.0), asyncbody, spaces(4.0), asyncElsif, spaces(6.0), horzcat('IF ', clockenablename, ' = ''1'' THEN\n'), spaces(8.0), syncbody, spaces(6.0), 'END IF;\n', spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
        else
            % 154 163
            % 155 163
            % 156 163
            % 157 163
            % 158 163
            % 159 163
            % 160 163
            % 161 163
            % 162 164
            hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, spaces(6.0), asyncElsif, spaces(8.0), asyncbody, spaces(6.0), horzcat('ELSIF ', clockenablename, ' = ''1'' THEN\n'), spaces(8.0), syncbody, spaces(6.0), 'END IF;\n', spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n');
            % 164 174
            % 165 174
            % 166 174
            % 167 174
            % 168 174
            % 169 174
            % 170 174
            % 171 174
            % 172 174
        end % if
        % 174 176
        hdlsequentialcontext(false);
        if strcmp(includecurrent, 'on')
            % 177 179
            if strcmp(delayorder, 'Newest')
                idxstr1 = horzcat('(1 TO ', num2str(numdelays), ')');
                idxstr2 = horzcat('(0 TO ', num2str(minus(numdelays, 1.0)), ')');
                concbody = horzcat(spaces(2.0), finalname, '(0)', ' <= ', name, ';\n');
                concbody = horzcat(concbody, spaces(2.0), finalname, idxstr1, ' <= ', outname, idxstr2, ';\n');
            else
                idxstr = horzcat('(0 TO ', num2str(minus(numdelays, 1.0)), ')');
                concbody = horzcat(spaces(2.0), finalname, idxstr, ' <= ', outname, idxstr, ';\n');
                concbody = horzcat(concbody, spaces(2.0), finalname, '(', num2str(numdelays), ')', ' <= ', name, ';\n');
            end % if
            hdlbody = horzcat(hdlbody, concbody, '\n');
        else
            hdlbody = horzcat(hdlbody, '\n');
        end % if
    end % if
end % function
function space = spaces(indent)
    % 195 203
    % 196 203
    % 197 203
    % 198 203
    % 199 203
    % 200 203
    % 201 203
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
function asyncbody = scalarAsyncBody(outname, numdelays, ICstr)
    ICstr = horzcat('(OTHERS => ', ICstr, ')');
    idxstr = horzcat('(0 TO ', num2str(minus(numdelays, 1.0)), ')');
    asyncbody = horzcat(outname, idxstr, ' <= ', ICstr, ';\n');
end % function
function syncbody = scalarSyncBody(name, outname, numdelays, delayorder)
    if gt(numdelays, 2.0)
        idxstr1 = horzcat('(1 TO ', num2str(minus(numdelays, 1.0)), ')');
        idxstr2 = horzcat('(0 TO ', num2str(minus(numdelays, 2.0)), ')');
    else
        idxstr1 = '(1)';
        idxstr2 = '(0)';
    end % if
    if strcmp(delayorder, 'Newest')
        syncbody = horzcat(outname, '(0)', ' <= ', name, ';\n');
        syncbody = horzcat(syncbody, spaces(8.0), outname, idxstr1, ' <= ', outname, idxstr2, ';\n');
    else
        syncbody = horzcat(outname, idxstr2, ' <= ', outname, idxstr1, ';\n');
        syncbody = horzcat(syncbody, spaces(8.0), outname, '(', num2str(minus(numdelays, 1.0)), ')', ' <= ', name, ';\n');
    end % if
end % function
