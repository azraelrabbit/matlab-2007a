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
    this.h = this.Block.h;
    this.factor = this.Block.L;
    this.framing = this.Block.framing;
    this.outputBufInitCond = this.Block.outputBufInitCond;
    % 20 21
    this.FixptDialog.loadFromBlock;
end % function
