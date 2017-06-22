function this = FBSubstitution(block, varargin)
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
    this = dspfixptddg.FBSubstitution(block);
    % 12 13
    this.init(block);
    % 14 15
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    baseDTs{1.0}.firstInput = 1.0;
    % 18 19
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.internalRule = 1.0;
    baseDTs{2.0}.firstInput = 1.0;
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 23 24
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.firstInput = 1.0;
    % 26 27
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs);
    % 28 29
    this.loadFromBlock;
end % function
