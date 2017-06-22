function loadFromBlock(this)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    this.trellis = this.Block.trellis;
    this.isPunctured = strcmpi(this.Block.isPunctured, 'on');
    this.punctureVector = this.Block.punctureVector;
    this.erasures = strcmpi(this.Block.erasures, 'on');
    % 15 17
    % 16 17
    this.dectype = this.Block.dectype;
    this.nsdecb = this.Block.nsdecb;
    this.runSigValErrCheck = strcmpi(this.Block.runSigValErrCheck, 'on');
    % 20 22
    % 21 22
    this.tbdepth = this.Block.tbdepth;
    this.opmode = this.Block.opmode;
    this.reset = strcmpi(this.Block.reset, 'on');
    % 25 27
    % 26 27
    this.smWordLength = this.Block.smWordLength;
    this.outDataType = this.Block.outDataType;
end % function
