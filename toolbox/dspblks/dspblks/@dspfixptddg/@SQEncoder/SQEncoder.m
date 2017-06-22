function this = SQEncoder(block, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspfixptddg.SQEncoder(block);
    % 11 12
    this.init(block);
    % 13 14
    this.FixptDialog = dspfixptddg.FixptDialog(this, {});
    % 15 16
    this.loadFromBlock;
end % function
