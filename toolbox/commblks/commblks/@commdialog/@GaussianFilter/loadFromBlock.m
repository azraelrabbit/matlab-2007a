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
    this.N = this.Block.N;
    this.BT = this.Block.BT;
    this.D = this.Block.D;
    this.normMode = this.Block.normMode;
    this.filterGain = this.Block.filterGain;
    this.checkCoeff = strcmpi(this.Block.checkCoeff, 'on');
    this.variableName = this.Block.variableName;
    % 17 19
    % 18 19
    this.FixptDialog.loadFromBlock;
end % function
