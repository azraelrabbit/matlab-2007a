function [hdlbody, hdlsignals] = verilogintdelay(in, out, processName, numdelays, scalarIC)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hdlsignals = '';
    % 10 12
    if lt(nargin, 5.0) || isempty(scalarIC)
        scalarIC = 0.0;
    end % if
    % 14 16
    vector = hdlsignalvector(in);
    sltype = hdlsignalsltype(in);
    cplx = hdlsignalcomplex(in);
    % 18 20
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 21 23
    cclk = hdlgetcurrentclock;
    if isempty(cclk) || eq(cclk, 0.0)
        clockname = hdlgetparameter('clockname');
    else
        clockname = hdlsignalname(cclk);
    end % if
    % 28 30
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
        % 48 51
        % 49 51
    end % if
    newverilogtype = hdlsignalvtype(out);
    if eq(vector, 0.0)
        % 53 55
        [tempnames, ptr] = hdlnewsignal('int_delay_pipe', 'block', -1.0, cplx, horzcat(1.0, numdelays), newverilogtype, sltype);
        hdlregsignal(ptr);
        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(ptr));
        if cplx
            tempstore = tempnames{1.0};
            tempstore_im = tempnames{2.0};
            % 60 62
            out_ptr = ptr(1.0);
            out_ptr_im = ptr(2.0);
        else
            tempstore = tempnames;
            out_ptr = ptr;
        end % if
    else
        % 68 70
        vectsize = max(vector(1.0), vector(2.0));
        for k=1.0:vectsize
            [tempnames, ptr] = hdlnewsignal('int_delay_pipe', 'block', -1.0, cplx, horzcat(1.0, numdelays), newverilogtype, sltype);
            hdlregsignal(ptr);
            if cplx
                tempstore{k} = tempnames{1.0};
                tempstore_im{k} = tempnames{2.0};
                % 76 78
                out_ptr{k} = ptr(1.0);
                out_ptr_im{k} = ptr(2.0);
            else
                % 80 82
                tempstore{k} = tempnames;
                out_ptr{k} = ptr;
            end % if
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(ptr));
        end % for
    end % if
    % 87 89
    if not(strcmp(sltype, 'double')) && gt(outsize, 1.0) && all(eq(scalarIC, 0.0))
        ICstr = '0';
    else
        vsize = max(vector);
        if gt(vsize, 1.0)
            % 93 95
            if gt(length(scalarIC), 1.0) && not(all(eq(scalarIC, 0.0)))
                warning(hdlerrormsgid('icignored'), 'Vector initial conditions are ignored in this release.  Using the first element instead.')
                % 96 98
            end % if
            ICstr = hdlconstantvalue(scalarIC(1.0), outsize, outbp, outsigned);
        else
            ICstr = hdlconstantvalue(scalarIC(1.0), outsize, outbp, outsigned);
        end % if
    end % if
    % 103 106
    % 104 106
    if eq(hdlgetparameter('async_reset'), 1.0) && not(isempty(creset))
        if eq(hdlgetparameter('reset_asserted_level'), 1.0)
            resetedge = 'posedge ';
        else
            resetedge = 'negedge ';
        end % if
        % 111 113
        sensList = horzcat('always @( posedge ', clockname, ' or ', resetedge, resetname, ')\n');
        % 113 117
        % 114 117
        % 115 117
        asyncIf = horzcat('if (', resetname, ' == 1''b', num2str(hdlgetparameter('reset_asserted_level')), ') begin\n');
        % 117 120
        % 118 120
        asyncElsif = 'else begin\n';
    else
        % 121 123
        sensList = horzcat('always @( posedge ', clockname, ')\n');
        % 123 125
        asyncIf = horzcat('if (', resetname, ' == 1''b', num2str(hdlgetparameter('reset_asserted_level')), ') begin\n');
        % 125 129
        % 126 129
        % 127 129
        asyncElsif = 'else begin\n';
    end % if
    % 130 133
    % 131 133
    if eq(vector, 0.0)
        % 133 135
        asyncbody = scalarAsyncBody(tempstore, numdelays, ICstr);
        name = hdlsafeinput(in, outsltype);
        syncbody = scalarSyncBody(name, tempstore, numdelays);
        if cplx
            asyncbody = horzcat(asyncbody, scalarAsyncBody(tempstore_im, numdelays, ICstr));
            name_im = hdlsafeinput(hdlsignalimag(in), outsltype);
            syncbody = horzcat(syncbody, scalarSyncBody(name_im, tempstore_im, numdelays));
        end % if
    else
        % 143 145
        asyncbody = scalarAsyncBody(tempstore{1.0}, numdelays, ICstr);
        name = hdlsafeinput(in, outsltype, '0');
        syncbody = scalarSyncBody(name, tempstore{1.0}, numdelays);
        if cplx
            asyncbody = horzcat(asyncbody, scalarAsyncBody(tempstore_im{1.0}, numdelays, ICstr));
            name_im = hdlsafeinput(hdlsignalimag(in), outsltype, '0');
            syncbody = horzcat(syncbody, scalarSyncBody(name_im, tempstore_im{1.0}, numdelays));
        end % if
        for k=2.0:vectsize
            asyncbody = horzcat(asyncbody, scalarAsyncBody(tempstore{k}, numdelays, ICstr));
            name = hdlsafeinput(in, outsltype, num2str(minus(k, 1.0)));
            syncbody = horzcat(syncbody, scalarSyncBody(name, tempstore{k}, numdelays));
            if cplx
                asyncbody = horzcat(asyncbody, scalarAsyncBody(tempstore_im{k}, numdelays, ICstr));
                name_im = hdlsafeinput(hdlsignalimag(in), outsltype, num2str(minus(k, 1.0)));
                syncbody = horzcat(syncbody, scalarSyncBody(name_im, tempstore_im{k}, numdelays));
                % 160 162
            end % if
        end % for
    end % if
    % 164 168
    % 165 168
    % 166 168
    if isempty(creset)
        hdlbody = horzcat(spaces(2.0), sensList, spaces(4.0), 'begin: ', processName, '\n', spaces(6.0), horzcat('if (', clockenablename, ' == 1''b1) begin\n'), syncbody, spaces(6.0), 'end\n', spaces(4.0), 'end ', hdlgetparameter('comment_char'), ' ', processName, '\n\n');
    else
        % 170 175
        % 171 175
        % 172 175
        % 173 175
        % 174 176
        hdlbody = horzcat(spaces(2.0), sensList, spaces(4.0), 'begin: ', processName, '\n', spaces(6.0), asyncIf, asyncbody, spaces(6.0), 'end\n', spaces(6.0), asyncElsif, spaces(8.0), horzcat('if (', clockenablename, ' == 1''b1) begin\n'), syncbody, spaces(8.0), 'end\n', spaces(6.0), 'end\n', spaces(4.0), 'end ', hdlgetparameter('comment_char'), ' ', processName, '\n\n');
        % 176 187
        % 177 187
        % 178 187
        % 179 187
        % 180 187
        % 181 187
        % 182 187
        % 183 187
        % 184 187
        % 185 187
    end % if
    % 187 190
    % 188 190
    hdlsequentialcontext(false);
    % 190 193
    % 191 193
    if eq(vector, 0.0)
        % 193 195
        tmpstr = hdlsignalassignment(out_ptr, out, minus(numdelays, 1.0), [], []);
        tmpstr = strrep(tmpstr, '\n\n', '\n');
        hdlbody = horzcat(hdlbody, tmpstr);
        if cplx
            tmpstr = hdlsignalassignment(out_ptr_im, hdlsignalimag(out), minus(numdelays, 1.0), [], []);
            tmpstr = strrep(tmpstr, '\n\n', '\n');
            hdlbody = horzcat(hdlbody, tmpstr);
        end % if
    else
        % 203 205
        for k=1.0:vectsize
            tmpstr = hdlsignalassignment(out_ptr{k}, out, minus(numdelays, 1.0), minus(k, 1.0), []);
            tmpstr = strrep(tmpstr, '\n\n', '\n');
            hdlbody = horzcat(hdlbody, tmpstr);
            if cplx
                tmpstr = hdlsignalassignment(out_ptr_im{k}, hdlsignalimag(out), minus(numdelays, 1.0), minus(k, 1.0), []);
                tmpstr = strrep(tmpstr, '\n\n', '\n');
                hdlbody = horzcat(hdlbody, tmpstr);
            end % if
        end % for
    end % if
end % function
function space = spaces(indent)
    % 217 221
    % 218 221
    % 219 221
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
function asyncbody = scalarAsyncBody(outname, numdelays, ICstr)
    % 223 225
    asyncbody = '';
    for n=0.0:minus(numdelays, 1.0)
        idxstr = horzcat('[', num2str(n), ']');
        asyncbody = horzcat(asyncbody, spaces(8.0), outname, idxstr, ' <= ', ICstr, ';\n');
    end % for
end % function
function syncbody = scalarSyncBody(name, outname, numdelays)
    syncbody = horzcat(spaces(8.0), outname, '[0]', ' <= ', name, ';\n');
    for n=1.0:minus(numdelays, 1.0)
        syncbody = horzcat(syncbody, spaces(8.0), outname, '[', num2str(n), ']', ' <= ', outname, '[', num2str(minus(n, 1.0)), ']', ';\n');
        % 234 236
    end % for
end % function
