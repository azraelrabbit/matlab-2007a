function this = BlockMatch(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.BlockMatch(block);
    this.init(block);
    % 12 13
    [PROD, ACCUM, OUT] = deal(1.0, 2.0, 3.0);
    % 14 16
    % 15 16
    otherDTs{PROD}.Name = 'Product output';
    otherDTs{PROD}.Prefix = 'prodOutput';
    otherDTs{PROD}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    otherDTs{ACCUM}.Name = 'Accumulator';
    otherDTs{ACCUM}.Prefix = 'accum';
    otherDTs{ACCUM}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 26 29
    % 27 29
    % 28 29
    otherDTs{OUT}.Name = 'Output';
    otherDTs{OUT}.Prefix = 'output';
    otherDTs{OUT}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 32 33
    otherDTs{OUT}.blockSupportsUnsigned = 1.0;
    % 34 35
    this.FixptDialog = dspfixptddg.FixptDialog(this, {}, otherDTs);
    % 36 37
    this.loadFromBlock;
end % function
