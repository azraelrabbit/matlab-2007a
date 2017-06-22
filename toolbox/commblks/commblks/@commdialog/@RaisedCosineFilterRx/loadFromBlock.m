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
    this.filtType = this.Block.filtType;
    this.N = this.Block.N;
    this.D = this.Block.D;
    this.R = this.Block.R;
    this.sampMode = this.Block.sampMode;
    this.rateMode = this.Block.rateMode;
    this.downFactor = this.Block.downFactor;
    this.downOffset = this.Block.downOffset;
    this.checkGain = this.Block.checkGain;
    this.filterGain = this.Block.filterGain;
    this.checkCoeff = strcmpi(this.Block.checkCoeff, 'on');
    this.variableName = this.Block.variableName;
    % 22 24
    % 23 24
    this.FixptDialog.loadFromBlock;
end % function
