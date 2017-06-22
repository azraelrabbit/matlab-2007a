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
    this.D = this.Block.D;
    this.R = this.Block.R;
    this.sampMode = this.Block.sampMode;
    this.N = this.Block.N;
    this.checkGain = this.Block.checkGain;
    this.filterGain = this.Block.filterGain;
    this.checkCoeff = strcmpi(this.Block.checkCoeff, 'on');
    this.variableName = this.Block.variableName;
    % 19 21
    % 20 21
    this.FixptDialog.loadFromBlock;
end % function
