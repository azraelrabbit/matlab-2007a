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
    this.run = strcmpi(this.Block.run, 'on');
    this.reset_popup = this.Block.reset_popup;
    % 12 14
    % 13 14
    this.roiEnable = strcmpi(this.Block.roiEnable, 'on');
    this.roiType = this.Block.roiType;
    this.roiPortion = this.Block.roiPortion;
    this.roiOutput = this.Block.roiOutput;
    this.roiFlag = strcmpi(this.Block.roiFlag, 'on');
end % function
