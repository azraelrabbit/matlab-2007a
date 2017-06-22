function this = HoughLines(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.HoughLines(block);
    % 11 12
    this.init(block);
    % 13 15
    % 14 15
    [SINE, PROD, ACCUM] = deal(1.0, 2.0, 3.0);
    % 16 19
    % 17 19
    % 18 19
    otherDTs{SINE}.Name = 'Sine table';
    otherDTs{SINE}.Prefix = 'firstCoeff';
    otherDTs{SINE}.Entries = {'Specify word length'};
    otherDTs{SINE}.Type = 'DataTypeRowFractional';
    % 23 25
    % 24 25
    otherDTs{PROD}.Name = 'Product output';
    otherDTs{PROD}.Prefix = 'prodOutput';
    otherDTs{PROD}.Entries = {'Same as first input','Binary point scaling','Slope and bias scaling'};
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    otherDTs{ACCUM}.Name = 'Accumulator';
    otherDTs{ACCUM}.Prefix = 'accum';
    otherDTs{ACCUM}.Entries = {'Same as product output','Binary point scaling','Slope and bias scaling'};
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    this.FixptDialog = dspfixptddg.FixptDialog(this, {}, otherDTs);
    % 40 41
    this.loadFromBlock;
end % function
