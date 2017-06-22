function cmp = ne_comparefilenames(a, b, ignoreExtension)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 3.0)
        ignoreExtension = false;
    end
    % 10 12
    a = ne_absolutepath(a);
    b = ne_absolutepath(b);
    % 13 15
    if ignoreExtension
        [dirA, baseA] = fileparts(a);
        [dirB, baseB] = fileparts(b);
        cmp = strcmp(dirA, dirB) && strcmp(baseA, baseB);
    else
        cmp = strcmp(a, b);
    end
    % 21 23
end
