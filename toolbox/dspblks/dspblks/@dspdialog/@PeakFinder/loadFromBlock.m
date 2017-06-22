function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if strcmpi(this.Block.overflowMode, 'on')
        this.overflowMode = 'Saturate';
    else
        this.overflowMode = 'Wrap';
    end % if
    % 14 15
    this.polarity = this.Block.polarity;
    this.outputIdx = strcmpi(this.Block.outputIdx, 'on');
    this.outputVal = strcmpi(this.Block.outputVal, 'on');
    this.maxPeaks = this.Block.maxPeaks;
    this.NoiseDistinguish = strcmpi(this.Block.NoiseDistinguish, 'on');
    this.thresh = this.Block.thresh;
end % function
