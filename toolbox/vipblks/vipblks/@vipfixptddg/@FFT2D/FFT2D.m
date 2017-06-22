function this = FFT2D(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this = vipfixptddg.FFT2D(block);
    % 10 11
    this.init(block);
    % 12 14
    % 13 14
    prompt = 'Skip divide-by-two on butterfly outputs for fixed-point signals';
    skipNorm = dspGetLeafWidgetBase('checkbox', prompt, 'SkipNorm', this, 'SkipNorm');
    skipNorm.RowSpan = [2.0 2.0];
    skipNorm.ColSpan = [1.0 2.0];
    blockInfo.block = this.Block;
    blockInfo.propNames = {'SkipNorm'};
    blockInfo.propTypes = {'bool'};
    skip = dspfixptddg.DSPWidgetWrapper(skipNorm, blockInfo);
    % 22 23
    otherDTs{1.0}.Name = 'Sine table';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length'};
    otherDTs{1.0}.Type = 'DataTypeRowFractional';
    % 27 28
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    % 30 31
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    baseDTs{2.0}.internalRule = 1.0;
    % 34 35
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.internalRule = 1.0;
    baseDTs{3.0}.blockHasAccum = 0.0;
    % 38 41
    % 39 41
    % 40 41
    baseDTs{3.0}.blockHasProdOut = 0.0;
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs, skip);
    % 47 48
    this.loadFromBlock;
end % function
