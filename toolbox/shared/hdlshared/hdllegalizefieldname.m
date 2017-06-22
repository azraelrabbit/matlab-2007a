function out = hdllegalizefieldname(in)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(in) || not(ischar(in))
        error('Illegal argument to hdllegalizefieldname (must be a string)');
    end % if
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    out = regexprep(in, '&', 'and');
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    out = regexprep(out, '\W', '_');
    % 23 26
    % 24 26
    % 25 26
    out = lower(out);
end % function
