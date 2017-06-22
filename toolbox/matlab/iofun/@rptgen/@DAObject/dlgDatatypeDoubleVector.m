function nums = dlgDatatypeDoubleVector(dao, propName, numString)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isempty(numString)
        nums = [];
    else
        nums = str2num(numString);
        if isempty(nums)
            % 15 16
            nums = get(dao, propName);
        else
            nums = ctranspose(real(nums(:)));
        end % if
    end % if
    % 21 22
    set(dao, propName, nums);
end % function
