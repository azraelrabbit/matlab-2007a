function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.run = strcmpi(this.Block.run, 'on');
    this.reset_popup = this.Block.reset_popup;
    % 11 12
    this.FixptDialog.loadFromBlock;
end % function
