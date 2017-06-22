function this = HOUGH(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = vipfixptddg.HOUGH(block);
    % 10 11
    this.init(block);
    % 12 13
    [SINE, RHO, PROD, ACCUM, OUT_H, OUT_THETA] = deal(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
    % 14 16
    % 15 16
    otherDTs{SINE}.Name = 'Sine Table';
    otherDTs{SINE}.Prefix = 'firstCoeff';
    otherDTs{SINE}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 19 21
    % 20 21
    otherDTs{RHO}.Name = 'Rho';
    otherDTs{RHO}.Prefix = 'secondCoeff';
    otherDTs{RHO}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 24 27
    % 25 27
    % 26 27
    otherDTs{PROD}.Name = 'Product output';
    otherDTs{PROD}.Prefix = 'prodOutput';
    otherDTs{PROD}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 30 33
    % 31 33
    % 32 33
    otherDTs{ACCUM}.Name = 'Accumulator';
    otherDTs{ACCUM}.Prefix = 'accum';
    otherDTs{ACCUM}.Entries = {'Same as product output','Binary point scaling','Slope and bias scaling'};
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    otherDTs{OUT_H}.Name = 'Hough output';
    otherDTs{OUT_H}.Prefix = 'output';
    otherDTs{OUT_H}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 43 44
    otherDTs{OUT_H}.blockSupportsUnsigned = 1.0;
    % 45 47
    % 46 47
    otherDTs{OUT_THETA}.Name = 'Theta output';
    otherDTs{OUT_THETA}.Prefix = 'memory';
    otherDTs{OUT_THETA}.Entries = {'Binary point scaling','Slope and bias scaling'};
    % 50 52
    % 51 52
    this.FixptDialog = dspfixptddg.FixptDialog(this, {}, otherDTs);
    % 53 54
    this.loadFromBlock;
end % function
