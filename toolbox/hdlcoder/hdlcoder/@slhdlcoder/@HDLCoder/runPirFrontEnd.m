function [p, slFrontend, pirchecks] = runPirFrontEnd(this, slConnection, checkhdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if lt(nargin, 3.0)
        checkhdl = 0.0;
    end % if
    % 9 11
    % 10 11
    this.initPir(slConnection);
    p = this.PirInstance;
    % 13 15
    % 14 15
    slFrontend = hdlshared.SimulinkFrontEnd(slConnection, p);
    slFrontend.generatePIR(this.ConfigManager, checkhdl);
    % 17 19
    % 18 19
    this.FrontEnd = slFrontend;
    % 20 22
    % 21 22
    this.setCurrentNetwork(p.getTopNetwork);
end % function
