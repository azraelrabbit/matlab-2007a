function hdlbody = hdlresetgenbeh(this, clkrate)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlbody = [];
    default_reset_wait = 2.0;
    % 9 10
    tend = plus(mtimes(mtimes(default_reset_wait, clkrate), plus(this.ForceClockLowTime, this.ForceClockHighTime)), this.ForceHoldTime);
    if eq(this.ForceReset, 1.0)
        % 12 13
        if hdlgetparameter('isvhdl')
            rassertval = sprintf('''%d''', this.ForceResetValue);
            rdeassertval = sprintf('''%d''', minus(1.0, this.ForceResetValue));
            % 16 17
            hdlbody = horzcat(hdlbody, '  ', this.ResetName, '_gen: PROCESS\n', '  BEGIN\n', '    ', this.ResetName, ' <= ', rassertval, ';\n', '    WAIT FOR ', this.ClockName, '_period * ', num2str(default_reset_wait), ' * CLKRATE + ', this.ClockName, '_hold;\n', '    ', this.ResetName, ' <= ', rdeassertval, ';\n', '    WAIT;\n', '  END PROCESS ', this.ResetName, '_gen;\n\n');
        else
            % 19 25
            % 20 25
            % 21 25
            % 22 25
            % 23 25
            % 24 25
            % 25 26
            rassertval = horzcat('1''b', num2str(this.ForceResetValue));
            rdeassertval = horzcat('1''b', num2str(minus(1.0, this.ForceResetValue)));
            clkenvalue = this.ForceClockEnableValue;
            tcycle = plus(this.ForceClockLowTime, this.ForceClockHighTime);
            hdlbody = horzcat(hdlbody, '  initial  // reset block\n', '  begin // ', this.ResetName, '_gen\n', '    ', this.ResetName, ' <= ', rassertval, ';\n', '    # (', this.ClockName, '_period * ', num2str(default_reset_wait), ' * CLKRATE + ', this.ClockName, '_hold);\n', '    ', this.ResetName, ' <= ', rdeassertval, ';\n', '  end  // ', this.ResetName, '_gen\n\n');
            % 31 37
            % 32 37
            % 33 37
            % 34 37
            % 35 37
            % 36 37
        end % if
    end % if
end % function
