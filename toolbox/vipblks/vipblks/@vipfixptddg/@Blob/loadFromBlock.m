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
    this.area = strcmpi(this.Block.area, 'on');
    this.centroid = strcmpi(this.Block.centroid, 'on');
    this.bBox = strcmpi(this.Block.bBox, 'on');
    this.majorAxis = strcmpi(this.Block.majorAxis, 'on');
    this.minorAxis = strcmpi(this.Block.minorAxis, 'on');
    this.angle = strcmpi(this.Block.angle, 'on');
    this.eccentricity = strcmpi(this.Block.eccentricity, 'on');
    this.equivDiameterSq = strcmpi(this.Block.equivDiameterSq, 'on');
    this.extent = strcmpi(this.Block.extent, 'on');
    this.perimeter = strcmpi(this.Block.perimeter, 'on');
    % 20 21
    this.maxBlobs = this.Block.maxBlobs;
    this.warnIfNumBlobsExceeded = strcmpi(this.Block.warnIfNumBlobsExceeded, 'on');
    this.isCount = strcmpi(this.Block.isCount, 'on');
    % 24 25
    this.useMinArea = strcmpi(this.Block.useMinArea, 'on');
    this.minArea = this.Block.minArea;
    this.useMaxArea = strcmpi(this.Block.useMaxArea, 'on');
    this.maxArea = this.Block.maxArea;
    this.excludeBorderBlob = strcmpi(this.Block.excludeBorderBlob, 'on');
    % 30 31
    this.outDT = this.Block.outDT;
    this.isFill = strcmpi(this.Block.isFill, 'on');
    this.fillValues = this.Block.fillValues;
    % 34 35
    this.conn = this.Block.conn;
    this.isLabel = strcmpi(this.Block.isLabel, 'on');
    % 37 38
    this.FixptDialog.loadFromBlock;
end % function
