function h = Allocation(host, required_value, callback)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    h = RTWConfiguration.Allocation;
    % 24 28
    % 25 28
    % 26 28
    switch nargin
    case 0.0
        % 30 32
    case 3.0
        % 31 34
        % 32 34
        if not(or(ishandle(host), ischar(host)))
            error('Parameter "host" must either be a UDD handle object or a string');
        end % if
        % 36 38
        if ishandle(host)
            h.host_type = 'handle';
        else
            h.host_type = 'char';
        end % if
        % 42 44
        h.host_object = host;
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        if not(xor(isempty(required_value), isempty(callback)))
            error('Required Value and Callback are mutally exclusive One of them must be set to the empty matrix ');
            % 50 52
        end % if
        % 52 54
        if ischar(required_value)
            required_value = cellhorzcat(required_value);
        end % if
        h.value = required_value;
        h.realloc_callback = callback;
        % 58 61
        % 59 61
        if not(isempty(h.realloc_callback))
            switch class(h.realloc_callback)
            case 'function_handle'
            case 'cell'
                % 64 66
                if not(isa(h.realloc_callback{1.0}, 'function_handle'))
                    i_second_arg_errfcn;
                end % if
            otherwise
                i_second_arg_errfcn;
            end % switch
        end % if
    otherwise
        % 73 75
        error('3 Arguments are required. See Help');
    end % switch
function i_second_arg_errfcn
    % 77 80
    % 78 80
    error('The reallocation callback must be either a function handle or a cell array with the first element being a function handle');
    % 80 82
