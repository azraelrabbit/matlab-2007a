function this = Autocorr2D(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = vipfixptddg.Autocorr2D(block);
    % 10 11
    this.init(block);
    % 12 15
    % 13 15
    % 14 15
    baseDTs{1.0}.name = 'prodOutput';
    % 16 17
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 19 20
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.blockSupportsUnsigned = 1.0;
    % 22 23
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 24 25
    this.loadFromBlock;
end % function
