function this = RaisedCosineFilterRx(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = commdialog.RaisedCosineFilterRx(block);
    % 10 11
    this.init(block);
    % 12 14
    % 13 14
    [PROD, ACCUM, OUTPUT] = deal(1.0, 2.0, 3.0);
    COEFFS = 1.0;
    % 16 17
    otherDTs{COEFFS}.Name = 'Coefficients';
    otherDTs{COEFFS}.Prefix = 'coeff';
    otherDTs{COEFFS}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 20 23
    % 21 23
    % 22 23
    otherDTs{COEFFS}.Type = 'DataTypeRowBestPrec';
    otherDTs{COEFFS}.ParamBlock = this;
    otherDTs{COEFFS}.ParamPropNames = {'intentionally blank'};
    % 26 27
    baseDTs{PROD}.name = 'prodOutput';
    baseDTs{ACCUM}.name = 'accum';
    baseDTs{ACCUM}.blockHasProdOut = 1.0;
    baseDTs{OUTPUT}.name = 'output';
    baseDTs{OUTPUT}.blockHasAccum = 1.0;
    % 32 33
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 34 35
    this.loadFromBlock;
end % function
