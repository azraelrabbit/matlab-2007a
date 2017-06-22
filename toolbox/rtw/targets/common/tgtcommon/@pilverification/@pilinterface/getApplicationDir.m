function applicationDir = getApplicationDir(h)
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
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 12 14
    % 13 14
    if h.generatedAlgorithm
        % 15 16
        [rootModel, sysPath] = h.getSystemPath;
        % 17 21
        % 18 21
        % 19 21
        % 20 21
        algorithmDir = h.a_getCodeGenDir(rootModel, sysPath);
    else
        error('Custom algorithm not yet supported.');
        % 24 26
        % 25 26
    end % if
    % 27 30
    % 28 30
    % 29 30
    applicationDir = h.a_getApplicationDir(algorithmDir);
end % function
