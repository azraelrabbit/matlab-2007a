function generateClocks(this, hN, hC)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.OutputPorts(1.0).getSignal, hC.InputPorts(1.0).getSignal));
    % 10 12
    % 11 12
    [clk, clken, reset] = hdlgetclockbundle(hN, hC, hS, 1.0, 1.0, 0.0);
end % function
