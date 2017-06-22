function generateClocks(this, hN, hC)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if not(isempty(hC.InputPorts))
        hS = hC.InputPorts(1.0).getSignal;
    else
        hS = hC.OutputPorts(1.0).getSignal;
    end % if
    % 16 17
    [clk, clken, reset] = hdlgetclockbundle(hN, hC, hS, 1.0, 1.0, 0.0);
    % 18 19
    userData = this.getHDLUserData(hC);
    userData.hasClock = true;
    this.setHDLUserData(hC, userData);
end % function
