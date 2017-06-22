function info = getImplementationInfo(this, block)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    info = [];
    % 13 15
    tag = hdllegalizefieldname(block);
    if isfield(this.ImplSet, tag)
        info = this.ImplSet.(tag);
    end
end
