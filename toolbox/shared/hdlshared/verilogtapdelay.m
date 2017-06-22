function [hdlbody, hdlsignals] = verilogtapdelay(in, out, processName, numdelays, delayorder, scalarIC, includecurrent)
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
    % 15 17
    name = hdlsignalname(in);
    vtype = hdlsignalvtype(in);
    sltype = hdlsignalsltype(in);
    cplx = hdlsignalcomplex(in);
    [size, bp, signed] = hdlwordsize(sltype);
    % 21 23
    outname = hdlsignalname(out);
    outvtype = hdlsignalvtype(out);
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
            [assign_prefix, assign_op] = hdlassignforoutput(out);
            if strcmp(delayorder, 'Newest')
                concbody = horzcat(spaces(2.0), assign_prefix, finalname, '[0] ', assign_op, ' ', name, ';\n');
                concbody = horzcat(concbody, spaces(2.0), assign_prefix, finalname, '[1] ', assign_op, ' ', outname, ';\n');
            else
                concbody = horzcat(spaces(2.0), assign_prefix, finalname, '[0] ', assign_op, ' ', outname, ';\n');
                concbody = horzcat(concbody, spaces(2.0), assign_prefix, finalname, '[1] ', assign_op, ' ', name, ';\n');
            end % if
            hdlbody = horzcat(hdlbody, concbody, '\n');
        else
            [hdlbody, hdlsignals] = hdlunitdelay(in, out, processName, scalarIC);
        end % if
    else
        % 56 58
        hdlsequentialcontext(true);
        % 58 60
        if strcmp(includecurrent, 'on')
            finalname = outname;
            outname_tmp = horzcat(outname, '_tmp');
            block = '';
            complexity = hdlsignalcomplex(out);
            vector = minus(hdlsignalvector(out), 1.0);
            vtype = hdlsignalvtype(out);
            rate = hdlsignalrate(out);
            [outname, tmpidx] = hdlnewsignal(outname_tmp, block, -1.0, complexity, vector, vtype, outsltype, rate);
            hdlregsignal(tmpidx);
            hdlsignals = makehdlsignaldecl(tmpidx);
        else
            hdlregsignal(out);
        end % if
        % 73 75
        cclk = hdlgetcurrentclock;
        if isempty(cclk) || eq(cclk, 0.0)
            clockname = hdlgetparameter('clockname');
        else
            clockname = hdlsignalname(cclk);
        end % if
        % 80 82
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
            ICstr = '0';
        else
            ICstr = hdlconstantvalue(scalarIC, outsize, outbp, outsigned);
        end % if
        % 110 113
        % 111 113
        if eq(hdlgetparameter('async_reset'), 1.0)
            if eq(hdlgetparameter('reset_asserted_level'), 1.0)
                resetedge = 'posedge ';
            else
                resetedge = 'negedge ';
            end % if
            % 118 120
            sensList = horzcat('always @( posedge ', clockname, ' or ', resetedge, resetname, ')\n');
            % 120 125
            % 121 125
            % 122 125
            % 123 125
            asyncIf = horzcat('if (', resetname, ' == 1''b', num2str(hdlgetparameter('reset_asserted_level')), ') begin\n');
            % 125 128
            % 126 128
            asyncElsif = 'else begin\n';
        else
            % 129 131
            sensList = horzcat('always @( posedge ', clockname, ')\n');
            % 131 133
            asyncIf = horzcat('if (', resetname, ' == 1''b', num2str(hdlgetparameter('reset_asserted_level')), ') begin\n');
            % 133 137
            % 134 137
            % 135 137
            asyncElsif = 'else begin\n';
        end % if
        % 138 141
        % 139 141
        asyncbody = scalarAsyncBody(outname, numdelays, ICstr, 8.0);
        [name, size] = hdlsignaltypeconvert(name, size, signed, vtype, outsigned);
        syncbody = scalarSyncBody(name, outname, numdelays, delayorder, 10.0);
        if cplx
            asyncbody = horzcat(asyncbody, spaces(6.0), scalarAsyncBody(outname_im, numdelays, ICstr, 8.0));
            [name_im, size] = hdlsignaltypeconvert(name_im, size, signed, vtype, outsigned);
            syncbody = horzcat(syncbody, spaces(8.0), scalarSyncBody(name_im, outname_im, numdelays, delayorder, 10.0));
        end % if
        % 148 152
        % 149 152
        % 150 152
        hdlbody = horzcat(spaces(2.0), sensList, spaces(4.0), 'begin: ', processName, '\n', spaces(6.0), asyncIf, asyncbody, spaces(6.0), 'end\n', spaces(6.0), asyncElsif, spaces(8.0), horzcat('if (', clockenablename, ' == 1''b1) begin\n'), syncbody, spaces(8.0), 'end\n', spaces(6.0), 'end\n', spaces(4.0), 'end ', hdlgetparameter('comment_char'), ' ', processName, '\n\n');
        % 152 164
        % 153 164
        % 154 164
        % 155 164
        % 156 164
        % 157 164
        % 158 164
        % 159 164
        % 160 164
        % 161 164
        % 162 164
        hdlsequentialcontext(false);
        % 164 166
        if strcmp(includecurrent, 'on')
            [assign_prefix, assign_op] = hdlassignforoutput(out);
            if strcmp(delayorder, 'Newest')
                concbody = horzcat(spaces(2.0), assign_prefix, finalname, '[0] ', assign_op, ' ', name, ';\n');
                for m=1.0:numdelays
                    idxstr1 = horzcat('[', num2str(m), ']');
                    idxstr2 = horzcat('[', num2str(minus(m, 1.0)), ']');
                    concbody = horzcat(concbody, spaces(2.0), assign_prefix, finalname, idxstr1, ' ', assign_op, ' ', outname, idxstr2, ';\n');
                end % for
            else
                concbody = '';
                for m=1.0:numdelays
                    idxstr = horzcat('[', num2str(minus(m, 1.0)), ']');
                    concbody = horzcat(concbody, spaces(2.0), assign_prefix, finalname, idxstr, ' ', assign_op, ' ', outname, idxstr, ';\n');
                end % for
                concbody = horzcat(concbody, spaces(2.0), assign_prefix, finalname, '[', num2str(numdelays), ']', assign_op, name, ';\n');
            end % if
            hdlbody = horzcat(hdlbody, concbody, '\n');
        else
            hdlbody = horzcat(hdlbody, '\n');
        end % if
    end % if
end % function
function space = spaces(indent)
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
function asyncbody = scalarAsyncBody(outname, numdelays, ICstr, indent)
    asyncbody = '';
    for n=0.0:minus(numdelays, 1.0)
        idxstr = horzcat('[', num2str(n), ']');
        asyncbody = horzcat(asyncbody, spaces(indent), outname, idxstr, ' <= ', ICstr, ';\n');
    end % for
end % function
function syncbody = scalarSyncBody(name, outname, numdelays, delayorder, indent)
    syncbody = '';
    if strcmp(delayorder, 'Newest')
        syncbody = horzcat(spaces(indent), outname, '[0]', ' <= ', name, ';\n');
        for n=1.0:minus(numdelays, 1.0)
            syncbody = horzcat(syncbody, spaces(indent), outname, '[', num2str(n), ']', ' <= ', outname, '[', num2str(minus(n, 1.0)), ']', ';\n');
            % 208 210
        end % for
    else
        for n=0.0:minus(numdelays, 2.0)
            syncbody = horzcat(syncbody, spaces(indent), outname, '[', num2str(n), ']', ' <= ', outname, '[', num2str(plus(n, 1.0)), ']', ';\n');
            % 213 215
        end % for
        % 215 217
        syncbody = horzcat(syncbody, spaces(indent), outname, '[', num2str(minus(numdelays, 1.0)), ']', ' <= ', name, ';\n');
    end % if
end % function
