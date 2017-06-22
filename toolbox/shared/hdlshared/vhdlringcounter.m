function [hdlbody, hdlsignals] = vhdlringcounter(counter_out, count, processName, leftright, phase, initValue, loadenb, loadvalue)
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
    bdt = hdlgetparameter('base_data_type');
    hdlbody = [];
    hdlsignals = [];
    singlequote = char(39.0);
    % 15 17
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
        % 75 77
        if eq(hdlgetparameter('clock_rising_edge'), 0.0)
            asyncIf = horzcat('IF ', clockname, singlequote, 'event AND ', clockname, ' = ''1'' THEN\n');
        else
            % 79 81
            asyncIf = horzcat('IF ', 'rising_edge(', clockname, ') THEN\n');
        end
        % 82 85
        % 83 85
        asyncElsif = horzcat('IF ', resetname, ' = ''', num2str(hdlgetparameter('reset_asserted_level')), ''' THEN', '\n');
        % 85 89
        % 86 89
        % 87 89
        reset_body_spaces = 8.0;
    end
    % 90 92
    asyncbody = [];
    syncbody = [];
    % 93 95
    outname = hdlsignalname(counter_out);
    outsltype = hdlsignalsltype(counter_out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    asyncbody = horzcat(asyncbody, spaces(reset_body_spaces), scalarAsyncBody(outname, hdlconstantvalue(initValue, outsize, outbp, outsigned)));
    if gt(outsize, 2.0)
        if eq(leftright, 1.0)
            if ge(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(2.0), 'IF ', enablename, ' = ''1'' THEN\n');
                syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', hdlconstantvalue(loadvalue, outsize, outbp, outsigned), ';\n');
                syncbody = horzcat(syncbody, spaces(2.0), 'ELSE \n');
                syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', outname, '(', num2str(minus(outsize, 2.0)), ' DOWNTO 0) & ', outname, '(', num2str(minus(outsize, 1.0)), ');\n');
                syncbody = horzcat(syncbody, spaces(2.0), 'END IF;\n');
            else
                syncbody = horzcat(syncbody, spaces(2.0), outname, ' <= ', outname, '(', num2str(minus(outsize, 2.0)), ' DOWNTO 0) & ', outname, '(', num2str(minus(outsize, 1.0)), ');\n');
            end
        else
            if ge(nargin, 7.0)
                enablename = hdlsignalname(loadenb);
                syncbody = horzcat(syncbody, spaces(2.0), 'IF ', enablename, ' = ''1'' THEN\n');
                syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', hdlconstantvalue(loadvalue, outsize, outbp, outsigned), ';\n');
                syncbody = horzcat(syncbody, spaces(2.0), 'ELSE \n');
                syncbody = horzcat(syncbody, spaces(4.0), outname, ' <= ', outname, '(0) & ', outname, '(', num2str(minus(outsize, 1.0)), ' DOWNTO 1);\n');
                syncbody = horzcat(syncbody, spaces(2.0), 'END IF;\n');
            else
                syncbody = horzcat(syncbody, spaces(2.0), outname, ' <= ', outname, '(0) & ', outname, '(', num2str(minus(outsize, 1.0)), ' DOWNTO 1);\n');
            end
        end
    else
        syncbody = horzcat(syncbody, spaces(2.0), outname, ' <= ', outname, '(0) & ', outname, '(1);\n');
    end
    % 125 128
    % 126 128
    if eq(hdlgetparameter('async_reset'), 1.0)
        if isempty(clockenablename)
            sync_statement = horzcat(spaces(4.0), formatbody(syncbody), '\n');
        else
            sync_statement = horzcat(spaces(6.0), 'IF ', clockenablename, ' = ''1'' THEN\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
            % 132 135
            % 133 135
        end
        hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, asyncbody, spaces(4.0), asyncElsif, sync_statement, spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
    else
        % 137 144
        % 138 144
        % 139 144
        % 140 144
        % 141 144
        % 142 144
        % 143 145
        if isempty(clockenablename)
            sync_statement = horzcat(spaces(6.0), 'ELSE\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
        else
            % 147 149
            % 148 150
            sync_statement = horzcat(spaces(6.0), 'ELSIF ', clockenablename, ' = ''1'' THEN\n', spaces(6.0), formatbody(syncbody), 'END IF;\n');
            % 150 153
            % 151 153
        end
        hdlbody = horzcat(spaces(2.0), processName, ' : ', sensList, spaces(2.0), 'BEGIN\n', spaces(4.0), asyncIf, spaces(6.0), asyncElsif, asyncbody, sync_statement, spaces(4.0), 'END IF; \n', spaces(2.0), 'END PROCESS ', processName, ';\n\n');
        % 154 162
        % 155 162
        % 156 162
        % 157 162
        % 158 162
        % 159 162
        % 160 162
    end
    % 162 164
    hdlsequentialcontext(false);
    % 164 166
    if isscalar(phase)
        if ge(phase, 0.0)
            % 167 169
            [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
            hdlsignals = horzcat(hdlsignals, idx);
            % 170 172
            if isempty(clockenablename)
                decodebody = horzcat(spaces(2.0), phase_name, ' <= ', outname, '(', num2str(phase), ');\n\n');
            else
                decodebody = horzcat(spaces(2.0), phase_name, ' <= ', outname, '(', num2str(phase), ')  AND ', clockenablename, ';\n\n');
                % 175 177
            end
            hdlbody = horzcat(hdlbody, decodebody);
            % 178 180
        end
    else
        if iscell(phase)
            for i=1.0:length(phase)
                tmp_phase = cell2mat(phase(i));
                [phase_name, tmpIdx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(length(tmp_phase)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                hdlsignals = horzcat(hdlsignals, tmpIdx);
                decodebody = [];
                decodeheader = horzcat(spaces(2.0), phase_name, ' <= ''1'' WHEN  (((');
                if isempty(clockenablename)
                    clkenableStr = '';
                else
                    clkenableStr = horzcat('AND ', clockenablename, ' = ''1''');
                end
                if gt(length(tmp_phase), 1.0)
                    for ii=1.0:length(tmp_phase)
                        if eq(ii, 1.0)
                            decodebody = horzcat(decodeheader, outname, '(', num2str(tmp_phase(ii)), ') = ''1''', ')  OR\n');
                        else
                            if le(ii, minus(length(tmp_phase), 1.0))
                                decodebody = horzcat(decodebody, spaces(minus(length(decodeheader), 1.0)), '(', outname, '(', num2str(tmp_phase(ii)), ') = ''1''', ')  OR\n');
                            else
                                decodebody = horzcat(decodebody, spaces(minus(length(decodeheader), 1.0)), '(', outname, '(', num2str(tmp_phase(ii)), ') = ''1''', ')) ', clkenableStr, ') ELSE ''0'';\n\n');
                            end
                        end
                    end % for
                    hdlbody = horzcat(hdlbody, decodebody);
                else
                    if isempty(clockenablename)
                        decodebody = horzcat(spaces(2.0), phase_name, ' <= ', outname, '(', num2str(tmp_phase), ');\n\n');
                    else
                        decodebody = horzcat(spaces(2.0), phase_name, ' <= ', outname, '(', num2str(tmp_phase), ')  AND ', clockenablename, ';\n\n');
                    end
                    % 212 214
                    hdlbody = horzcat(hdlbody, decodebody);
                end
                % 215 217
            end % for
        else
            if isvector(phase)
                for i=1.0:length(phase)
                    if ge(phase(i), 0.0)
                        [phase_name, idx] = hdlnewsignal(hdllegalname(horzcat('phase_', num2str(phase(i)))), 'filter', -1.0, 0.0, 0.0, 'std_logic', 'boolean');
                        hdlsignals = horzcat(hdlsignals, idx);
                        % 223 225
                        if isempty(clockenablename)
                            decodebody = horzcat(spaces(2.0), phase_name, ' <= ', outname, '(', num2str(phase(i)), ');\n\n');
                        else
                            decodebody = horzcat(spaces(2.0), phase_name, ' <= ', outname, '(', num2str(phase(i)), ')  AND ', clockenablename, ';\n\n');
                            % 228 230
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
    % 240 243
    % 241 243
    formatbody = strrep(body, '\n\n', '\n');
    formatbody = strrep(formatbody, '\n', '\n      ');
end
function space = spaces(indent)
    space = mtimes(fix(' '), ones(1.0, indent));
end
function asyncbody = scalarAsyncBody(outname, ICstr)
    asyncbody = horzcat(outname, ' <= ', ICstr, ';\n');
end
