function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.output = this.Block.output;
    this.method = this.Block.method;
    this.roi = strcmpi(this.Block.roi, 'on');
    this.invalidROI = this.Block.invalidROI;
    this.nearbyPel = strcmpi(this.Block.nearbyPel, 'on');
    this.nearbySize = this.Block.nearbySize;
    % 15 16
    this.FixptDialog.loadFromBlock;
end % function
