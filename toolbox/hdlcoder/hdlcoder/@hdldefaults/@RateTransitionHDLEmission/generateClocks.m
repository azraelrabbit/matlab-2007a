function generateClocks(this, hN, hC)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    % 12 13
    ip_samp_time = hdlsignalrate(in);
    op_samp_time = hdlsignalrate(out);
    % 15 17
    % 16 17
    if gt(ip_samp_time, op_samp_time)
        % 18 20
        % 19 20
        up = 1.0;
        down = 1.0;
        phase = 0.0;
        % 23 24
        hS = this.findSignalWithValidRate(hC.Owner, hC, in);
        % 25 26
        [clk, clken, rst] = hdlgetclockbundle(hC.Owner, hC, hS, up, down, phase);
        % 27 28
    end % if
end % function
