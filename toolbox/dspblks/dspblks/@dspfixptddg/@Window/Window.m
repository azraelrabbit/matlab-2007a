function this = Window(block, args)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.Window(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    % 16 17
    baseDTs{2.0}.name = 'output';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 19 20
    otherDTs{1.0}.Name = 'Window';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 23 26
    % 24 26
    % 25 26
    otherDTs{1.0}.Type = 'DataTypeRowBestPrec';
    otherDTs{1.0}.ParamBlock = this;
    % 28 29
    otherDTs{1.0}.ParamPropNames = {'intentionally blank'};
    % 30 31
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 32 33
    this.loadFromBlock;
end % function
