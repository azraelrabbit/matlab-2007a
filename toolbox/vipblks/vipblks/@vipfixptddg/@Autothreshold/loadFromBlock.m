function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.operator = this.Block.operator;
    this.threshOut = strcmpi(this.Block.threshOut, 'on');
    this.effMetricOut = strcmpi(this.Block.effMetricOut, 'on');
    this.userDefinedRange = strcmpi(this.Block.userDefinedRange, 'on');
    this.umin = this.Block.umin;
    this.umax = this.Block.umax;
    this.outOfRngOpt = this.Block.outOfRngOpt;
    this.scaleThreshold = strcmpi(this.Block.scaleThreshold, 'on');
    this.scaleFactor = this.Block.scaleFactor;
    % 18 19
    this.FixptDialog.loadFromBlock;
end % function
