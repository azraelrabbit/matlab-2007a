function setCurrentClkBundle(this, hN)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [clk, clken, reset] = hdlgetclockbundle(hN, [], [], 1.0, 1.0, 0.0);
    % 9 10
    this.CurrentClock = clk;
    this.CurrentClockEnable = clken;
    this.CurrentReset = reset;
end % function
