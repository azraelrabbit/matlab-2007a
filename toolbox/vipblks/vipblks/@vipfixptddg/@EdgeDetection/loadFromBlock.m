function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.method = this.Block.method;
    this.outputType = this.Block.outputType;
    this.userDefinedThreshold = strcmpi(this.Block.userDefinedThreshold, 'on');
    this.thresholdSource = this.Block.thresholdSource;
    this.threshold = this.Block.threshold;
    this.thresholdTuning = this.Block.thresholdTuning;
    this.edgeThinning = strcmpi(this.Block.edgeThinning, 'on');
    % 16 17
    this.threshold_canny = this.Block.threshold_canny;
    this.autoPercent = this.Block.autoPercent;
    this.sigma = this.Block.sigma;
    % 20 21
    this.FixptDialog.loadFromBlock;
end % function
