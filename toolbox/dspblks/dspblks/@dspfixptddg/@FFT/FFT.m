function this = FFT(block)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.FFT(block);
    % 11 12
    this.init(block);
    % 13 15
    % 14 15
    prompt = 'Skip divide-by-two on butterfly outputs for fixed-point signals';
    skipNorm = dspGetLeafWidgetBase('checkbox', prompt, 'SkipNorm', this, 'SkipNorm');
    skipNorm.RowSpan = [2.0 2.0];
    skipNorm.ColSpan = [1.0 2.0];
    blockInfo.block = this.Block;
    blockInfo.propNames = {'SkipNorm'};
    blockInfo.propTypes = {'bool'};
    skip = dspfixptddg.DSPWidgetWrapper(skipNorm, blockInfo);
    % 23 25
    % 24 25
    baseDTs{1.0}.name = 'prodOutput';
    baseDTs{1.0}.internalRule = 1.0;
    % 27 28
    baseDTs{2.0}.name = 'accum';
    baseDTs{2.0}.blockHasProdOut = 1.0;
    baseDTs{2.0}.internalRule = 1.0;
    % 31 32
    baseDTs{3.0}.name = 'output';
    baseDTs{3.0}.internalRule = 1.0;
    % 34 35
    otherDTs{1.0}.Name = 'Sine table';
    otherDTs{1.0}.Prefix = 'firstCoeff';
    otherDTs{1.0}.Entries = {'Same word length as input','Specify word length'};
    otherDTs{1.0}.Type = 'DataTypeRowFractional';
    % 39 40
    this.FixptDialog = dspfixptddg.FixptDialog(this, baseDTs, otherDTs, skip);
    % 41 42
    this.loadFromBlock;
end % function
