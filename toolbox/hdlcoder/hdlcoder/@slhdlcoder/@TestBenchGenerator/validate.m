function validate(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(this.InportSrc) && isempty(this.OutportSnk)
        error(generatemsgid('nodataerror'), 'Cannot generate testbench without input and output data.');
        % 9 11
    end
    % 11 14
    % 12 14
    if ge(mtimes(2.0, this.ForceHoldTime), plus(this.ForceClockLowTime, this.ForceClockHighTime))
        tcycle = plus(this.ForceClockLowTime, this.ForceClockHighTime);
        error(generatemsgid('timingerror'), 'The specified hold time (%d) was greater than one-half the cycle time (%d). Please adjust these values.', this.ForceHoldTime, tcycle);
    else
        if ge(this.ForceHoldTime, plus(this.ForceClockLowTime, this.ForceClockHighTime))
            tcycle = plus(this.ForceClockLowTime, this.ForceClockHighTime);
            error(generatemsgid('timingerror'), 'The specified hold time (%d) is greater than or equal to the cycle time (%d). Please adjust these values.', this.ForceHoldTime, tcycle);
            % 20 22
        end
    end
end
