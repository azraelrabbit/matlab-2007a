function this = Difference(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.Difference(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'accum';
    baseDTs{1.0}.internalRule = 1.0;
    baseDTs{1.0}.blockSupportsUnsigned = 1.0;
    % 17 18
    baseDTs{2.0}.name = 'output';
    baseDTs{2.0}.blockHasAccum = 1.0;
    baseDTs{2.0}.blockSupportsUnsigned = 1.0;
    % 21 22
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 23 24
    this.loadFromBlock;
end % function
