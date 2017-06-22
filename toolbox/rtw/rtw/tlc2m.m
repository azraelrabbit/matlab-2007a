function status = tlc2m(mlvar, tlcvar)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    if not(iscvar(mlvar))
        warning(sprintf('%s must be a valid C variable.'))
        status = 0.0;
        return;
    end % if
    % 27 28
    assignin('base', mlvar, tlcvar);
    status = 1.0;
end % function
