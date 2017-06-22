function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if strcmp(this.Block.FilterSource, 'Specify via dialog')
        this.FilterSource = 0.0;
    else
        this.FilterSource = 1.0;
    end % if
    % 14 15
    this.FilterObject = this.Block.FilterObject;
    this.L = this.Block.L;
    this.h = this.Block.h;
    this.M = this.Block.M;
    % 19 20
    this.FixptDialog.loadFromBlock;
end % function
