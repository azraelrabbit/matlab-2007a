function this = ConvCorr(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.ConvCorr(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.firstInput = 1.0;
    baseDTs{1.0}.internalRule = 1.0;
    % 17 18
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.firstInput = 1.0;
    baseDTs{2.0}.blockHasProdOut = 1.0;
    baseDTs{2.0}.internalRule = 1.0;
    % 22 23
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.firstInput = 1.0;
    baseDTs{3.0}.blockHasAccum = 1.0;
    baseDTs{3.0}.blockHasProdOut = 1.0;
    % 27 28
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 29 30
    this.loadFromBlock;
end % function
