function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.specify = this.Block.specify;
    this.rfactor = this.Block.rfactor;
    this.outCols = this.Block.outCols;
    this.outRows = this.Block.outRows;
    this.outRowsCols = this.Block.outRowsCols;
    this.interp_method = this.Block.interp_method;
    this.antialias = strcmpi(this.Block.antialias, 'on');
    this.useROI = strcmpi(this.Block.useROI, 'on');
    this.roiFlag = strcmpi(this.Block.roiFlag, 'on');
    % 18 19
    this.FixptDialog.loadFromBlock;
end % function
