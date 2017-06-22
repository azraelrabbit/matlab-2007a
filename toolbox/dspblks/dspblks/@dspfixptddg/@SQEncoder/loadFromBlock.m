function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.paramSrc = this.Block.paramSrc;
    this.partType = this.Block.partType;
    this.BBoundary = this.Block.BBoundary;
    this.UBoundary = this.Block.UBoundary;
    this.SearchMethod = this.Block.SearchMethod;
    this.tieBreakRule = this.Block.tieBreakRule;
    this.outQU = strcmpi(this.Block.outQU, 'on');
    this.outQError = strcmpi(this.Block.outQError, 'on');
    this.codebook = this.Block.codebook;
    this.outStatus = strcmpi(this.Block.outStatus, 'on');
    this.invalidin = this.Block.invalidin;
    this.idtype = this.Block.idtype;
    % 21 22
    this.FixptDialog.loadFromBlock;
end % function
