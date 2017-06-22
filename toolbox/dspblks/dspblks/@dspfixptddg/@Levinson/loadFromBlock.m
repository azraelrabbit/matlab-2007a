function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.coeffOutFcn = this.Block.coeffOutFcn;
    this.outP = strcmpi(this.Block.outP, 'on');
    this.zeroInpHandling = strcmpi(this.Block.zeroInpHandling, 'on');
    % 12 13
    this.FixptDialog.loadFromBlock;
end % function
