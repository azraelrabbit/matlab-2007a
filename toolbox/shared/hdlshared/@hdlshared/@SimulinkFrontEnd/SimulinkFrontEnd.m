function this = SimulinkFrontEnd(slconnection, hPir, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    this = hdlshared.SimulinkFrontEnd;
    % 13 15
    if ~(isa(slconnection, 'hdlshared.SimulinkConnection'))
        error(hdlerrormsgid('SimulinkFrontEnd:invalidconstruction'), 'First argument must be a SimulinkConnection object.');
        % 16 18
    end
    % 18 20
    if ~(isa(hPir, 'hdlcoder.pir'))
        error(hdlerrormsgid('SimulinkFrontEnd:invalidconstruction'), 'Second argument must be a Pir object.');
        % 21 23
    end
    % 23 25
    this.SimulinkConnection = slconnection;
    this.hPir = hPir;
    % 26 29
    % 27 29
    this.dumpXML = 'no';
    this.verbose = 'no';
    % 30 32
    pvlist = cellhorzcat(varargin{:});
    % 32 34
    if eq(mod(length(pvlist), 2.0), 1.0)
        error(hdlerrormsgid('simulinkfrontend'), 'Number of parameter value pairs must be even.');
        % 35 37
    end
    % 37 39
    for n=1.0:length(pvlist)
        this.(pvlist(n)) = this.pvlist(plus(n, 1.0));
    end % for
end
