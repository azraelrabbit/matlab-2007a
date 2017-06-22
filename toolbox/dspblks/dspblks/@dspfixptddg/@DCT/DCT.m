function this = DCT(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = dspfixptddg.DCT(block);
    % 10 11
    this.init(block);
    % 12 13
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    % 15 16
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    baseDTs{2.0}.internalRule = 1.0;
    % 19 20
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.internalRule = 1.0;
    baseDTs{3.0}.blockHasAccum = 0.0;
    % 23 26
    % 24 26
    % 25 26
    baseDTs{3.0}.blockHasProdOut = 0.0;
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    otherDTs{1.0}.Name = 'Sine table';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length'};
    otherDTs{1.0}.Type = 'DataTypeRowFractional';
    % 36 37
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 38 39
    this.loadFromBlock;
end % function
