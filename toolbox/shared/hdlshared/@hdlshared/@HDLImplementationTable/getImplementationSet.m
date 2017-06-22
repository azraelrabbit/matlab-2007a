function set = getImplementationSet(this, path)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    set = [];
    % 11 13
    pathtag = hdllegalizefieldname(path);
    if isfield(this.Sets, pathtag)
        set = this.Sets.(pathtag).Set;
    end
end
