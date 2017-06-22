function this = LDLFactorization(block, varargin)
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
    this = dspfixptddg.LDLFactorization(block);
    % 12 13
    this.init(block);
    % 14 15
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    % 17 18
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.internalRule = 1.0;
    baseDTs{2.0}.blockHasProdOut = 1.0;
    % 21 22
    baseDTs{3.0}.name = 'output';
    % 23 24
    otherDTs{1.0}.Name = sprintf('Intermediate\n    product');
    otherDTs{1.0}.Prefix = 'interProd';
    otherDTs{1.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 27 30
    % 28 30
    % 29 30
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 31 32
    this.loadFromBlock;
end % function
