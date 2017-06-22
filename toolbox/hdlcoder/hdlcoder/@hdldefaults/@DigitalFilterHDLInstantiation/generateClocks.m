function generateClocks(this, hN, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hS = this.findSignalWithValidRate(hN, hC, horzcat(hC.InputPorts(1.0).getSignal, hC.OutputPorts(1.0).getSignal));
    % 9 10
    [clk, clken, reset] = hdlgetclockbundle(hN, hC, hS, 1.0, 1.0, 0.0);
end % function
