function this = VQEncoder(block, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.VQEncoder(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    % 15 16
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 18 20
    % 19 20
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 21 22
    this.loadFromBlock;
end % function
