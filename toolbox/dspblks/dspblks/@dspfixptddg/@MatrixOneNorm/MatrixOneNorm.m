function this = MatrixOneNorm(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.MatrixOneNorm(block);
    % 11 12
    this.init(block);
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    baseDTs{1.0}.name = 'accum';
    baseDTs{1.0}.internalRule = 1.0;
    baseDTs{2.0}.name = 'output';
    baseDTs{2.0}.blockHasAccum = 1.0;
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    this.loadFromBlock;
end % function
