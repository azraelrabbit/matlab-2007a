function loadFromBlock(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this.pulseLen = this.Block.pulseLen;
    this.pulseDelay = this.Block.pulseDelay;
    this.sampMode = this.Block.sampMode;
    this.normCheck = strcmpi(this.Block.normCheck, 'on');
    this.normMode = this.Block.normMode;
    this.filterGain = this.Block.filterGain;
    % 16 18
    % 17 18
    this.FixptDialog.loadFromBlock;
end % function
