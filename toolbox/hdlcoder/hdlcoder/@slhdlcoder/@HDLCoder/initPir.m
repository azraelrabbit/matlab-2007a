function initPir(this, slConnection)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    p = pir;
    p.clearState;
    % 10 12
    % 11 12
    p.initParams(this.CoderParameters)
    p.setSampleTimes(slConnection.ModelRates);
    % 14 17
    % 15 17
    % 16 17
    this.PirInstance = p;
end % function
