function this = Translate2D(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    this = vipfixptddg.Translate2D(block);
    % 12 13
    this.init(block);
    % 14 17
    % 15 17
    % 16 17
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.firstInput = 1.0;
    baseDTs{3.0}.blockSupportsUnsigned = 1.0;
    % 20 21
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.firstInput = 1.0;
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 24 25
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.firstInput = 1.0;
    % 27 28
    otherDTs{1.0}.Name = 'Offset values';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 31 34
    % 32 34
    % 33 34
    otherDTs{1.0}.Type = 'DataTypeRowBestPrec';
    otherDTs{1.0}.ParamBlock = this;
    otherDTs{1.0}.ParamPropNames = {'translation'};
    % 37 38
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 39 40
    this.loadFromBlock;
end % function
