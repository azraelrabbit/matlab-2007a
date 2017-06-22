function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.MaxLength = this.Block.MaxLength;
    this.Fc = this.Block.Fc;
    this.Ts = this.Block.Ts;
    this.Zs = this.Block.Zs;
    this.NoiseFlag = strcmpi(this.Block.NoiseFlag, 'on');
    this.seed = this.Block.seed;
end % function
