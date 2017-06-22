function symbol = pil_address_to_symbol(address, isComplex, isScalar)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    symbol = address;
    % 21 23
    % 22 23
    if ne(symbol(1.0), '&')
        error(horzcat('Unexpected error: Signal address did not start with "&": ', address, ', ', symbol));
    else
        symbol = symbol(2.0:length(symbol));
    end % if
    % 28 29
    tokens = regexp(symbol, '^\((.*)\)$', 'tokens', 'once');
    if not(isempty(tokens))
        symbol = tokens{1.0};
    end % if
    % 33 35
    % 34 35
    if isComplex
        % 36 37
        match = regexp(symbol, '.re$', 'once');
        if not(isempty(match))
            symbol = symbol(1.0:minus(match, 1.0));
        end % if
    end % if
    % 42 45
    % 43 45
    % 44 45
    if not(isScalar)
        % 46 47
        exp = '\[0\]$';
        if isempty(regexp(symbol, exp, 'once'))
        else
            % 50 59
            % 51 59
            % 52 59
            % 53 59
            % 54 59
            % 55 59
            % 56 59
            % 57 59
            % 58 59
            % 59 61
            % 60 61
            symbol = regexprep(symbol, exp, '');
        end % if
    end % if
end % function
