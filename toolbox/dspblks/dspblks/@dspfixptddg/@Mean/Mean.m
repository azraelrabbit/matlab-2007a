function this = Mean(block, args)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.Mean(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'accum';
    % 15 16
    baseDTs{2.0}.name = 'output';
    baseDTs{2.0}.blockHasAccum = 1.0;
    % 18 19
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 20 21
    this.loadFromBlock;
end % function
