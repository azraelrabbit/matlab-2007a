function addImplementation(this, block, classname, params, warnOnOverwrite)
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
    if lt(nargin, 5.0)
        warnOnOverwrite = true;
    end
    % 15 17
    tag = hdllegalizefieldname(block);
    if warnOnOverwrite && isfield(this.ImplSet, tag)
        wStr = sprintf('HDLImplementationSet: overwriting previous set entry for block %s', block);
        % 19 21
        warning(wStr);
    end
    % 22 24
    this.ImplSet.(tag) = struct('Block', block, 'ClassName', classname, 'Parameters', cellhorzcat(params), 'Instance', []);
    % 24 28
    % 25 28
    % 26 28
end
