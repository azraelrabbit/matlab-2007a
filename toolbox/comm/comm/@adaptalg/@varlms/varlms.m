function alg = varlms(initStep, incStep, minStep, maxStep)
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
    error(nargchk(0.0, 4.0, nargin));
    % 13 15
    alg = adaptalg.varlms;
    alg.AlgType = 'Variable Step Size LMS';
    % 16 18
    if ge(nargin, 1.0)
        alg.InitStep = initStep;
    end % if
    if ge(nargin, 2.0)
        alg.IncStep = incStep;
    end % if
    if ge(nargin, 3.0)
        alg.MinStep = minStep;
    end % if
    if eq(nargin, 4.0)
        alg.MaxStep = maxStep;
    end % if
    reset(alg);
end % function
