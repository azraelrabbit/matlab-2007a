function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.Algo = this.Block.Algo;
    this.L = this.Block.L;
    this.stepflag = this.Block.stepflag;
    this.mu = this.Block.mu;
    this.leakage = this.Block.leakage;
    this.ic = this.Block.ic;
    this.Adapt = strcmpi(this.Block.Adapt, 'on');
    this.resetflag = this.Block.resetflag;
    this.weights = strcmpi(this.Block.weights, 'on');
    % 18 19
    this.FixptDialog.loadFromBlock;
end % function
