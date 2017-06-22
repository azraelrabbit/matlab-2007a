function nums = dlgDatatypeRealPoint(dao, propName, numString)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if gt(length(numString), 0.0)
        notNumeric = find(and(and(or(lt(abs(numString), abs('0')), gt(abs(numString), abs('9'))), ne(abs(numString), abs('-'))), ne(abs(numString), abs('.'))));
        % 8 13
        % 9 13
        % 10 13
        % 11 13
        numString(notNumeric) = deal(' ');
        nums = strread(numString, '%f', 'delimiter', ' ');
    else
        nums = [];
    end % if
    % 17 19
    errMsg = xlate('Please enter size values as NxN');
    if lt(length(nums), 1.0)
        % 20 22
        nums = get(dao, propName);
        return;
    else
        if eq(length(nums), 1.0)
            nums = horzcat(nums, nums);
        else
            if gt(length(nums), 2.0)
                nums = nums(1.0:2.0);
            else
                errMsg = '';
            end % if
        end % if
    end % if
    set(dao, propName, nums);
end % function
