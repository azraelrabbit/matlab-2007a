function this = Rotate2D(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Rotate2D(block);
    % 11 12
    this.init(block);
    % 13 16
    % 14 16
    % 15 16
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.firstInput = 1.0;
    baseDTs{3.0}.blockSupportsUnsigned = 1.0;
    % 19 20
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.firstInput = 1.0;
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 23 24
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.firstInput = 1.0;
    % 26 27
    otherDTs{1.0}.Name = 'Angle values';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 30 33
    % 31 33
    % 32 33
    otherDTs{1.0}.Type = 'DataTypeRowBestPrec';
    otherDTs{1.0}.ParamBlock = this;
    otherDTs{1.0}.ParamPropNames = {'angle'};
    % 36 37
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 38 39
    this.loadFromBlock;
end % function
