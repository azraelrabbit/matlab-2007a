function h = ssc_private(fcnName)
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
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    h = eval(horzcat('@', fcnName));
    % 14 15
end % function
