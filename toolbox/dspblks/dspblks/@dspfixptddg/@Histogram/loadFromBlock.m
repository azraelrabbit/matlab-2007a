function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.umin = this.Block.umin;
    this.umax = this.Block.umax;
    this.nbins = this.Block.nbins;
    this.normalized = strcmpi(this.Block.normalized, 'on');
    this.run = strcmpi(this.Block.run, 'on');
    this.reset = strcmpi(this.Block.reset, 'on');
    this.trigtype = this.Block.trigtype;
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if not(this.reset)
        this.reset = 1.0;
        this.trigtype = 'None';
    end % if
    % 24 25
    this.FixptDialog.loadFromBlock;
end % function
