function this = CumulativeProd(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.CumulativeProd(block);
    % 11 12
    this.init(block);
    % 13 14
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.blockSupportsUnsigned = 1.0;
    % 16 17
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    baseDTs{2.0}.blockSupportsUnsigned = 1.0;
    % 20 21
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.blockHasProdOut = 1.0;
    baseDTs{3.0}.blockSupportsUnsigned = 1.0;
    % 24 25
    otherDTs{1.0}.Name = sprintf('Intermediate\n    product');
    otherDTs{1.0}.Prefix = 'interProd';
    otherDTs{1.0}.blockSupportsUnsigned = 1.0;
    otherDTs{1.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    % 29 32
    % 30 32
    % 31 32
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 33 34
    this.loadFromBlock;
end % function
