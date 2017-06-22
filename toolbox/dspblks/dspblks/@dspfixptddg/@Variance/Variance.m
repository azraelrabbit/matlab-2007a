function this = Variance(block, args)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.Variance(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    % 15 16
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 18 19
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.blockHasAccum = 1.0;
    baseDTs{3.0}.blockHasProdOut = 1.0;
    % 22 23
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 24 25
    this.loadFromBlock;
end % function
