function this = MatrixViewer(block, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this = dspdialog.MatrixViewer(block);
    this.init(block);
    this.loadFromBlock;
end % function
