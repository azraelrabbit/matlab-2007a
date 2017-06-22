function idxopt = getDefIdxOpt(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    block = this.getBlock;
    lstIdxOpts = block.getPropAllowedValues('IdxOptString');
    % 8 9
    idxopt = lstIdxOpts{2.0};
    % 10 11
end % function
