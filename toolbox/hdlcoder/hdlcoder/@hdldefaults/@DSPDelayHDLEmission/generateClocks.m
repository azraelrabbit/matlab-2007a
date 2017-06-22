function generateClocks(this, hN, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hS = this.findSignalWithValidRate(hC.Owner, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
    % 8 10
    % 9 10
    [clk, clken, reset] = hdlgetclockbundle(hN, hC, hS, 1.0, 1.0, 0.0);
end % function
