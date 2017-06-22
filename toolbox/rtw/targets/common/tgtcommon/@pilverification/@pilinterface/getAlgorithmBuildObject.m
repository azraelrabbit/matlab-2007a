function algBuildObject = getAlgorithmBuildObject(h)
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
        % 17 19
        % 18 19
        algBuildObject = h.a_getAlgorithmBuildObject(rootModel, sysPath);
    else
        error('Custom algorithm not yet supported.');
        % 22 24
        % 23 24
    end % if
end % function
