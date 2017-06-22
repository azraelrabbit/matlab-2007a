function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.CBsource = this.Block.CBsource;
    this.codebook = this.Block.codebook;
    this.distMeasure = this.Block.distMeasure;
    this.wgtSrc = this.Block.wgtSrc;
    this.weights = this.Block.weights;
    this.tieBreakRule = this.Block.tieBreakRule;
    this.outQU = strcmpi(this.Block.outQU, 'on');
    this.outQError = strcmpi(this.Block.outQError, 'on');
    this.idtype = this.Block.idtype;
    % 18 19
    this.FixptDialog.loadFromBlock;
end % function
