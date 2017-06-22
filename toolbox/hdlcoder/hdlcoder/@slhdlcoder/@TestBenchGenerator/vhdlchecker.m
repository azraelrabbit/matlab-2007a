function hdlbody = vhdlchecker(this, rdenb, addr, nxt_addr, instance, outRef, timeout, errCnt, clkrate, testFailure)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlbody = [];
    time_out = hdlsignalname(timeout);
    enb = hdlsignalname(rdenb);
    eCnt = hdlsignalname(errCnt);
    out_ref = hdlsignalname(outRef);
    tstFailed = hdlsignalname(testFailure);
    % 12 14
    [toutsz, toutbp, toutsi] = hdlgetsizesfromtype(hdlsignalsltype(timeout));
    % 14 16
    severitylevel = 'ERROR';
    % 16 19
    % 17 19
    ref_data = [];
    ref_data0 = [];
    ref_dataR = [];
    assert_section = [];
    % 22 24
    timeout_err_msg = '        ASSERT FALSE\n          REPORT "Timeout: Data is not received after timeout."\n          SEVERITY FAILURE ;\n';
    % 24 27
    % 25 27
    if eq(this.OutportSnk(instance).dataIsConstant, 0.0)
        expected = horzcat('_expected(TO_INTEGER(', hdlsignalname(addr), '))');
        ref = horzcat('_expected(TO_INTEGER(', hdlsignalname(nxt_addr), '))');
    else
        expected = '_expected';
        ref = '_expected';
    end % if
    % 33 35
    signame = this.OutportSnk(instance).HDLPortName;
    idx = hdlsignalfindname(signame{1.0});
    portvtype = hdlsignalvtype(idx);
    % 37 39
    if strcmpi(portvtype, 'real')
        testfailure = horzcat('abs( ', signame{1.0}, ' - ', this.OutportSnk(instance).loggingPortName, expected, ') > 1.0e-9');
    else
        if strfind(portvtype, 'vector_of_real')
            testfailure = horzcat('NOT(isEqual(', signame{1.0}, ', ', this.OutportSnk(instance).loggingPortName, expected, '))');
        else
            testfailure = horzcat(signame{1.0}, ' /= ', this.OutportSnk(instance).loggingPortName, expected);
        end % if
        % 46 48
    end % if
    assert_section = horzcat(assert_section, '        IF ', testfailure, ' THEN\n', '          ', eCnt, ' <= ', eCnt, ' + 1;\n', '          ', tstFailed, ' <= ''1'';\n', '          ASSERT FALSE \n', '            REPORT "Error in ', signame{1.0}, ': Expected " \n', '            & to_hex(');
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    assert_section = horzcat(assert_section, this.OutportSnk(instance).loggingPortName, expected, ')\n');
    % 55 57
    assert_section = horzcat(assert_section, '            & " Actual "\n', '            & to_hex(', signame{1.0}, ')\n', '            SEVERITY ', severitylevel, ';\n', '          IF ', eCnt, ' >= MAX_ERROR_COUNT THEN\n', '            ASSERT FALSE\n', '              REPORT "Number of errors exceed the maximum error"\n', '              SEVERITY Warning;\n', '          END IF;\n', '        END IF;\n');
    % 57 68
    % 58 68
    % 59 68
    % 60 68
    % 61 68
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    hdlbody = horzcat(hdlbody, '  checker_', num2str(instance), ': PROCESS(', this.ClockName, ', ', this.ResetName, ')\n', '  BEGIN\n', '    IF ', this.ResetName, ' = ', sprintf('''%d''', this.ForceResetValue), ' THEN\n', '      ', time_out, ' <= 0;\n', '      ', eCnt, ' <= 0;\n', '      ', tstFailed, ' <= ''0'';\n', '      ', out_ref, ' <= ', this.OutportSnk(instance).loggingPortName, ref, ';\n', '    ELSIF ', this.ClockName, '''event and ', this.ClockName, ' =''1'' THEN\n');
    % 68 77
    % 69 77
    % 70 77
    % 71 77
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    hdlbody = horzcat(hdlbody, '      IF ', enb, ' = ''1'' THEN\n', '        ', time_out, ' <= 0;\n', '        ', out_ref, ' <= ', this.OutportSnk(instance).loggingPortName, ref, ';\n', assert_section, '      ELSIF ', time_out, ' > MAX_TIMEOUT THEN\n', '        ', eCnt, ' <= ', eCnt, ' + 1;\n', '        ', tstFailed, ' <= ''1'';\n', timeout_err_msg, '      ELSE\n', '        ', time_out, ' <= ', time_out, ' + 1 ;\n', '      END IF;\n', '    END IF;\n', '  END PROCESS checker_', num2str(instance), ';\n');
    % 77 90
    % 78 90
    % 79 90
    % 80 90
    % 81 90
    % 82 90
    % 83 90
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
end % function
