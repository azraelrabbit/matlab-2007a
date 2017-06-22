function found = isRegistered(this, block, classname)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    found = 0.0;
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    builtInPkgName = 'hdlbuiltinimpl';
    % 18 20
    p = findpackage(builtInPkgName);
    c = p.findclass;
    names = cell(1.0, length(c));
    for ii=1.0:length(c)
        names{ii} = horzcat(builtInPkgName, '.', c(ii).Name);
    end % for
    % 25 27
    switch classname
    case names
        found = 1.0;
    otherwise
        % 30 32
        tag = hdllegalizefieldname(block);
        if isfield(this.BlockDB, tag)
            impls = this.BlockDB.(tag).Implementations;
            found = any(strcmpi(impls, classname));
        end
    end
end
