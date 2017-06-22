function this = Mean2D(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Mean2D(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'accum';
    % 15 16
    baseDTs{2.0}.name = 'output';
    % 17 18
    baseDTs{2.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 19 21
    % 20 21
    baseDTs{2.0}.blockSupportsUnsigned = 1.0;
    % 22 23
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 24 25
    this.loadFromBlock;
end % function
