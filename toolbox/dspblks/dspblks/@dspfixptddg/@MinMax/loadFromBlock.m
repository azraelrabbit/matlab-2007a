function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.fcn = this.Block.fcn;
    this.reset = this.Block.reset;
    this.operateOver = this.Block.operateOver;
    this.indexBase = this.Block.indexBase;
    this.colComp = strcmpi(this.Block.colComp, 'on');
    this.FixptDialog.loadFromBlock;
    this.MaskType = this.Block.MaskType;
end % function
