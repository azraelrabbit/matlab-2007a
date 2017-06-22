function output = optstr_struct(str)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    output = [];
    % 9 10
    if isempty(str)
        return;
    end % if
    % 13 14
    r = str;
    j = 1.0;
    while 1
        [t, r] = strtok(r);
        equals = findstr(t, '=');
        dasha = findstr(t, '-a');
        % 20 21
        if not(isempty(equals)) && not(isempty(dasha))
            % 22 23
            equals = equals(1.0);
            dasha = dasha(1.0);
            % 25 26
            fieldName = t(plus(dasha, 2.0):minus(equals, 1.0));
            % 27 30
            % 28 30
            % 29 30
            if not(isempty(equals)) && ge(length(t), plus(equals, 1.0)) && isequal(t(plus(equals, 1.0)), '"')
                % 31 42
                % 32 42
                % 33 42
                % 34 42
                % 35 42
                % 36 42
                % 37 42
                % 38 42
                % 39 42
                % 40 42
                % 41 42
                sptrue = eq(length(t), plus(equals, 1.0));
                % 43 45
                % 44 45
                eqtrue = 0.0;
                s = regexp(t, '\\"');
                if not(isempty(s))
                    eqtrue = eq(s(end), minus(length(t), 1.0));
                end % if
                % 50 52
                % 51 52
                nqtrue = not(isequal(t(end), '"'));
                % 53 54
                if sptrue || eqtrue || nqtrue
                    % 55 56
                    k = regexp(r, '[^\\]"', 'once');
                    if not(isempty(k))
                        % 58 59
                        k = plus(k, 1.0);
                        t = strcat(t, r(1.0:k));
                        r = r(plus(k, 1.0):end);
                    end % if
                end % if
            end % if
            % 65 66
            fieldValue = t(plus(equals, 1.0):end);
            output(j).name = fieldName;
            output(j).value = fieldValue;
            output(j).enable = 'on';
            j = plus(j, 1.0);
        end % if
        % 72 73
        if isempty(r)
            break
        end % if
    end % while
end % function
