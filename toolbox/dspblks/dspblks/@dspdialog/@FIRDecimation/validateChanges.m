function errmsg = validateChanges(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    errmsg = '';
    % 10 11
    if eq(this.FilterSource, 0.0)
        % 12 14
        % 13 14
        errmsgtemp = 'The filter coefficients must be a non-empty vector';
        if isempty(this.h)
            errmsg = errmsgtemp;
            return;
        end % if
        % 19 20
        try
            coeffs = eval(this.h);
            [M, N] = size(coeffs);
            if ne(M, 1.0) && ne(N, 1.0)
                errmsg = errmsgtemp;
                return;
            end % if
            % 27 30
            % 28 30
            % 29 30
        end % try
        % 31 33
        % 32 33
        errmsgtemp = 'Decimation factor must be a positive integer';
        if isempty(this.factor)
            errmsg = errmsgtemp;
            return;
        end % if
        % 38 39
        try
            factor = eval(this.factor);
            if isempty(factor) || not(isnumeric(factor)) || not(isreal(factor)) || not(isscalar(factor)) || lt(factor, 1.0) || not(isequal(fix(factor), factor))
                % 42 47
                % 43 47
                % 44 47
                % 45 47
                % 46 47
                errmsg = errmsgtemp;
                return;
            end % if
            % 50 53
            % 51 53
            % 52 53
        end % try
        % 54 55
        if isempty(errmsg)
            errmsg = this.FixptDialog.validateChanges;
        end % if
    end % if
end % function
