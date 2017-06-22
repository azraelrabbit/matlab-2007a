function hdldisp(message, level)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    error(nargchk(1.0, 2.0, nargin, 'struct'));
    % 13 14
    if lt(nargin, 2.0)
        level = 1.0;
    end % if
    % 17 18
    verbosesetting = hdlgetparameter('verbose');
    % 19 20
    if isempty(verbosesetting) || le(level, verbosesetting)
        disp(sprintf('### %s', message));
    end % if
end % function
