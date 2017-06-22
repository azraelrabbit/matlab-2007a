function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.padSigAt = this.Block.padSigAt;
    this.zpadAlong = this.Block.zpadAlong;
    this.padNumOutRowsSpecMethod = this.Block.padNumOutRowsSpecMethod;
    this.numOutRows = this.Block.numOutRows;
    this.padNumOutColsSpecMethod = this.Block.padNumOutColsSpecMethod;
    this.numOutCols = this.Block.numOutCols;
    this.truncOrWrapMode = this.Block.truncOrWrapMode;
    this.trunc_flag = this.Block.trunc_flag;
    this.wrap_flag = this.Block.wrap_flag;
    % 18 20
    % 19 20
    this.FixptDialog.loadFromBlock;
end % function
