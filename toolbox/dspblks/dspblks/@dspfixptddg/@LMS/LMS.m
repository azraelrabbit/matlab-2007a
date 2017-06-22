function this = LMS(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [COEFFS, PROD, ACCUM, STATE] = deal(1.0, 3.0, 4.0, 2.0);
    this = dspfixptddg.LMS(block);
    % 12 13
    this.init(block);
    % 14 17
    % 15 17
    % 16 17
    otherDTs = cell(4.0, 1.0);
    % 18 19
    otherDTs{COEFFS}.ParamBlock = this;
    otherDTs{COEFFS}.Name = 'Parameters';
    otherDTs{COEFFS}.Type = 'DataTypeRowMultiPrec';
    otherDTs{COEFFS}.Prefix = 'firstCoeff';
    otherDTs{COEFFS}.Entries = {'Same word length as first input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    otherDTs{COEFFS}.ParamFuncName = 'getCoeffPrecInfo';
    otherDTs{COEFFS}.NumPrecs = 2.0;
    % 30 32
    % 31 32
    otherDTs{PROD}.ParamBlock = this;
    otherDTs{PROD}.Name = sprintf(' Products\n& quotient');
    otherDTs{PROD}.Type = 'DataTypeRowMultiPrec';
    otherDTs{PROD}.Prefix = 'prodOutput';
    otherDTs{PROD}.Entries = {'Same as first input','Binary point scaling','Slope and bias scaling'};
    % 37 40
    % 38 40
    % 39 40
    otherDTs{PROD}.ParamFuncName = 'getProdPrecInfo';
    otherDTs{PROD}.NumPrecs = 5.0;
    % 42 44
    % 43 44
    otherDTs{ACCUM}.ParamBlock = this;
    otherDTs{ACCUM}.Name = 'Accumulators';
    otherDTs{ACCUM}.Type = 'DataTypeRowMultiPrec';
    otherDTs{ACCUM}.Prefix = 'accum';
    otherDTs{ACCUM}.Entries = {'Same as first input','Binary point scaling','Slope and bias scaling'};
    % 49 52
    % 50 52
    % 51 52
    otherDTs{ACCUM}.ParamFuncName = 'getAccumPrecInfo';
    otherDTs{ACCUM}.NumPrecs = 2.0;
    % 54 56
    % 55 56
    otherDTs{STATE}.ParamBlock = this;
    otherDTs{STATE}.Name = 'Weights';
    otherDTs{STATE}.Prefix = 'memory';
    otherDTs{STATE}.Entries = {'Same as first input','Binary point scaling','Slope and bias scaling'};
    % 60 64
    % 61 64
    % 62 64
    % 63 64
    this.FixptDialog = dspfixptddg.FixptDialog(this, {}, otherDTs);
    % 65 66
    this.loadFromBlock;
end % function
