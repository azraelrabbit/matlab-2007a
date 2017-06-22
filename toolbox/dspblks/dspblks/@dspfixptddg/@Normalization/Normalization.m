function this = Normalization(block)
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
    this = dspfixptddg.Normalization(block);
    % 12 13
    this.init(block);
    % 14 15
    baseDTs{1.0}.name = 'prodOutput';
    % 16 17
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 19 20
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.blockHasAccum = 1.0;
    baseDTs{3.0}.blockHasProdOut = 1.0;
    % 23 24
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 25 26
    this.loadFromBlock;
end % function
