function algBuildObject = a_getAlgorithmBuildObject(h, rootModel, systemPath)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    error(nargchk(3.0, 3.0, nargin, 'struct'));
    % 17 18
    try
        algBuildObject = h.p_dispatch('getAlgorithmBuildObject', rootModel, systemPath);
    catch
        % 21 22
        % 22 23
        le = lasterror;
        error(pil_get_error_id('errorAGetAlgorithmBuildObject'), '%s', le.message);
        % 25 26
    end % try
end % function
