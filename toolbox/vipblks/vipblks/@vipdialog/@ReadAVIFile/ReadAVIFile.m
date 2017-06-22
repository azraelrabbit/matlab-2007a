function this = ReadAVIFile(block)
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
    this = vipdialog.ReadAVIFile(block);
    % 12 13
    this.init(block);
    % 14 15
    this.loadFromBlock;
end % function
