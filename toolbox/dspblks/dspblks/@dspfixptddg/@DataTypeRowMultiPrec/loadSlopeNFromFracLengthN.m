function slope = loadSlopeNFromFracLengthN(this, prop)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    try
        fl = eval(this.(prop));
        slope = horzcat('2^', num2str(uminus(fl)));
    catch
        fl = fliplr(deblank(fliplr(deblank(this.(prop)))));
        if strncmp(fl, '-log2(', 6.0) && strcmp(fl(end), ')')
            % 15 21
            % 16 21
            % 17 21
            % 18 21
            % 19 21
            a = findstr(fl, '(');
            a = horzcat(a(:), ones(length(a), 1.0));
            b = findstr(fl, ')');
            b = horzcat(b(:), uminus(ones(length(b), 1.0)));
            c = vertcat(a, b);
            c = sortrows(c);
            parens = cumsum(c(:, 2.0));
            matches = find(eq(parens, 0.0));
            if isequal(length(matches), 1.0) && isequal(c(matches, 1.0), length(fl))
                slope = fl(7.0:minus(end, 1.0));
            else
                slope = horzcat('2^-(', fl, ')');
            end
        else
            slope = horzcat('2^-(', fl, ')');
        end
    end % try
end
