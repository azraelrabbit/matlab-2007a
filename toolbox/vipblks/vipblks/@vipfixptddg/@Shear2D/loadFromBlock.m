function loadFromBlock(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this.direction = this.Block.direction;
    this.outSizeS = this.Block.outSizeS;
    this.src_shear = this.Block.src_shear;
    this.shear_values = this.Block.shear_values;
    this.maxShear = this.Block.maxShear;
    this.fillVal = this.Block.fillVal;
    this.interpMethod = this.Block.interpMethod;
    this.FixptDialog.loadFromBlock;
end % function
