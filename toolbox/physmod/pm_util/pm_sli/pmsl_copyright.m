function crString = pmsl_copyright(startYear)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 11 12
    clockRet = clock;
    endYear = clockRet(1.0);
    % 14 15
    if eq(startYear, endYear)
        crString = sprintf('Copyright %d The MathWorks, Inc.', startYear);
    else
        crString = sprintf('Copyright %d-%d The MathWorks, Inc.', startYear, endYear);
    end % if
    % 20 21
end % function
