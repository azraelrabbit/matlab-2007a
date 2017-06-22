function this = Variance2D(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Variance2D(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs = {};
    % 15 16
    otherDTs{1.0}.Name = 'Input-squared product';
    otherDTs{1.0}.Prefix = 'prodOutput';
    otherDTs{1.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 19 22
    % 20 22
    % 21 22
    otherDTs{2.0}.Name = 'Input-sum-squared product';
    otherDTs{2.0}.Prefix = 'memory';
    otherDTs{2.0}.Entries = {'Same as input-squared product','Binary point scaling','Slope and bias scaling'};
    % 25 28
    % 26 28
    % 27 28
    otherDTs{3.0}.Name = 'Accumulator';
    otherDTs{3.0}.Prefix = 'accum';
    otherDTs{3.0}.Entries = {'Same as input-squared product','Same as input','Binary point scaling','Slope and bias scaling'};
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    otherDTs{4.0}.Name = 'Output';
    otherDTs{4.0}.Prefix = 'output';
    otherDTs{4.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 38 40
    % 39 40
    otherDTs{4.0}.blockSupportsUnsigned = 1.0;
    % 41 42
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 43 44
    this.loadFromBlock;
end % function
