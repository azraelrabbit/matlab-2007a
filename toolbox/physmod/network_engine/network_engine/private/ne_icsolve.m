function [status, xic, c_err_id, c_err_string] = ne_icsolve(sys, tin, xin, uin, fnormtol, maxiter, maxprobe, doDC, dcEps)
    % 1 34
    % 2 34
    % 3 34
    % 4 34
    % 5 34
    % 6 34
    % 7 34
    % 8 34
    % 9 34
    % 10 34
    % 11 34
    % 12 34
    % 13 34
    % 14 34
    % 15 34
    % 16 34
    % 17 34
    % 18 34
    % 19 34
    % 20 34
    % 21 34
    % 22 34
    % 23 34
    % 24 34
    % 25 34
    % 26 34
    % 27 34
    % 28 34
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    if lt(nargin, 5.0) || isempty(fnormtol)
        fnormtol = sqrt(2.220446049250313e-16);
    end % if
    if lt(nargin, 6.0) || isempty(maxiter)
        maxiter = 20.0;
    end % if
    if lt(nargin, 7.0) || isempty(maxprobe)
        maxprobe = 40.0;
    end % if
    if lt(nargin, 8.0) || isempty(doDC)
        doDC = 0.0;
    end % if
    if lt(nargin, 9.0) || isempty(dcEps)
        dcEps = 1e-08;
    end % if
    % 49 52
    % 50 52
    % 51 52
    sys.AnalysisType = 'dc';
    [status, xic, c_err_id, c_err_string] = ne_icsolve_internal(sys, tin, xin, uin, fnormtol, maxiter, maxprobe, false, 0.0);
    % 54 55
    sys.AnalysisType = 'tr';
    if eq(status, 0.0) && doDC
        [status, xic, c_err_id, c_err_string] = ne_icsolve_internal(sys, tin, xic, uin, fnormtol, maxiter, maxprobe, true, dcEps);
        % 58 59
    end % if
end % function
