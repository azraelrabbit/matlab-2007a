function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.NormType = this.Block.NormType;
    this.Bias = this.Block.Bias;
    this.NormOver = this.Block.NormOver;
    this.ColComp = strcmpi(this.Block.colComp, 'on');
    this.Dimension = this.Block.Dimension;
    % 14 15
    this.FixptDialog.loadFromBlock;
end % function
