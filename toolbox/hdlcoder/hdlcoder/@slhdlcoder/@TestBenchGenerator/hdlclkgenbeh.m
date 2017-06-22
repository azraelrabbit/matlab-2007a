function hdlbody = hdlclkgenbeh(this, srcDone, snkDone, tb_enb, inports, outports)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlbody = [];
    % 7 9
    hdlbody = horzcat(hdlbody, this.insertComment({'System Clock (fast clock) and reset'}), '\n');
    % 9 12
    % 10 12
    hasoutput = 0.0;
    for i=1.0:length(outports)
        if ne(outports(i).SimulinkHandle, -1.0)
            hasoutput = 1.0;
        end % if
    end % for
    % 17 19
    hasinput = 0.0;
    for i=1.0:length(inports)
        if ne(inports(i).SimulinkHandle, -1.0)
            hasinput = 1.0;
        end % if
    end % for
    % 24 26
    if eq(this.ForceClock, 1.0)
        if hdlgetparameter('isvhdl')
            if eq(hasoutput, 1.0)
                endsignaltest = horzcat('    IF ', hdlsignalname(snkDone), ' = ''1'' THEN\n');
            else
                if eq(hasinput, 1.0)
                    endsignaltest = horzcat('    IF ', hdlsignalname(srcDone), ' = ''1'' THEN\n');
                else
                    error(generatemsgid('noinputandoutputerror'), 'Cannot generate test bench for this model. The model doesn''t have any inputs or outputs.');
                end % if
                % 35 37
            end % if
            hdlbody = horzcat(hdlbody, '  ', this.ClockName, '_gen: PROCESS\n', '  BEGIN\n', '    ', this.ClockName, ' <= ''1'';\n', '    WAIT FOR ', this.ClockName, '_high;\n', '    ', this.ClockName, ' <= ''0'';\n', '    WAIT FOR ', this.ClockName, '_low;\n', endsignaltest, '      ', this.ClockName, ' <= ''1'';\n', '      WAIT FOR ', this.ClockName, '_high;\n', '      ', this.ClockName, ' <= ''0'';\n', '      WAIT;\n', '    END IF;\n', '  END PROCESS ', this.ClockName, '_gen;\n\n');
        else
            % 39 51
            % 40 51
            % 41 51
            % 42 51
            % 43 51
            % 44 51
            % 45 51
            % 46 51
            % 47 51
            % 48 51
            % 49 51
            % 50 52
            if eq(hasoutput, 1.0)
                endsignaltest = horzcat('    if (', hdlsignalname(snkDone), ' == 1) begin\n');
            else
                if eq(hasinput, 1.0)
                    endsignaltest = horzcat('    if (', hdlsignalname(srcDone), ' == 1) begin\n');
                else
                    error(generatemsgid('noinputandoutputerror'), 'Cannot generate test bench for this model. The model doesn''t have any inputs or outputs.');
                end % if
            end % if
            hdlbody = horzcat(hdlbody, '  always  // clock generation\n', '  begin // ', this.ClockName, '_gen\n', '    ', this.ClockName, ' <= 1''b1;\n', '    # ', this.ClockName, '_high;\n', '    ', this.ClockName, ' <= 1''b0;\n', '    # ', this.ClockName, '_low;\n', endsignaltest, '      ', this.ClockName, ' <= 1''b1;\n', '      # ', this.ClockName, '_high;\n', '      ', this.ClockName, ' <= 1''b0;\n', '      $stop;\n', '    end\n', '  end  // ', this.ClockName, '_gen\n\n');
            % 61 74
            % 62 74
            % 63 74
            % 64 74
            % 65 74
            % 66 74
            % 67 74
            % 68 74
            % 69 74
            % 70 74
            % 71 74
            % 72 74
        end % if
        % 74 76
    end % if
end % function
