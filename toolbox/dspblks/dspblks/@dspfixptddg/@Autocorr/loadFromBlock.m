function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.AllPositiveLags = strcmpi(this.Block.AllPositiveLags, 'on');
    this.maxlag = this.Block.maxlag;
    this.bias = this.Block.bias;
    this.domain = this.Block.domain;
    % 13 14
    this.FixptDialog.loadFromBlock;
end % function
