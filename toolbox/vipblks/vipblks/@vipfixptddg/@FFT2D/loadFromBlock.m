function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.TableOpt = this.Block.TableOpt;
    this.BitRevOrder = strcmpi(this.Block.BitRevOrder, 'on');
    % 11 12
    this.FixptDialog.loadFromBlock;
end % function
