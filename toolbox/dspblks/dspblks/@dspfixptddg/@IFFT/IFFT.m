function this = IFFT(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.IFFT(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    % 16 17
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    baseDTs{2.0}.internalRule = 1.0;
    % 20 21
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.internalRule = 1.0;
    % 23 24
    otherDTs{1.0}.Name = 'Sine table';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length'};
    otherDTs{1.0}.Type = 'DataTypeRowFractional';
    % 28 29
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 30 31
    this.loadFromBlock;
end % function
