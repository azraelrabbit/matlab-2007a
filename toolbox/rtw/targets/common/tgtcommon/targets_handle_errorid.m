function targets_handle_errorid(errorspecs)
    % 1 38
    % 2 38
    % 3 38
    % 4 38
    % 5 38
    % 6 38
    % 7 38
    % 8 38
    % 9 38
    % 10 38
    % 11 38
    % 12 38
    % 13 38
    % 14 38
    % 15 38
    % 16 38
    % 17 38
    % 18 38
    % 19 38
    % 20 38
    % 21 38
    % 22 38
    % 23 38
    % 24 38
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 39 40
    if not(strcmp(class(errorspecs), 'struct'))
        error(horzcat('errorspecs argument must be a struct, not ', class(errorspecs)));
    end % if
    % 43 44
    if not(isfield(errorspecs, 'identifier'))
        error('errorspecs must contain field "identifier"');
    end % if
    % 47 48
    if not(isfield(errorspecs, 'rethrowfcn'))
        error('errorspecs must contain field "rethrowfcn"');
    end % if
    % 51 53
    % 52 53
    lerror = lasterror;
    user_msg = targets_get_last_err;
    % 55 56
    for i=1.0:length(errorspecs)
        errorspec = errorspecs(i);
        identifier = errorspec.identifier;
        rethrowfcn = errorspec.rethrowfcn;
        if isempty(identifier)
            error('errorspec.identifier must be non-empty')
        else
            if not(strcmp(class(identifier), 'char'))
                error(horzcat('errorspec.identifier must be a char, not ', class(identifier)));
            end % if
        end % if
        if not(isempty(rethrowfcn))
            if not(strcmp(class(rethrowfcn), 'function_handle'))
                error(horzcat('errorspec.rethrowfcn must be a function handle, not ', class(rethrowfcn)));
            end % if
        end % if
        if strcmp(lerror.identifier, identifier)
            % 73 76
            % 74 76
            % 75 76
            lerror.message = user_msg;
            % 77 78
            if not(isempty(rethrowfcn))
                feval(rethrowfcn, lerror);
                % 80 82
                % 81 82
                return;
            else
                % 84 85
                rethrow(lerror);
            end % if
        end % if
    end % for
    % 89 91
    % 90 91
    rethrow(lerror);
end % function
