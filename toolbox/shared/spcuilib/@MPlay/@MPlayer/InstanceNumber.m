function y = InstanceNumber(mplayObj, mode)
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
    persistent instance_numbers;
    % 14 16
    switch mode
    case 'alloc'
        % 17 19
        y = find(not(horzcat(instance_numbers, 0.0)), 1.0);
        % 19 21
        instance_numbers(y) = 1.0;
        mplayObj.instance = y;
    case 'free'
        % 23 26
        % 24 26
        y = mplayObj.instance;
        if lt(y, 1.0) || gt(y, numel(instance_numbers))
            MPlay.errorHandler(sprintf('Instance number (%d) out of range.', y));
        end
        instance_numbers(y) = 0.0;
    case 'count'
        % 31 34
        % 32 34
        y = sum(instance_numbers);
    otherwise
        % 35 37
        error('Unrecognized option %s', mode);
    end
end
