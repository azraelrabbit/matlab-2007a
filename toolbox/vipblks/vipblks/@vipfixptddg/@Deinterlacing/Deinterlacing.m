function this = Deinterlacing(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Deinterlacing(block);
    % 11 12
    this.init(block);
    % 13 16
    % 14 16
    % 15 16
    baseDTs{1.0}.name = 'accum';
    baseDTs{1.0}.blockHasProdOut = 0.0;
    % 18 19
    baseDTs{2.0}.name = 'output';
    baseDTs{2.0}.blockSupportsUnsigned = 1.0;
    % 21 22
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 23 24
    this.loadFromBlock;
end % function
