function loadFromBlock(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this.P = this.Block.P;
    this.seed = this.Block.seed;
    this.Ts = this.Block.Ts;
    this.frameBased = strcmpi(this.Block.frameBased, 'on');
    this.sampPerFrame = this.Block.sampPerFrame;
    this.orient = strcmpi(this.Block.orient, 'on');
    this.outDataType = this.Block.outDataType;
end % function
