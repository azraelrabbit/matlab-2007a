function [hdlbody, hdlsignals] = vhdlcounter(counter_out, count, processName, updown, initValue, phase, phaseRegOut, loadenb, loadvalue)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    hdlsequentialcontext(true);
    bdt = hdlgetparameter('base_data_type');
    hdlbody = [];
    hdlsignals = [];
    singlequote = char(39.0);
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
    if eq(hdlgetparameter('async_reset'), 1.0)
        sensList = horzcat('PROCESS (', clockname, ', ', resetname, ')\n');
        asyncIf = horzcat('IF ', resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), ''' THEN', '\n');
        if eq(hdlgetparameter('clock_rising_edge'), 0.0)
            asyncElsif = horzcat('ELSIF ', clockname, singlequote, 'event AND ', clockname, ' = ''1'' THEN\n');
        else
            asyncElsif = horzcat('ELSIF ', 'rising_edge(', clockname, ') THEN\n');
        end % if
        reset_body_spaces = 6.0;
    else
        sensList = horzcat('PROCESS (', clockname, ')\n');
        if eq(hdlgetparameter('clock_rising_edge'), 0.0)
            asyncIf = horzcat('IF ', clockname, singlequote, 'event AND ', clockname, ' = ''1'' THEN\n');
        else
            asyncIf = horzcat('IF ', 'rising_edge(', clockname, ') THEN\n');
        end % if
        % 97 100
        % 98 100
        asyncElsif = horzcat('IF ', resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), ''' THEN', '\n');
        % 100 104
        % 101 104
        % 102 104
        reset_body_spaces = 8.0;
    end % if
    % 105 107
    asyncbody = [];
    syncbody = [];
    % 108 110
    outname = hdlsignalname(counter_out);
    outsltype = hdlsignalsltype(counter_out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    asyncbody = horzcat(asyncbody, spaces(reset_body_spaces), scalarAsyncBody(outname, hdlconstantvalue(initValue, outsize, outbp, outsigned, 'noaggregate')));
    if gt(outsize, 1.0) || eq(outsigned, 1.0)
        if eq(updown, 1.0)
            if gt(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(2.0), 'IF ', enablename, ' = ''1'' THEN\n');
                syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', hdlconstantvalue(loadvalue, outsize, outbp, outsigned, 'noaggregate'), ';\n');
                syncbody = horzcat(syncbody, spaces(2.0), 'ELSIF ', outname, ' = ', hdlconstantvalue(minus(count, 1.0), outsize, outbp, outsigned, 'noaggregate'), ' THEN\n');
            else
                syncbody = horzcat(syncbody, spaces(2.0), 'IF ', outname, ' = ', hdlconstantvalue(minus(count, 1.0), outsize, outbp, outsigned, 'noaggregate'), ' THEN\n');
            end % if
            syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', hdlconstantvalue(0.0, outsize, outbp, outsigned, 'noaggregate'), ';\n');
            syncbody = horzcat(syncbody, spaces(2.0), 'ELSE\n');
            syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', outname, ' + 1;\n');
            syncbody = horzcat(syncbody, spaces(2.0), 'END IF;\n');
        else
            if gt(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(2.0), 'IF ', enablename, ' = ''1'' THEN\n');
                syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', hdlconstantvalue(loadvalue, outsize, outbp, outsigned, 'noaggregate'), ';\n');
                syncbody = horzcat(syncbody, spaces(2.0), 'ELSIF ', outname, ' = 0 THEN\n');
            else
                syncbody = horzcat(syncbody, spaces(2.0), 'IF ', outname, ' = 0 THEN\n');
            end % if
            syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', hdlconstantvalue(minus(count, 1.0), outsize, outbp, outsigned, 'noaggregate'), ';\n');
            syncbody = horzcat(syncbody, spaces(2.0), 'ELSE\n');
            syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', outname, ' - 1;\n');
            syncbody = horzcat(syncbody, spaces(2.0), 'END IF;\n');
        end % if
    else
        syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= NOT ', outname, ';\n');
    end % if
    % 144 147
    % 145 147
    if eq(hdlgetparameter('async_reset'), 1.0)
        if isempty(clockenablename)
            sync_statement = horzcat(spaces(4.0), formatbody(syncbody), '\n');
        else
            sync_statement = horzcat(spaces(6.0), 'IF ', clockenablename, ' = ''1'' THEN\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
            % 151 154
            % 152 154
        end % if
        hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, asyncbody, spaces(4.0), asyncElsif, sync_statement, spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
    else
        % 156 163
        % 157 163
        % 158 163
        % 159 163
        % 160 163
        % 161 163
        % 162 164
        if isempty(clockenablename)
            sync_statement = horzcat(spaces(6.0), 'ELSE\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
        else
            % 166 168
            % 167 169
            sync_statement = horzcat(spaces(6.0), 'ELSIF ', clockenablename, ' = ''1'' THEN\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
            % 169 172
            % 170 172
        end % if
        hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, spaces(6.0), asyncElsif, asyncbody, sync_statement, spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
        % 173 181
        % 174 181
        % 175 181
        % 176 181
        % 177 181
        % 178 181
        % 179 181
    end % if
    % 181 183
    hdlsequentialcontext(false);
    % 183 185
    if iscell(phase)
        for i=1.0:length(phase)
            tmp_phase = cell2mat(phase(i));
            if eq(phaseRegOut, -1.0)
                [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(length(tmp_phase)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                hdlsignals = horzcat(hdlsignals, idx);
                tmpname = phase_name;
                tmpidx = idx;
            else
                [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(length(tmp_phase)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                hdlsignals = horzcat(hdlsignals, idx);
                [tmpphase, tmpidx] = hdlnewsignal(hdllegalname(horzcat('phase_tmp', num2str(length(tmp_phase)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                hdlsignals = horzcat(hdlsignals, tmpidx);
                [tmpbody, tmpsignal] = vhdlunitdelay(tmpidx, idx, hdluniqueprocessname, 0.0);
                hdlsignals = horzcat(hdlsignals, tmpsignal);
                hdlbody = horzcat(hdlbody, tmpbody);
                for ii=1.0:length(tmp_phase)
                    if eq(tmp_phase(ii), 0.0)
                        tmp_phase(ii) = minus(count, 1.0);
                    else
                        tmp_phase(ii) = minus(tmp_phase(ii), 1.0);
                    end % if
                end % for
            end % if
            decodebody = [];
            decodeheader = horzcat(spaces(2.0), tmpname, ' <= ''1'' WHEN  (((');
            if isempty(clockenablename)
                clkenableStr = '';
            else
                clkenableStr = horzcat('AND ', clockenablename, ' = ''1''');
            end % if
            if gt(length(tmp_phase), 1.0)
                for ii=1.0:length(tmp_phase)
                    if eq(ii, 1.0)
                        decodebody = horzcat(decodeheader, outname, ' = ', hdlconstantvalue(tmp_phase(ii), outsize, outbp, outsigned, 'noaggregate'), ')  OR\n');
                    else
                        if le(ii, minus(length(tmp_phase), 1.0))
                            decodebody = horzcat(decodebody, spaces(minus(length(decodeheader), 1.0)), '(', outname, ' = ', hdlconstantvalue(tmp_phase(ii), outsize, outbp, outsigned, 'noaggregate'), ')  OR\n');
                        else
                            decodebody = horzcat(decodebody, spaces(minus(length(decodeheader), 1.0)), '(', outname, ' = ', hdlconstantvalue(tmp_phase(ii), outsize, outbp, outsigned, 'noaggregate'), ')) ', clkenableStr, ') ELSE ''0'';\n\n');
                        end % if
                    end % if
                end % for
                hdlbody = horzcat(hdlbody, decodebody);
            else
                if isempty(clockenablename)
                    decodebody = horzcat(spaces(2.0), tmpname, ' <= ''1'' WHEN ', outname, ' = ', hdlconstantvalue(tmp_phase, outsize, outbp, outsigned, 'noaggregate'), ' ELSE ''0'';\n\n');
                else
                    % 232 234
                    decodebody = horzcat(spaces(2.0), tmpname, ' <= ''1'' WHEN ', outname, ' = ', hdlconstantvalue(tmp_phase, outsize, outbp, outsigned, 'noaggregate'), ' AND ', clockenablename, ' = ''1'' ELSE ''0'';\n\n');
                    % 234 236
                end % if
                hdlbody = horzcat(hdlbody, decodebody);
            end % if
            % 238 240
        end % for
    else
        if isvector(phase)
            for i=1.0:length(phase)
                if ge(phase(i), 0.0)
                    if eq(phaseRegOut, -1.0)
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase(i)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        tmpname = phase_name;
                        tmpidx = idx;
                    else
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase(i)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        [tmpname, tmpidx] = hdlnewsignal(hdllegalname(horzcat('phase_tmp', num2str(phase(i)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                        hdlsignals = horzcat(hdlsignals, tmpidx);
                        [tmpbody, tmpsignal] = vhdlunitdelay(tmpidx, idx, hdluniqueprocessname, 0.0);
                        hdlsignals = horzcat(hdlsignals, tmpsignal);
                        hdlbody = horzcat(hdlbody, tmpbody);
                        if eq(phase(i), 0.0)
                            phase(i) = minus(count, 1.0);
                        else
                            phase(i) = minus(phase(i), 1.0);
                        end % if
                    end % if
                    % 263 265
                    if isempty(clockenablename)
                        decodebody = horzcat(spaces(2.0), tmpname, ' <= ''1'' WHEN ', outname, ' = ', hdlconstantvalue(phase(i), outsize, outbp, outsigned, 'noaggregate'), ' ELSE ''0'';\n\n');
                    else
                        % 267 269
                        decodebody = horzcat(spaces(2.0), tmpname, ' <= ''1'' WHEN ', outname, ' = ', hdlconstantvalue(phase(i), outsize, outbp, outsigned, 'noaggregate'), ' AND ', clockenablename, ' = ''1'' ELSE ''0'';\n\n');
                        % 269 271
                    end % if
                    hdlbody = horzcat(hdlbody, decodebody);
                end % if
            end % for
        else
            if isscalar(phase)
                if ge(phase, 0.0)
                    if eq(phaseRegOut, -1.0)
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        tmpname = phase_name;
                        tmpidx = idx;
                    else
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        [tmpname, tmpidx] = hdlnewsignal(hdllegalname(horzcat('phase_tmp', num2str(phase))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                        hdlsignals = horzcat(hdlsignals, tmpidx);
                        [tmpbody, tmpsignal] = vhdlunitdelay(tmpidx, idx, hdluniqueprocessname, 0.0);
                        hdlsignals = horzcat(hdlsignals, tmpsignal);
                        hdlbody = horzcat(hdlbody, tmpbody);
                        if eq(phase, 0.0)
                            phase = minus(count, 1.0);
                        else
                            phase = minus(phase, 1.0);
                        end % if
                    end % if
                    % 296 298
                    if isempty(clockenablename)
                        decodebody = horzcat(spaces(2.0), tmpname, ' <= ''1'' WHEN ', outname, ' = ', hdlconstantvalue(phase, outsize, outbp, outsigned, 'noaggregate'), ' ELSE ''0'';\n\n');
                    else
                        % 300 302
                        decodebody = horzcat(spaces(2.0), tmpname, ' <= ''1'' WHEN ', outname, ' = ', hdlconstantvalue(phase, outsize, outbp, outsigned, 'noaggregate'), ' AND ', clockenablename, ' = ''1'' ELSE ''0'';\n\n');
                        % 302 304
                    end % if
                    hdlbody = horzcat(hdlbody, decodebody);
                    % 305 307
                end % if
            else
                msg = 'This block function mode for hdlminmaxblock is not supported';
            end % if
        end % if
    end % if
end % function
function formatbody = formatbody(body)
    % 314 317
    % 315 317
    formatbody = strrep(body, '\n\n', '\n');
    formatbody = strrep(formatbody, '\n', '\n      ');
end % function
function space = spaces(indent)
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
function asyncbody = scalarAsyncBody(outname, ICstr)
    asyncbody = horzcat(outname, ' <= ', ICstr, ';\n');
end % function
