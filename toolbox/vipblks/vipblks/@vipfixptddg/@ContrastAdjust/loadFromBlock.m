function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.methodInputRange = this.Block.methodInputRange;
    this.rangeIn = this.Block.rangeIn;
    this.fracSaturate = this.Block.fracSaturate;
    this.isBinNum = strcmpi(this.Block.isBinNum, 'on');
    this.binNum = this.Block.binNum;
    this.methodOutputRange = this.Block.methodOutputRange;
    this.rangeOut = this.Block.rangeOut;
    % 16 17
    this.FixptDialog.loadFromBlock;
end % function
