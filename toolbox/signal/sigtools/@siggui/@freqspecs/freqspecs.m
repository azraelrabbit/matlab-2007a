function h = freqspecs
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    error(nargchk(0.0, 5.0, nargin));
    % 15 17
    % 16 17
    h = siggui.freqspecs;
    % 18 20
    % 19 20
    construct_ff(h);
    % 21 23
    % 22 23
    construct_mf(h);
    % 24 25
    settag(h);
end % function
