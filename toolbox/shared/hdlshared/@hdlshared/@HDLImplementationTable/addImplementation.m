function addImplementation(this, path, block, classname, params, warnOnOverwrite)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if lt(nargin, 6.0)
        warnOnOverwrite = true;
    end
    % 16 18
    pathtag = hdllegalizefieldname(path);
    if ~(isfield(this.Sets, pathtag))
        % 19 21
        this.Sets.(pathtag).Path = path;
        this.Sets.(pathtag).Set = hdlshared.HDLImplementationSet;
    end
    % 23 25
    implSet = this.Sets.(pathtag).Set;
    implSet.addImplementation(block, classname, params, warnOnOverwrite);
end
