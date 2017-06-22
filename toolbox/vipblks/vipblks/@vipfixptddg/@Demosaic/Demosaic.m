function this = Demosaic(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = vipfixptddg.Demosaic(block);
    % 11 12
    this.init(block);
    % 13 16
    % 14 16
    % 15 16
    baseDTs{1.0}.name = 'prodOutput';
    % 17 18
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 20 21
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 22 23
    this.loadFromBlock;
end % function
