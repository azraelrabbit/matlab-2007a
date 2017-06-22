function this = Resize2D(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = vipfixptddg.Resize2D(block);
    % 10 11
    this.init(block);
    % 12 14
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    % 15 16
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 18 19
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.blockSupportsUnsigned = 1.0;
    % 21 22
    otherDTs{1.0}.Name = sprintf('Interpolation \nweights table');
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length'};
    otherDTs{1.0}.isSigned = 0.0;
    otherDTs{1.0}.alwaysShowSignedness = 1.0;
    otherDTs{1.0}.Type = 'DataTypeRowFractional';
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    % 32 33
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 34 35
    this.loadFromBlock;
end % function
