function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.lpf = this.Block.lpf;
    this.hpf = this.Block.hpf;
    this.framing = this.Block.framing;
    % 12 13
    this.FixptDialog.loadFromBlock;
end % function
