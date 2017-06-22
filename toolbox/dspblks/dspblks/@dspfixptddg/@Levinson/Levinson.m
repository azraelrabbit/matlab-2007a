function this = Levinson(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.Levinson(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    % 15 16
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    otherDTs{1.0}.ParamBlock = this;
    otherDTs{1.0}.Name = 'A and K';
    otherDTs{1.0}.Type = 'DataTypeRowMultiPrec';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 32 34
    % 33 34
    otherDTs{1.0}.ParamFuncName = 'getCoeffPrecInfo';
    otherDTs{1.0}.NumPrecs = 2.0;
    % 36 37
    otherDTs{2.0}.Name = 'P';
    otherDTs{2.0}.Prefix = 'output';
    otherDTs{2.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 40 41
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 42 43
    this.loadFromBlock;
end % function
