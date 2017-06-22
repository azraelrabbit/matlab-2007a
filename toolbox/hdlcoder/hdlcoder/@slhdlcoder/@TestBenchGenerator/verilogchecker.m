function hdlbody = verilogchecker(this, rdenb, addr, nxt_addr, instance, outRef, timeout, errCnt, clkrate, testFailure)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlbody = [];
    time_out = hdlsignalname(timeout);
    enb = hdlsignalname(rdenb);
    tstFailed = hdlsignalname(testFailure);
    % 11 12
    severitylevel = '';
    severitylevel_msg = 'ERROR';
    timeout_severitylevel = '        $stop;\n';
    % 15 16
    if eq(this.ForceResetValue, 0.0)
        resetedge = 'negedge';
    else
        resetedge = 'posedge';
    end % if
    % 21 22
    timeout_err_msg = '        $display ("Error: Timeout - Data not received for ';
    % 23 24
    vecsize = this.OutPortSnk(instance).VectorPortSize;
    % 25 26
    if gt(vecsize, 1.0)
        % 27 28
        hdlbody = horzcat(hdlbody, '  always @ (posedge ', this.ClockName, ' or ', resetedge, ' ', this.ResetName, ') // checker_', this.OutportSnk(instance).loggingPortName, '\n', '  begin\n', '    if (', this.ResetName, ' == ', sprintf('%d', this.ForceResetValue), ') begin \n', '      ', time_out, ' <= 0;\n', '      ', tstFailed, ' <= 0;\n');
        % 29 36
        % 30 36
        % 31 36
        % 32 36
        % 33 36
        % 34 36
        % 35 36
        for i=1.0:vecsize
            eCnt = hdlsignalname(errCnt(i));
            out_ref = hdlsignalname(outRef(i));
            if eq(this.OutportSnk(instance).dataIsConstant, 0.0)
                ref = horzcat('_', num2str(i), '_expected[', hdlsignalname(nxt_addr), ']');
            else
                ref = horzcat('_', num2str(i), '_expected');
            end % if
            % 44 46
            % 45 46
            hdlbody = horzcat(hdlbody, '      ', eCnt, ' <= 0;\n', '      ', out_ref, ' <= ', this.OutportSnk(instance).loggingPortName, ref, ';\n');
            % 47 49
            % 48 49
        end % for
        % 50 53
        % 51 53
        % 52 53
        clear('ref', 'eCnt', 'out_ref');
        % 54 56
        % 55 56
        hdlbody = horzcat(hdlbody, '    end \n', '    else begin \n', '      if (', enb, ' == 1) begin \n', '        ', time_out, ' <= 0;\n');
        % 57 62
        % 58 62
        % 59 62
        % 60 62
        % 61 62
        for i=1.0:vecsize
            out_ref = hdlsignalname(outRef(i));
            if eq(this.OutportSnk(instance).dataIsConstant, 0.0)
                ref = horzcat('_', num2str(i), '_expected[', hdlsignalname(nxt_addr), ']');
            else
                ref = horzcat('_', num2str(i), '_expected');
            end % if
            % 69 70
            hdlbody = horzcat(hdlbody, '        ', out_ref, ' <= ', this.OutportSnk(instance).loggingPortName, ref, ';\n');
            % 71 72
        end % for
        % 73 76
        % 74 76
        % 75 76
        clear('ref', 'out_ref');
        % 77 78
        hdlbody = horzcat(hdlbody, '\n');
        % 79 81
        % 80 81
        for i=1.0:vecsize
            signame = this.OutportSnk(instance).HDLPortName{1.0}{i};
            idx = hdlsignalfindname(signame);
            portvtype = hdlsignalvtype(idx);
            portsltype = hdlsignalsltype(idx);
            [portsize, portbp, portsigned] = hdlgetsizesfromtype(portsltype);
            eCnt = hdlsignalname(errCnt(i));
            % 88 89
            if eq(this.OutportSnk(instance).dataIsConstant, 0.0)
                expected = horzcat('_', num2str(i), '_expected[', hdlsignalname(addr), ']');
            else
                expected = horzcat('_', num2str(i), '_expected');
            end % if
            % 94 96
            % 95 96
            if eq(portsize, 0.0)
                testfailure = horzcat('abs_real($bitstoreal(', signame, ') - ', this.OutportSnk(instance).loggingPortName, expected, ') > 1.0e-9');
                % 98 99
                display = horzcat('           $display("', severitylevel_msg, ' in ', signame, ' at time %%t : Expected ''%%f'' Actual ''%%f''", \n', '                    $time, ', this.OutportSnk(instance).loggingPortName, expected, ', $bitstoreal(', signame, '));\n');
            else
                % 101 103
                % 102 103
                % 103 104
                testfailure = horzcat(signame, ' !== ', this.OutportSnk(instance).loggingPortName, expected);
                % 105 106
                display = horzcat('           $display("', severitylevel_msg, ' in ', signame, ' at time %%t : Expected ''%%h'' Actual ''%%h''", \n', '                    $time, ', this.OutportSnk(instance).loggingPortName, expected, ', ', signame, ');\n');
                % 107 110
                % 108 110
                % 109 110
            end % if
            % 111 112
            assert_section = horzcat('        if (', testfailure, ') begin\n', '           ', eCnt, ' <= ', eCnt, ' + 1;\n', '           ', tstFailed, ' <= 1;\n', display, severitylevel, '           if (', eCnt, ' >= MAX_ERROR_COUNT) \n', '             $display("Warning: Number of errors for ', signame, ' have exceeded the maximum error limit");\n', '        end\n\n');
            % 113 121
            % 114 121
            % 115 121
            % 116 121
            % 117 121
            % 118 121
            % 119 121
            % 120 121
            hdlbody = horzcat(hdlbody, assert_section);
        end % for
        % 123 126
        % 124 126
        % 125 126
        clear('signame', 'idx', 'portvtype', 'expected', 'testfailure', 'assert_section');
        % 127 128
        hdlbody = horzcat(hdlbody, '      end\n', '      else if (', time_out, ' > MAX_TIMEOUT) begin \n', '        ', eCnt, ' <= ', eCnt, ' + 1;\n', '        ', tstFailed, ' <= 1;\n', timeout_err_msg, this.OutportSnk(instance).loggingPortName, '.");\n', timeout_severitylevel, '      end\n', '      else\n', '        ', time_out, ' <= ', time_out, ' + 1 ;\n', '    end\n', '  end // checker_', this.OutportSnk(instance).loggingPortName, '\n\n');
    else
        % 130 141
        % 131 141
        % 132 141
        % 133 141
        % 134 141
        % 135 141
        % 136 141
        % 137 141
        % 138 141
        % 139 141
        % 140 141
        % 141 142
        eCnt = hdlsignalname(errCnt);
        out_ref = hdlsignalname(outRef);
        % 144 145
        if eq(this.OutportSnk(instance).dataIsConstant, 0.0)
            expected = horzcat('_expected[', hdlsignalname(addr), ']');
            ref = horzcat('_expected[', hdlsignalname(nxt_addr), ']');
        else
            expected = '_expected';
            ref = '_expected';
        end % if
        % 152 153
        signame = this.OutportSnk(instance).HDLPortName;
        idx = hdlsignalfindname(signame{1.0});
        portsltype = hdlsignalsltype(idx);
        [portsize, portbp, portsigned] = hdlgetsizesfromtype(portsltype);
        % 157 158
        if eq(portsize, 0.0)
            testfailure = horzcat('abs_real($bitstoreal(', signame{1.0}, ') - ', this.OutportSnk(instance).loggingPortName, expected, ') > 1.0e-9');
            % 160 161
            display = horzcat('               $display("', severitylevel_msg, '  in ', signame{1.0}, ' at time %%t : Expected ''%%f'' Actual ''%%f''", \n', '                        $time, ', this.OutportSnk(instance).loggingPortName, expected, ', $bitstoreal(', signame{1.0}, '));\n');
        else
            % 163 165
            % 164 165
            % 165 166
            testfailure = horzcat(signame{1.0}, ' !== ', this.OutportSnk(instance).loggingPortName, expected);
            % 167 168
            display = horzcat('               $display("', severitylevel_msg, '  in ', signame{1.0}, ' at time %%t : Expected ''%%h'' Actual ''%%h''", \n', '                        $time, ', this.OutportSnk(instance).loggingPortName, expected, ', ', signame{1.0}, ');\n');
            % 169 172
            % 170 172
            % 171 172
        end % if
        % 173 174
        assert_section = horzcat('            if (', testfailure, ') begin\n', '               ', eCnt, ' <= ', eCnt, ' + 1;\n', '               ', tstFailed, ' <= 1;\n', display, severitylevel, '               if (', eCnt, ' >= MAX_ERROR_COUNT) \n', '                $display("Warning: Number of errors for ', signame{1.0}, ' have exceeded the maximum error limit");\n', '             end\n');
        % 175 183
        % 176 183
        % 177 183
        % 178 183
        % 179 183
        % 180 183
        % 181 183
        % 182 183
        hdlbody = horzcat(hdlbody, '  always @ (posedge ', this.ClockName, ' or ', resetedge, ' ', this.ResetName, ') // checker_', this.OutportSnk(instance).loggingPortName, '\n', '  begin\n', '    if (', this.ResetName, ' == ', sprintf('%d', this.ForceResetValue), ') begin \n', '      ', time_out, ' <= 0;\n', '      ', eCnt, ' <= 0;\n', '      ', tstFailed, ' <= 0;\n', '      ', out_ref, ' <= ', this.OutportSnk(instance).loggingPortName, ref, ';\n', '    end \n', '    else begin \n');
        % 184 194
        % 185 194
        % 186 194
        % 187 194
        % 188 194
        % 189 194
        % 190 194
        % 191 194
        % 192 194
        % 193 194
        hdlbody = horzcat(hdlbody, '      if (', enb, ' == 1) begin \n', '        ', time_out, ' <= 0;\n', '        ', out_ref, ' <= ', this.OutportSnk(instance).loggingPortName, ref, ';\n', assert_section, '      end\n', '      else if (', time_out, ' > MAX_TIMEOUT) begin \n', '        ', eCnt, ' <= ', eCnt, ' + 1;\n', '        ', tstFailed, ' <= 1;\n', timeout_err_msg, this.OutportSnk(instance).loggingPortName, '.");\n', timeout_severitylevel, '      end\n', '      else\n', '        ', time_out, ' <= ', time_out, ' + 1 ;\n', '    end\n', '  end // checker_', this.OutportSnk(instance).loggingPortName, '\n\n');
        % 195 210
        % 196 210
        % 197 210
        % 198 210
        % 199 210
        % 200 210
        % 201 210
        % 202 210
        % 203 210
        % 204 210
        % 205 210
        % 206 210
        % 207 210
        % 208 210
        % 209 210
    end % if
end % function
