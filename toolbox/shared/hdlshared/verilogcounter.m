function [hdlbody, hdlsignals] = verilogcounter(counter_out, count, processName, updown, initValue, phase, phaseRegOut, loadenb, loadvalue)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    hdlsequentialcontext(true);
    bdt = hdlgetparameter('base_data_type');
    hdlbody = [];
    hdlsignals = [];
    singlequote = char(39.0);
    hdlsignals = [];
    % 17 19
    if lt(nargin, 3.0)
        msg = 'hdlcounter should be called with at least three arguments, counter_out, count and processName.';
    else
        if eq(nargin, 3.0)
            updown = 1.0;
            initValue = 0.0;
            phase = -1.0;
            loadvalue = initValue;
            phaseRegOut = -1.0;
        else
            if eq(nargin, 4.0)
                if eq(updown, 1.0)
                    initValue = 0.0;
                else
                    initValue = count;
                end % if
                phase = -1.0;
                loadvalue = initValue;
                phaseRegOut = -1.0;
            else
                if eq(nargin, 5.0)
                    phase = -1.0;
                    loadvalue = initValue;
                    phaseRegOut = -1.0;
                else
                    if eq(nargin, 6.0)
                        loadvalue = initValue;
                        phaseRegOut = -1.0;
                    else
                        if eq(nargin, 7.0) || eq(nargin, 8.0)
                            loadvalue = initValue;
                        end % if
                    end % if
                end % if
            end % if
        end % if
    end % if
    cclk = hdlgetcurrentclock;
    if isempty(cclk) || eq(cclk, 0.0)
        clockname = hdlgetparameter('clockname');
    else
        clockname = hdlsignalname(cclk);
    end % if
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
    hdlregsignal(counter_out);
    if eq(hdlgetparameter('reset_asserted_level'), 1.0)
        resetedge = 'posedge ';
    else
        resetedge = 'negedge ';
    end % if
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
    end % if
    asyncbody = [];
    syncbody = [];
    outname = hdlsignalname(counter_out);
    outsltype = hdlsignalsltype(counter_out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    ICstr0 = hdlconstantvalue(0.0, outsize, outbp, outsigned, 'noaggregate');
    asyncbody = horzcat(asyncbody, spaces(reset_body_spaces), scalarAsyncBody(outname, hdlconstantvalue(initValue, outsize, outbp, outsigned, 'noaggregate')));
    if gt(outsize, 1.0) || eq(outsigned, 1.0)
        if eq(updown, 1.0)
            if gt(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'if (', enablename, ' ==  1''b1', ') begin\n');
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 4.0)), scalarAsyncBody(outname, hdlconstantvalue(loadvalue, outsize, outbp, outsigned, 'noaggregate')));
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'end\n');
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'else if (', outname, ' == ', hdlconstantvalue(minus(count, 1.0), outsize, outbp, outsigned, 'noaggregate'), ') begin\n');
            else
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'if (', outname, ' == ', hdlconstantvalue(minus(count, 1.0), outsize, outbp, outsigned, 'noaggregate'), ') begin\n');
            end % if
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 4.0)), scalarAsyncBody(outname, ICstr0));
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'end\n');
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'else begin\n');
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 4.0)), outname, ' <= ', outname, ' + 1;\n');
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'end\n');
        else
            if gt(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'if (', enablename, ' ==  1''b1', ') begin\n');
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 4.0)), scalarAsyncBody(outname, hdlconstantvalue(loadvalue, outsize, outbp, outsigned, 'noaggregate')));
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'end\n');
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'else if (', outname, ' == ', hdlconstantvalue(0.0, outsize, outbp, outsigned, 'noaggregate'), ') begin\n');
            else
                syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'if (', outname, ' == ', hdlconstantvalue(0.0, outsize, outbp, outsigned, 'noaggregate'), ') begin\n');
            end % if
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 4.0)), outname, ' <= ', hdlconstantvalue(minus(count, 1.0), outsize, outbp, outsigned, 'noaggregate'), ';\n');
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'end\n');
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'else begin\n');
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 4.0)), outname, ' <= ', outname, ' - 1;\n');
            syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 2.0)), 'end\n');
        end % if
    else
        syncbody = horzcat(syncbody, spaces(plus(reset_body_spaces, 4.0)), outname, ' <= ~ ', outname, ';\n');
    end % if
    % 140 144
    % 141 144
    % 142 144
    if isempty(clockenablename)
        sync_statement = syncbody;
    else
        sync_statement = horzcat(spaces(8.0), horzcat('if (', clockenablename, ' == 1''b1) begin\n'), syncbody, spaces(8.0), 'end\n');
        % 147 150
        % 148 150
    end % if
    hdlbody = horzcat(spaces(2.0), sensList, spaces(4.0), 'begin: ', processName, '\n', spaces(6.0), asyncIf, asyncbody, spaces(6.0), 'end\n', spaces(6.0), asyncElsif, sync_statement, spaces(6.0), 'end\n', spaces(4.0), 'end ', hdlgetparameter('comment_char'), ' ', processName, '\n\n');
    % 151 161
    % 152 161
    % 153 161
    % 154 161
    % 155 161
    % 156 161
    % 157 161
    % 158 161
    % 159 161
    hdlsequentialcontext(false);
    % 161 163
    if iscell(phase)
        for ii=1.0:length(phase)
            tmp_phase = cell2mat(phase(ii));
            if eq(phaseRegOut, -1.0)
                [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(length(tmp_phase)))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                hdlsignals = horzcat(hdlsignals, idx);
                tmpname = phase_name;
                tmpidx = idx;
            else
                [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(tmp_phase))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                hdlsignals = horzcat(hdlsignals, idx);
                [tmpphase, tmpidx] = hdlnewsignal(hdllegalname(horzcat('phase_tmp', num2str(tmp_phase))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                hdlsignals = horzcat(hdlsignals, tmpidx);
                [tmpbody, tmpsignal] = verilogunitdelay(tmpidx, idx, hdluniqueprocessname, 0.0);
                hdlsignals = horzcat(hdlsignals, tmpsignal);
                hdlbody = horzcat(hdlbody, tmpbody);
                tmp_phase = minus(tmp_phase, 1.0);
                for ii=1.0:length(tmp_phase)
                    if eq(tmp_phase(ii), -1.0)
                        tmp_phase(ii) = minus(count, 1.0);
                    end % if
                end % for
            end % if
            decodebody = [];
            [assign_prefix, assign_op] = hdlassignforoutput(tmpidx);
            decodeheader = horzcat(spaces(2.0), assign_prefix, ' ', tmpname, ' ', assign_op);
            if isempty(clockenablename)
                clkenableStr = '';
            else
                clkenableStr = horzcat(' && ', clockenablename, ' == 1''b1');
            end % if
            if gt(length(tmp_phase), 1.0)
                for ii=1.0:length(tmp_phase)
                    if eq(ii, 1.0)
                        decodebody = horzcat(decodeheader, ' (((', outname, ' == ', hdlconstantvalue(tmp_phase(ii), outsize, outbp, outsigned, 'noaggregate'), ')  ||\n');
                    else
                        if le(ii, minus(length(tmp_phase), 1.0))
                            decodebody = horzcat(decodebody, spaces(plus(length(decodeheader), 2.0)), ' (', outname, ' == ', hdlconstantvalue(tmp_phase(ii), outsize, outbp, outsigned, 'noaggregate'), ')  ||\n');
                        else
                            decodebody = horzcat(decodebody, spaces(plus(length(decodeheader), 2.0)), ' (', outname, ' == ', hdlconstantvalue(tmp_phase(ii), outsize, outbp, outsigned, 'noaggregate'), '))', clkenableStr, ')? 1 : 0;\n\n');
                        end % if
                    end % if
                end % for
                hdlbody = horzcat(hdlbody, decodebody);
            else
                if isempty(clockenablename)
                    decodebody = horzcat(spaces(2.0), assign_prefix, ' ', tmpname, ' ', assign_op, ' (', outname, ' == ', hdlconstantvalue(tmp_phase, outsize, outbp, outsigned, 'noaggregate'), ')? 1 : 0;\n\n');
                else
                    decodebody = horzcat(spaces(2.0), assign_prefix, ' ', tmpname, ' ', assign_op, ' (', outname, ' == ', hdlconstantvalue(tmp_phase, outsize, outbp, outsigned, 'noaggregate'), ' && ', clockenablename, ' == 1''b1)? 1 : 0;\n\n');
                end % if
                hdlbody = horzcat(hdlbody, decodebody);
            end % if
        end % for
    else
        if isvector(phase)
            for ii=1.0:length(phase)
                if ge(phase(ii), 0.0)
                    if eq(phaseRegOut, -1.0)
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase(ii)))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        tmpname = phase_name;
                        tmpidx = idx;
                    else
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase(ii)))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        [tmpname, tmpidx] = hdlnewsignal(hdllegalname(horzcat('phase_tmp', num2str(phase(ii)))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                        hdlsignals = horzcat(hdlsignals, tmpidx);
                        [tmpbody, tmpsignal] = verilogunitdelay(tmpidx, idx, hdluniqueprocessname, 0.0);
                        hdlsignals = horzcat(hdlsignals, tmpsignal);
                        hdlbody = horzcat(hdlbody, tmpbody);
                        if eq(phase(ii), 0.0)
                            phase(ii) = minus(count, 1.0);
                        else
                            phase(ii) = minus(phase(ii), 1.0);
                        end % if
                    end % if
                    % 238 240
                    [assign_prefix, assign_op] = hdlassignforoutput(tmpidx);
                    % 240 242
                    if isempty(clockenablename)
                        decodebody = horzcat(spaces(2.0), assign_prefix, ' ', tmpname, ' ', assign_op, ' (', outname, ' == ', hdlconstantvalue(phase(ii), outsize, outbp, outsigned, 'noaggregate'), ')? 1 : 0;\n\n');
                    else
                        % 244 246
                        decodebody = horzcat(spaces(2.0), assign_prefix, ' ', tmpname, ' ', assign_op, ' (', outname, ' == ', hdlconstantvalue(phase(ii), outsize, outbp, outsigned, 'noaggregate'), ' && ', clockenablename, ' == 1''b1)? 1 : 0;\n\n');
                        % 246 248
                    end % if
                    hdlbody = horzcat(hdlbody, decodebody);
                end % if
            end % for
        else
            if isscalar(phase)
                if ge(phase, 0.0)
                    if eq(phaseRegOut, -1.0)
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                    else
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        [tmpname, tmpidx] = hdlnewsignal(hdllegalname(horzcat('phase_tmp', num2str(phase))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                        hdlsignals = horzcat(hdlsignals, tmpidx);
                        [tmpbody, tmpsignal] = verilogunitdelay(tmpidx, idx, hdluniqueprocessname, 0.0);
                        hdlsignals = horzcat(hdlsignals, tmpsignal);
                        hdlbody = horzcat(hdlbody, tmpbody);
                        if eq(phase, 0.0)
                            phase = minus(count, 1.0);
                        else
                            phase = minus(phase, 1.0);
                        end % if
                    end % if
                    [assign_prefix, assign_op] = hdlassignforoutput(tmpidx);
                    % 272 274
                    if isempty(clockenablename)
                        decodebody = horzcat(spaces(2.0), assign_prefix, ' ', tmpname, ' ', assign_op, ' (', outname, ' == ', hdlconstantvalue(phase, outsize, outbp, outsigned, 'noaggregate'), ')? 1 : 0;\n\n');
                    else
                        % 276 278
                        decodebody = horzcat(spaces(2.0), assign_prefix, ' ', tmpname, ' ', assign_op, ' (', outname, ' == ', hdlconstantvalue(phase, outsize, outbp, outsigned, 'noaggregate'), ' && ', clockenablename, ' == 1''b1)? 1 : 0;\n\n');
                        % 278 280
                    end % if
                    % 280 282
                    hdlbody = horzcat(hdlbody, decodebody);
                end % if
            else
                msg = 'This block function mode for hdlminmaxblock is not supported';
            end % if
        end % if
    end % if
end % function
function formatbody = formatbody(body)
    % 290 293
    % 291 293
    formatbody = strrep(body, '\n\n', '\n');
    formatbody = strrep(formatbody, '\n', '\n      ');
end % function
function space = spaces(indent)
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
function asyncbody = scalarAsyncBody(outname, ICstr)
    asyncbody = horzcat(outname, ' <= ', ICstr, ';\n');
end % function
