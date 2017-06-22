function out = convertfreq(h, in, throwmsg)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if lt(nargin, 3.0)
        throwmsg = true;
    end % if
    out = in;
    ckt = get(h, 'OriginalCkt');
    out = convertfreq(ckt, in, throwmsg);
end % function
