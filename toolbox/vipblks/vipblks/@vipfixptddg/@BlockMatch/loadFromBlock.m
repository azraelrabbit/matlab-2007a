function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.which2img = this.Block.which2img;
    this.N = this.Block.N;
    this.searchMethod = this.Block.searchMethod;
    this.blockSize = this.Block.blockSize;
    this.overlapping = this.Block.overlapping;
    this.maxDisplacement = this.Block.maxDisplacement;
    this.matchCriteria = this.Block.matchCriteria;
    this.outVelForm = this.Block.outVelForm;
    % 17 18
    this.FixptDialog.loadFromBlock;
end % function
