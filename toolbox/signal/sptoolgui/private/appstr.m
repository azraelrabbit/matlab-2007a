function outstr = appstr(instr, app)
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
    if eq(length(instr), 0.0)
        outstr = app;
    else
        ind = length(instr);
        sep = ' ';
            while eq(instr(ind), ' ')
            ind = minus(ind, 1.0);
        end % while
        if ne(instr(ind), ';')
            sep = ',';
        end % if
        outstr = horzcat(instr, sep, app);
    end % if
end % function
