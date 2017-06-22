function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.winmode = this.Block.winmode;
    this.wintype = this.Block.wintype;
    this.sampmode = this.Block.sampmode;
    this.samptime = this.Block.samptime;
    this.N = this.Block.N;
    this.Rs = this.Block.Rs;
    this.beta = this.Block.beta;
    this.numSidelobes = this.Block.numSidelobes;
    this.sidelobeLevel = this.Block.sidelobeLevel;
    this.winsamp = this.Block.winsamp;
    this.UserWindow = this.Block.UserWindow;
    this.OptParams = strcmpi(this.Block.OptParams, 'on');
    this.UserParams = this.Block.UserParams;
    % 22 24
    % 23 24
    this.dataType = this.Block.dataType;
    this.isSigned = strcmpi(this.Block.isSigned, 'on');
    this.wordLen = this.Block.wordLen;
    this.udDataType = this.Block.udDataType;
    this.fracBitsMode = this.Block.fracBitsMode;
    this.numFracBits = this.Block.numFracBits;
    % 30 31
    this.FixptDialog.loadFromBlock;
end % function
