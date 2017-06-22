function this = Blob(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Blob(block);
    this.init(block);
    % 12 14
    % 13 14
    baseDTs = {};
    % 15 17
    % 16 17
    [PROD, ACCUM, OUT_CENTROID, OUT_DIAM, OUT_EXTENT, OUT_PERIMETER] = deal(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
    % 18 21
    % 19 21
    % 20 21
    otherDTs{PROD}.Name = 'Product output';
    otherDTs{PROD}.Prefix = 'prodOutput';
    otherDTs{PROD}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 24 27
    % 25 27
    % 26 27
    otherDTs{ACCUM}.Name = 'Accumulator';
    otherDTs{ACCUM}.Prefix = 'accum';
    otherDTs{ACCUM}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 30 33
    % 31 33
    % 32 33
    otherDTs{OUT_CENTROID}.Name = 'Centroid output';
    otherDTs{OUT_CENTROID}.Prefix = 'output';
    otherDTs{OUT_CENTROID}.Entries = {'Same as accumulator','Binary point scaling','Slope and bias scaling'};
    % 36 39
    % 37 39
    % 38 39
    otherDTs{OUT_DIAM}.Name = 'Equiv Diam^2 output';
    otherDTs{OUT_DIAM}.Prefix = 'memory';
    otherDTs{OUT_DIAM}.Entries = {'Same as accumulator','Same as product output','Binary point scaling','Slope and bias scaling'};
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    otherDTs{OUT_EXTENT}.Name = 'Extent output';
    otherDTs{OUT_EXTENT}.Prefix = 'firstCoeff';
    otherDTs{OUT_EXTENT}.Entries = {'Same as accumulator','Binary point scaling','Slope and bias scaling'};
    % 49 52
    % 50 52
    % 51 52
    otherDTs{OUT_PERIMETER}.Name = 'Perimeter output';
    otherDTs{OUT_PERIMETER}.Prefix = 'secondCoeff';
    otherDTs{OUT_PERIMETER}.Entries = {'Same as accumulator','Binary point scaling','Slope and bias scaling'};
    % 55 58
    % 56 58
    % 57 58
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    this.loadFromBlock;
end % function
