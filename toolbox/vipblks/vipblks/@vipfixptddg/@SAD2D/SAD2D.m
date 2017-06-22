function this = SAD2D(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.SAD2D(block);
    this.init(block);
    % 12 15
    % 13 15
    % 14 15
    baseDTs{1.0}.name = 'accum';
    baseDTs{1.0}.firstInput = 1.0;
    baseDTs{1.0}.blockHasAccum = 1.0;
    % 18 19
    baseDTs{2.0}.name = 'output';
    baseDTs{2.0}.firstInput = 1.0;
    baseDTs{2.0}.blockSupportsUnsigned = 1.0;
    % 22 23
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 24 25
    this.loadFromBlock;
end % function
