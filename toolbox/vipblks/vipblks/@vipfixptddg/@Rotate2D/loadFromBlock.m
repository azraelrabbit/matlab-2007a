function loadFromBlock(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.outSizeR = this.Block.outSizeR;
    this.src_angle = this.Block.src_angle;
    this.angle = this.Block.angle;
    this.maxAngle = this.Block.maxAngle;
    this.dispImage = this.Block.dispImage;
    this.method = this.Block.method;
    this.fillVal = this.Block.fillVal;
    this.interpMethod = this.Block.interpMethod;
    % 17 18
    this.FixptDialog.loadFromBlock;
end % function
