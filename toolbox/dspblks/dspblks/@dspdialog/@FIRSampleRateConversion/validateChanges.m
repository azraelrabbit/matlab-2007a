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
        % 12 13
        try
            L = eval(this.L);
            if isempty(L) || lt(L, 1.0) || ne(fix(L), L) || not(isreal(L))
                errmsg = 'Interpolation factor must be a real positive integer';
                return;
            end % if
            % 19 22
            % 20 22
            % 21 22
        end % try
        % 23 25
        % 24 25
        try
            M = eval(this.M);
            if isempty(M) || lt(M, 1.0) || ne(fix(M), M) || not(isreal(M))
                errmsg = 'Decimation factor must be a real positive integer';
                return;
            end % if
            % 31 34
            % 32 34
            % 33 34
        end % try
        % 35 37
        % 36 37
        try
            h = eval(this.h);
            [numRows, numCols] = size(h);
            if ne(numRows, 1.0) && ne(numCols, 1.0)
                errmsg = 'The filter coefficients must be a non-empty vector';
                return;
            end % if
            % 44 47
            % 45 47
            % 46 47
        end % try
        % 48 49
        if isempty(errmsg)
            errmsg = this.FixptDialog.validateChanges;
        end % if
    end % if
end % function
