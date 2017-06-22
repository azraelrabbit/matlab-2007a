function this = MatrixScaling(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.MatrixScaling(block);
    % 11 12
    this.init(block);
    % 13 16
    % 14 16
    % 15 16
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.firstInput = 1.0;
    baseDTs{1.0}.internalRule = 1.0;
    % 19 20
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.firstInput = 1.0;
    baseDTs{2.0}.internalRule = 1.0;
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 24 25
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.firstInput = 1.0;
    baseDTs{3.0}.blockHasProdOut = 1.0;
    % 28 29
    otherDTs{1.0}.Name = 'Scaling vector';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 32 35
    % 33 35
    % 34 35
    otherDTs{1.0}.Type = 'DataTypeRowBestPrec';
    otherDTs{1.0}.ParamBlock = this;
    otherDTs{1.0}.ParamPropNames = {'D_VectFromMask'};
    % 38 39
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 40 41
    this.loadFromBlock;
end % function
