function this = Median2D(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Median2D(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    % 15 17
    % 16 17
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 19 21
    % 20 21
    baseDTs{3.0}.name = 'output';
    % 22 24
    % 23 24
    baseDTs{3.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 25 28
    % 26 28
    % 27 28
    baseDTs{3.0}.blockSupportsUnsigned = 1.0;
    % 29 30
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 31 32
    this.loadFromBlock;
end % function
