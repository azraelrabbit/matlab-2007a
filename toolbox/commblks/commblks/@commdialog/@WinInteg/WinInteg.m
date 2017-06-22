function this = WinInteg(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = commdialog.WinInteg(block);
    % 10 11
    this.init(block);
    % 12 13
    [PROD, ACCUM, OUTPUT] = deal(1.0, 2.0, 3.0);
    COEFFS = 1.0;
    % 15 16
    otherDTs{COEFFS}.Name = 'Coefficients';
    otherDTs{COEFFS}.Prefix = 'coeff';
    otherDTs{COEFFS}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 19 22
    % 20 22
    % 21 22
    otherDTs{COEFFS}.Type = 'DataTypeRowBestPrec';
    otherDTs{COEFFS}.ParamBlock = this;
    otherDTs{COEFFS}.ParamPropNames = {'intentionally blank'};
    % 25 26
    baseDTs{PROD}.name = 'prodOutput';
    baseDTs{ACCUM}.name = 'accum';
    baseDTs{ACCUM}.blockHasProdOut = 1.0;
    baseDTs{OUTPUT}.name = 'output';
    baseDTs{OUTPUT}.blockHasAccum = 1.0;
    % 31 32
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 33 34
    this.loadFromBlock;
end % function
