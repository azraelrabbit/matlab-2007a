function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.outSizeT = this.Block.outSizeT;
    this.src_trans = this.Block.src_trans;
    this.translation = this.Block.translation;
    this.maxOffset = this.Block.maxOffset;
    this.fillVal = this.Block.fillVal;
    this.interpMethod = this.Block.interpMethod;
    % 15 16
    this.FixptDialog.loadFromBlock;
end % function
