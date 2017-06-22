function alg = signlms(stepSize, algType)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    error(nargchk(0.0, 2.0, nargin));
    % 11 13
    alg = adaptalg.signlms;
    % 13 15
    validAlgTypes = {'Sign LMS','Signed Regressor LMS','Sign Sign LMS'};
    % 15 18
    % 16 18
    if ge(nargin, 1.0)
        alg.StepSize = stepSize;
    end % if
    if eq(nargin, 2.0)
        [ismem, idx] = ismember(lower(algType), lower(validAlgTypes));
        if ismem
            alg.AlgType = validAlgTypes{idx};
        else
            error('comm:adaptalg:signlms:AlgType', 'ALGTYPE must be one of the following: ''Sign LMS'', ''Signed Regressor LMS'', ''Sign Sign LMS''');
            % 26 28
        end % if
    else
        alg.AlgType = validAlgTypes{1.0};
    end % if
end % function
