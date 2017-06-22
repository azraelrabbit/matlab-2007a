function this = TwoChanAnalSynth(block)
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
    this = dspfixptddg.TwoChanAnalSynth(block);
    % 12 13
    this.init(block);
    % 14 15
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    % 17 18
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    baseDTs{2.0}.internalRule = 1.0;
    % 21 22
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.blockHasAccum = 1.0;
    baseDTs{3.0}.blockHasProdOut = 1.0;
    % 25 26
    otherDTs{1.0}.Name = 'Coefficients';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 29 32
    % 30 32
    % 31 32
    otherDTs{1.0}.Type = 'DataTypeRowBestPrec';
    otherDTs{1.0}.ParamBlock = this;
    otherDTs{1.0}.ParamPropNames = {'lpf','hpf'};
    % 35 36
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 37 38
    this.loadFromBlock;
end % function
