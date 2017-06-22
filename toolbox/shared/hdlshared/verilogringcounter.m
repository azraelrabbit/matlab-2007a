function [hdlbody, hdlsignals] = verilogringcounter(counter_out, count, processName, leftright, phase, initValue, loadenb, loadvalue)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    hdlsequentialcontext(true);
    hdlsignals = [];
    % 12 14
    if lt(nargin, 3.0)
        msg = 'hdlringcounter should be called with at least three arguments, counter_out, count and processName.';
    else
        if eq(nargin, 3.0)
            leftright = 1.0;
            phase = -1.0;
            initValue = 1.0;
        else
            if eq(nargin, 4.0)
                phase = -1.0;
                initValue = 1.0;
            else
                if eq(nargin, 5.0)
                    initValue = 1.0;
                else
                    if eq(nargin, 7.0)
                        loadvalue = initValue;
                    end
                end
            end
        end
    end
    if lt(count, 2.0)
        error(generatemsgid('unsupportedarch'), 'HDL ring counter with width less than 2 is not supported.');
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
    hdlregsignal(counter_out);
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
        % 78 80
        asyncElsif = 'else begin\n';
        reset_body_spaces = 8.0;
    end
    % 82 84
    asyncbody = [];
    syncbody = [];
    % 85 87
    outname = hdlsignalname(counter_out);
    outsltype = hdlsignalsltype(counter_out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 89 91
    asyncbody = horzcat(asyncbody, spaces(reset_body_spaces), scalarAsyncBody(outname, int2str(1.0)));
    % 91 93
    if gt(outsize, 2.0)
        if eq(leftright, 1.0)
            if ge(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(2.0), 'if (', enablename, ' ==  1''b1', ') begin\n');
                syncbody = horzcat(syncbody, spaces(6.0), scalarAsyncBody(outname, hdlconstantvalue(loadvalue, outsize, outbp, outsigned)));
                syncbody = horzcat(syncbody, spaces(4.0), 'end\n');
                syncbody = horzcat(syncbody, spaces(4.0), 'else begin\n');
                syncbody = horzcat(syncbody, spaces(6.0), outname, ' <= {', outname, '[', num2str(minus(outsize, 2.0)), ' : 0], ', outname, '[', num2str(minus(outsize, 1.0)), ']};\n');
                syncbody = horzcat(syncbody, spaces(4.0), 'end\n');
            else
                syncbody = horzcat(syncbody, spaces(2.0), outname, ' <= {', outname, '[', num2str(minus(outsize, 2.0)), ' : 0], ', outname, '[', num2str(minus(outsize, 1.0)), ']};\n');
            end
        else
            if ge(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(2.0), 'if (', enablename, ' ==  1''b1', ') begin\n');
                syncbody = horzcat(syncbody, spaces(6.0), scalarAsyncBody(outname, hdlconstantvalue(loadvalue, outsize, outbp, outsigned)));
                syncbody = horzcat(syncbody, spaces(4.0), 'end\n');
                syncbody = horzcat(syncbody, spaces(4.0), 'else begin\n');
                syncbody = horzcat(syncbody, spaces(6.0), outname, ' <= {', outname, '[0], ', outname, '[', num2str(minus(outsize, 1.0)), ' : 1]};\n');
                syncbody = horzcat(syncbody, spaces(4.0), 'end\n');
            else
                syncbody = horzcat(syncbody, spaces(2.0), outname, ' <= {', outname, '[0], ', outname, '[', num2str(minus(outsize, 1.0)), ' : 1]};\n');
            end
        end
    else
        syncbody = horzcat(syncbody, spaces(2.0), outname, ' <= {', outname, '[0], ', outname, '[1]};\n');
    end
    % 121 124
    % 122 124
    if isempty(clockenablename)
        sync_statement = syncbody;
    else
        sync_statement = horzcat(spaces(8.0), horzcat('if (', clockenablename, ' == 1''b1) begin\n'), syncbody, spaces(8.0), 'end\n');
        % 127 130
        % 128 130
    end
    hdlbody = horzcat(spaces(2.0), sensList, spaces(4.0), 'begin: ', processName, '\n', spaces(6.0), asyncIf, asyncbody, spaces(6.0), 'end\n', spaces(6.0), asyncElsif, spaces(8.0), formatbody(sync_statement), spaces(6.0), 'end\n', spaces(4.0), 'end ', hdlgetparameter('comment_char'), ' ', processName, '\n\n');
    % 131 141
    % 132 141
    % 133 141
    % 134 141
    % 135 141
    % 136 141
    % 137 141
    % 138 141
    % 139 141
    hdlsequentialcontext(false);
    % 141 143
    if isscalar(phase)
        if ge(phase, 0.0)
            % 144 146
            [phase_name, phasenameIdx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
            hdlsignals = horzcat(hdlsignals, phasenameIdx);
            [assign_prefix, assign_op] = hdlassignforoutput(phasenameIdx);
            if isempty(clockenablename)
                decodebody = horzcat(spaces(2.0), assign_prefix, ' ', phase_name, ' ', assign_op, ' ', outname, '[', num2str(phase), '];\n\n');
            else
                decodebody = horzcat(spaces(2.0), assign_prefix, ' ', phase_name, ' ', assign_op, ' ', outname, '[', num2str(phase), ']  && ', clockenablename, ';\n\n');
                % 152 154
            end
            % 154 156
            hdlbody = horzcat(hdlbody, decodebody);
        end
    else
        if iscell(phase)
            for ii=1.0:length(phase)
                tmp_phase = cell2mat(phase(ii));
                [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(length(tmp_phase)))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                hdlsignals = horzcat(hdlsignals, idx);
                decodebody = [];
                [assign_prefix, assign_op] = hdlassignforoutput(idx);
                decodeheader = horzcat(spaces(2.0), assign_prefix, ' ', phase_name, ' ', assign_op);
                if isempty(clockenablename)
                    clkenableStr = '';
                else
                    clkenableStr = horzcat(' && ', clockenablename, ' == 1''b1');
                end
                if gt(length(tmp_phase), 1.0)
                    for ii=1.0:length(tmp_phase)
                        if eq(ii, 1.0)
                            decodebody = horzcat(decodeheader, ' (((', outname, '[', num2str(tmp_phase(ii)), '] == 1''b1)  ||\n');
                        else
                            if le(ii, minus(length(tmp_phase), 1.0))
                                decodebody = horzcat(decodebody, spaces(plus(length(decodeheader), 2.0)), ' (', outname, '[', num2str(tmp_phase(ii)), '] == 1''b1)  ||\n');
                            else
                                decodebody = horzcat(decodebody, spaces(plus(length(decodeheader), 2.0)), ' (', outname, '[', num2str(tmp_phase(ii)), '] == 1''b1))', clkenableStr, ')? 1 : 0;\n\n');
                            end
                        end
                    end % for
                    hdlbody = horzcat(hdlbody, decodebody);
                else
                    if isempty(clockenablename)
                        decodebody = horzcat(spaces(2.0), assign_prefix, ' ', phase_name, ' ', assign_op, ' ', outname, '[', num2str(tmp_phase), '];\n\n');
                    else
                        decodebody = horzcat(spaces(2.0), assign_prefix, ' ', phase_name, ' ', assign_op, ' ', outname, '[', num2str(tmp_phase), ']  && ', clockenablename, ';\n\n');
                    end
                    hdlbody = horzcat(hdlbody, decodebody);
                end
            end % for
        else
            if isvector(phase)
                for ii=1.0:length(phase)
                    if ge(phase(ii), 0.0)
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase(ii)))), processName, -1.0, 0.0, 0.0, 'wire', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        [assign_prefix, assign_op] = hdlassignforoutput(idx);
                        if isempty(clockenablename)
                            decodebody = horzcat(spaces(2.0), assign_prefix, ' ', phase_name, ' ', assign_op, ' ', outname, '[', num2str(phase(ii)), '];\n\n');
                        else
                            decodebody = horzcat(spaces(2.0), assign_prefix, ' ', phase_name, ' ', assign_op, ' ', outname, '[', num2str(phase(ii)), ']  && ', clockenablename, ';\n\n');
                        end
                        hdlbody = horzcat(hdlbody, decodebody);
                    end
                end % for
            else
                msg = 'This block function mode for hdlminmaxblock is not supported';
            end
        end
    end
end
function formatbody = formatbody(body)
    % 215 217
    formatbody = strrep(body, '\n\n', '\n');
    formatbody = strrep(formatbody, '\n', '\n      ');
end
function space = spaces(indent)
    space = mtimes(fix(' '), ones(1.0, indent));
end
function asyncbody = scalarAsyncBody(outname, ICstr)
    asyncbody = horzcat(outname, ' <= ', ICstr, ';\n');
end
function asyncbody = vectorAsyncBody(outname, k, ICstr)
    % 226 228
    array_deref = hdlgetparameter('array_deref');
    asyncbody = horzcat(outname, array_deref(1.0), num2str(k), array_deref(2.0), ' <= ', ICstr, ';\n');
end
