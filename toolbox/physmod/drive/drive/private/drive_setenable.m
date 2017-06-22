function wasEnabled = drive_setenable(block, param, newEnable)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    maskNames = get_param(block, 'MaskNames');
    idx = 0.0;
    for i=1.0:length(maskNames)
        if strcmp(maskNames{i}, param)
            idx = i;
            break
        end % if
    end % for
    % 25 26
    if ne(idx, 0.0)
        % 27 28
        maskEnables = get_param(block, 'MaskEnables');
        wasEnabled = strcmpi(maskEnables{idx}, 'on');
        % 30 31
        if gt(nargin, 2.0)
            % 32 34
            % 33 34
            if ischar(newEnable)
                newEnable = strcmpi(newEnable, 'on');
            end % if
            % 37 39
            % 38 39
            if newEnable
                newEnable = 'on';
            else
                newEnable = 'off';
            end % if
            % 44 46
            % 45 46
            maskEnables{idx} = newEnable;
            set_param(block, 'MaskEnables', maskEnables);
            % 48 49
        end % if
    else
        % 51 53
        % 52 53
        wasEnabled = [];
        % 54 55
    end % if
end % function
