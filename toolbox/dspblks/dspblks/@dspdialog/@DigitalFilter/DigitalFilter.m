function this = DigitalFilter(block, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [TAPSUM, MULTIPLICAND, STAGEIO, COEFFS, PROD, ACCUM, STATE, OUTPUT] = deal(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);
    % 11 12
    this = dspdialog.DigitalFilter(block);
    % 13 14
    this.init(block);
    % 15 17
    % 16 17
    otherDTs = cell(8.0, 1.0);
    % 18 20
    % 19 20
    otherDTs{TAPSUM}.Name = 'Tap sum';
    otherDTs{TAPSUM}.Prefix = 'tapSum';
    otherDTs{TAPSUM}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    otherDTs{MULTIPLICAND}.Name = 'Multiplicand';
    otherDTs{MULTIPLICAND}.Prefix = 'multiplicand';
    otherDTs{MULTIPLICAND}.Entries = {'Same as output','Binary point scaling','Slope and bias scaling'};
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    otherDTs{STAGEIO}.ParamBlock = this;
    otherDTs{STAGEIO}.Name = 'Section I/O';
    otherDTs{STAGEIO}.Type = 'DataTypeRowMultiPrec';
    otherDTs{STAGEIO}.Prefix = 'stageIO';
    otherDTs{STAGEIO}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 39 41
    % 40 41
    otherDTs{STAGEIO}.ParamFuncName = 'getStageIOInfo';
    otherDTs{STAGEIO}.NumPrecs = 2.0;
    % 43 46
    % 44 46
    % 45 46
    otherDTs{COEFFS}.ParamBlock = this;
    otherDTs{COEFFS}.Name = 'Coefficients';
    otherDTs{COEFFS}.Type = 'DataTypeRowMultiPrec';
    otherDTs{COEFFS}.Prefix = 'firstCoeff';
    otherDTs{COEFFS}.Entries = {'Same word length as input','Specify word length','Binary point scaling','Slope and bias scaling'};
    % 51 54
    % 52 54
    % 53 54
    otherDTs{COEFFS}.ParamFuncName = 'getCoeffPrecInfo';
    otherDTs{COEFFS}.NumPrecs = 3.0;
    % 56 59
    % 57 59
    % 58 59
    otherDTs{PROD}.Name = 'Product output';
    otherDTs{PROD}.Prefix = 'prodOutput';
    otherDTs{PROD}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    otherDTs{ACCUM}.Name = 'Accumulator';
    otherDTs{ACCUM}.Prefix = 'accum';
    otherDTs{ACCUM}.Entries = {'Same as input','Same as product output','Binary point scaling','Slope and bias scaling'};
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    otherDTs{STATE}.Name = 'State';
    otherDTs{STATE}.Prefix = 'memory';
    otherDTs{STATE}.Entries = {'Same as input','Same as accumulator','Binary point scaling','Slope and bias scaling'};
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    % 84 85
    otherDTs{OUTPUT}.Name = 'Output';
    otherDTs{OUTPUT}.Prefix = 'output';
    otherDTs{OUTPUT}.Entries = {'Same as input','Same as accumulator','Binary point scaling','Slope and bias scaling'};
    % 88 93
    % 89 93
    % 90 93
    % 91 93
    % 92 93
    this.MaskFixptDialog = dspfixptddg.FixptDialog(this, {}, otherDTs);
    % 94 95
    this.loadFromBlock;
end % function
