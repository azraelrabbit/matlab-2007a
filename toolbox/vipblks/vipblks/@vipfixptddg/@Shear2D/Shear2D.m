function this = Shear2D(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = vipfixptddg.Shear2D(block);
    % 10 11
    this.init(block);
    % 12 14
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.firstInput = 1.0;
    % 16 17
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.firstInput = 1.0;
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 20 21
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.firstInput = 1.0;
    baseDTs{3.0}.blockSupportsUnsigned = 1.0;
    % 24 25
    otherDTs{1.0}.Name = 'Shear values';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 28 31
    % 29 31
    % 30 31
    otherDTs{1.0}.Type = 'DataTypeRowBestPrec';
    otherDTs{1.0}.ParamBlock = this;
    otherDTs{1.0}.ParamPropNames = {'shear_values'};
    % 34 35
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 36 37
    this.loadFromBlock;
end % function
