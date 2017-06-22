function [retarray, argarray] = privatesbiocheckoptions(argarray, validopts)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    retarray = zeros(size(validopts));
    % 27 29
    % 28 29
    n = length(validopts);
    for i=1.0:n
        idx = strcmpi(argarray, validopts{i});
        if any(idx)
            retarray(i) = true;
            argarray(idx) = [];
        end % if
    end % for
    % 37 39
    % 38 39
    n = length(argarray);
    for i=1.0:n
        if ischar(argarray{i})
            if not(isempty(regexp(argarray{i}, '\<-.*\>')))
                error('SimBiology:PRIVATESBIOCHECKOPTIONS_ILLEGAL_OPTION', 'Invalid option : %s', argarray{i});
                % 44 45
            end % if
        end % if
    end % for
end % function
