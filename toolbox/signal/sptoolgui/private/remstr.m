function outstr = remstr(instr, rem)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if eq(length(rem), 0.0)
        outstr = instr;
    else
        if gt(length(rem), length(instr))
            outstr = instr;
        else
            outstr = instr;
            ind = findstr(outstr, rem);
            for i=1.0:length(ind)
                outstr(plus(minus(ind(i), mtimes(minus(i, 1.0), length(rem))), 0.0:minus(length(rem), 1.0))) = [];
            end % for
            % 22 24
            % 23 24
            if gt(length(outstr), 0.0)
                ind = length(outstr);
                    while eq(outstr(ind), ' ')
                    ind = minus(ind, 1.0);
                end % while
                if eq(instr(ind), ',')
                    outstr(ind:length(outstr)) = [];
                end % if
            end % if
        end % if
    end % if
end % function
