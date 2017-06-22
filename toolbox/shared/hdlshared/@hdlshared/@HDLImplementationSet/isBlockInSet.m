function here = isBlockInSet(this, block)
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
    tag = hdllegalizefieldname(block);
    here = isfield(this.ImplSet, tag);
end % function
