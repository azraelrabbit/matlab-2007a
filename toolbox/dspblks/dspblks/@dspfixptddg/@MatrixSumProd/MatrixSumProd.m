function this = MatrixSumProd(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.MatrixSumProd(block);
    % 11 12
    this.init(block);
    % 13 14
    switch this.Block.MaskType
    case 'Matrix Sum'
        % 16 17
        this.DimPrompt = 'Sum over:';
        baseDTs{1.0}.name = 'accum';
        baseDTs{1.0}.internalRule = 1.0;
        baseDTs{1.0}.blockSupportsUnsigned = 1.0;
        baseDTs{2.0}.name = 'output';
        baseDTs{2.0}.blockHasAccum = 1.0;
        baseDTs{2.0}.blockSupportsUnsigned = 1.0;
        otherDTs = {};
    case 'Matrix Product'
        % 26 27
        this.DimPrompt = 'Multiply over:';
        baseDTs{1.0}.name = 'prodOutput';
        baseDTs{1.0}.internalRule = 1.0;
        baseDTs{1.0}.blockSupportsUnsigned = 1.0;
        % 31 32
        baseDTs{2.0}.name = 'accum';
        baseDTs{2.0}.internalRule = 1.0;
        baseDTs{2.0}.blockHasProdOut = 1.0;
        baseDTs{2.0}.blockSupportsUnsigned = 1.0;
        % 36 37
        baseDTs{3.0}.name = 'output';
        baseDTs{3.0}.blockHasProdOut = 1.0;
        baseDTs{3.0}.blockSupportsUnsigned = 1.0;
        % 40 41
        otherDTs{1.0}.Name = sprintf('Intermediate\n    product');
        otherDTs{1.0}.Prefix = 'interProd';
        otherDTs{1.0}.blockSupportsUnsigned = 1.0;
        otherDTs{1.0}.Entries = {'Same as input','Binary point scaling','Slope and bias scaling'};
    otherwise
        % 46 47
        % 47 48
        error('Unable to determine Matrix Sum/Product type. Has something changed?');
    end % switch
    % 50 51
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs);
    % 52 53
    this.loadFromBlock;
end % function
