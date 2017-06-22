function hdlbody = hdlclkenbgenbeh(this, srcDone, snkDone, tb_enb, testFailure, inports, outports)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlbody = [];
    assert_section = [];
    hdlbody = horzcat(hdlbody, this.insertComment({'Driving the test bench enable'}), '\n');
    % 9 13
    % 10 13
    % 11 13
    hasoutput = false;
    for i=1.0:length(outports)
        if ne(outports(i).SimulinkHandle, -1.0)
            hasoutput = true;
        end
    end % for
    % 18 20
    hasinput = false;
    for i=1.0:length(inports)
        if ne(inports(i).SimulinkHandle, -1.0)
            hasinput = true;
        end
    end % for
    % 25 27
    if eq(this.ForceClock, 1.0)
        if hdlgetparameter('isvhdl')
            resetassertedval = sprintf('''%d''', this.ForceResetValue);
            clkdisablevalue = sprintf('''%d''', 0.0);
            testFailureresetvalue = sprintf('''%d''', 0.0);
            clkenablevalue = sprintf('''%d''', 1.0);
            assert_section = horzcat(assert_section, '        IF (', hdlsignalname(testFailure), ' = ''0'' ) THEN\n', '              ASSERT FALSE\n', '                REPORT "**************TEST COMPLETED (PASSED)**************"\n', '                SEVERITY NOTE;\n', '        ELSE\n', '              ASSERT FALSE\n', '                REPORT "**************TEST COMPLETED (FAILED)**************"\n', '                SEVERITY NOTE;\n', '        END IF;\n');
            % 33 43
            % 34 43
            % 35 43
            % 36 43
            % 37 43
            % 38 43
            % 39 43
            % 40 43
            % 41 43
            if eq(hasoutput, 1.0)
                endsignaltest = horzcat(hdlsignalname(snkDone), ' = ''1'' ');
            else
                if eq(hasinput, 1.0)
                    endsignaltest = horzcat(hdlsignalname(srcDone), ' = ''1'' ');
                else
                    not(hasoutput) && not(hasinput)
                    error(generatemsgid('noinputandoutputerror'), 'Cannot generate test bench for this model. The model doesn''t have any inputs or outputs.');
                end
            end
            hdlbody = horzcat(hdlbody, '  ', hdlsignalname(tb_enb), '_gen: PROCESS (', this.ClockName, ',', this.ResetName, ')\n', '  BEGIN\n', '    IF (', this.ResetName, ' = ', resetassertedval, ') THEN \n', '      ', hdlsignalname(testFailure), ' <= ', testFailureresetvalue, ';\n', '      ', hdlsignalname(tb_enb), ' <= ', clkdisablevalue, ';\n', '    ELSIF ', this.ClockName, '''event AND ', this.ClockName, ' = ''1'' THEN\n', '      ', hdlsignalname(tb_enb), ' <= ', clkenablevalue, ';\n', '      IF ', endsignaltest, ' THEN\n', '        ', hdlsignalname(tb_enb), ' <= ', clkdisablevalue, ';\n', assert_section, '      END IF;\n', '    END IF;\n', '  END PROCESS ', hdlsignalname(tb_enb), '_gen;\n\n');
        else
            % 54 65
            % 55 65
            % 56 65
            % 57 65
            % 58 65
            % 59 65
            % 60 65
            % 61 65
            % 62 65
            % 63 65
            % 64 66
            clkdisablevalue = sprintf('%d', 0.0);
            clkenablevalue = sprintf('%d', 1.0);
            testFailureresetvalue = sprintf('%d', 0.0);
            rassertval = horzcat('1''b', num2str(this.ForceResetValue));
            assert_section = horzcat(assert_section, '        if (', hdlsignalname(testFailure), ' == 0 ) \n', '              $display("**************TEST COMPLETED (PASSED)**************");\n', '        else\n', '              $display("**************TEST COMPLETED (FAILED)**************");\n');
            % 70 79
            % 71 79
            % 72 79
            % 73 79
            % 74 79
            % 75 79
            % 76 79
            % 77 79
            if not(hasoutput) && not(hasinput)
                error(generatemsgid('noinputandoutputerror'), 'Cannot generate test bench for this model. The model doesn''t have any inputs or outputs.');
            else
                if not(hasoutput)
                    endsignaltest = horzcat(hdlsignalname(srcDone), ' == 1');
                else
                    if not(hasinput)
                        endsignaltest = horzcat(hdlsignalname(snkDone), ' == 1');
                    else
                        endsignaltest = horzcat(hdlsignalname(srcDone), ' == 1 && ', hdlsignalname(snkDone), ' == 1');
                    end
                end
            end
            if eq(this.ForceResetValue, 0.0)
                resetedge = 'negedge';
                resetinv = '~';
            else
                resetedge = 'posedge';
                resetinv = '';
            end
            hdlbody = horzcat(hdlbody, '  always @(posedge ', this.ClockName, ' or ', resetedge, ' ', this.ResetName, ') //', hdlsignalname(tb_enb), '_gen\n', '  begin\n', '    if (', resetinv, this.ResetName, ') begin \n', '      ', hdlsignalname(testFailure), ' <= ', testFailureresetvalue, ';\n', '      ', hdlsignalname(tb_enb), ' <= ', clkdisablevalue, ';\n', '    end \n', '    else begin \n', '      if (', endsignaltest, ') begin\n', '        ', hdlsignalname(tb_enb), ' <= ', clkdisablevalue, ';\n', assert_section, '      end\n', '      else\n', '        ', hdlsignalname(tb_enb), ' <= ', clkenablevalue, ';\n', '    end\n', '  end //', hdlsignalname(tb_enb), '_gen;\n\n');
            % 99 113
            % 100 113
            % 101 113
            % 102 113
            % 103 113
            % 104 113
            % 105 113
            % 106 113
            % 107 113
            % 108 113
            % 109 113
            % 110 113
            % 111 113
        end
        % 113 115
    end
end
