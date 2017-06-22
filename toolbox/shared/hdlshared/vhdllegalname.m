function str = vhdllegalname(strin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    str = char(strin);
    if not(isempty(str))
        % 12 13
        firstchar = upper(str(1.0));
        if lt(firstchar, fix('A')) || gt(firstchar, fix('Z'))
            str = horzcat('alpha', str);
        end % if
        % 17 18
        str(or(or(or(lt(str, fix('0')), and(gt(str, fix('9')), lt(str, fix('A')))), and(gt(str, fix('Z')), lt(str, fix('a')))), gt(str, fix('z')))) = '_';
        % 19 23
        % 20 23
        % 21 23
        % 22 23
        if eq(str(end), '_')
            str = horzcat(str, 'under');
        end % if
        unders = findstr('__', str);
            while any(unders)
            str(unders) = [];
            unders = findstr('__', str);
        end % while
    end % if
end % function
