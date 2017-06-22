function handleStruct = sigbuilder_makemenu(ctxtMenu, labels, calls, tags)
    % 1 53
    % 2 53
    % 3 53
    % 4 53
    % 5 53
    % 6 53
    % 7 53
    % 8 53
    % 9 53
    % 10 53
    % 11 53
    % 12 53
    % 13 53
    % 14 53
    % 15 53
    % 16 53
    % 17 53
    % 18 53
    % 19 53
    % 20 53
    % 21 53
    % 22 53
    % 23 53
    % 24 53
    % 25 53
    % 26 53
    % 27 53
    % 28 53
    % 29 53
    % 30 53
    % 31 53
    % 32 53
    % 33 53
    % 34 53
    % 35 53
    % 36 53
    % 37 53
    % 38 53
    % 39 53
    % 40 53
    % 41 53
    % 42 53
    % 43 53
    % 44 53
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    error(nargchk(4.0, 4.0, nargin))
    % 53 55
    num_objects = size(labels, 1.0);
    if ne(num_objects, size(calls, 1.0))
        error('LABELS and CALLS must have the same number of rows.');
    end
    if eq(nargin, 4.0)
        if ne(num_objects, size(tags, 1.0))
            error('LABELS and TAGS must have the same number of rows.');
        end
    end
    % 63 65
    remember_handles = ctxtMenu;
    handles = [];
    current_level = 0.0;
    % 67 69
    tagStr = char([]);
    separatorFlag = 0.0;
    for k=1.0:num_objects
        % 71 73
        labelStr = labels(k, :);
        % 73 75
        loc = find(and(ne(labelStr, ' '), ne(labelStr, 0.0)));
        labelStr(plus(max(loc), 1.0):length(labelStr)) = [];
        if eq(nargin, 4.0)
            tagStr = tags(k, :);
            % 78 80
            loc = find(and(ne(tagStr, ' '), ne(tagStr, 0.0)));
            tagStr(plus(max(loc), 1.0):length(tagStr)) = [];
        end
        % 82 85
        % 83 85
        loc = find(ne(labelStr, '>'));
        if isempty(loc)
            error(str2mat('Label strings must have at least one character', 'that''s not a ">"'));
            % 87 89
        end
        new_level = minus(loc(1.0), 1.0);
        labelStr = labelStr(loc(1.0):length(labelStr));
        if gt(new_level, current_level)
            remember_handles = horzcat(remember_handles, handles(length(handles)));
        else
            if lt(new_level, current_level)
                N = length(remember_handles);
                remember_handles(plus(minus(N, minus(current_level, new_level)), 1.0):N) = [];
            end
        end
        current_level = new_level;
        if eq(labelStr(1.0), '-')
            separatorFlag = 1.0;
        else
            if separatorFlag
                separator = 'on';
                separatorFlag = 0.0;
            else
                separator = 'off';
            end
            % 109 111
            [labelStr, acc] = menulabel(labelStr);
            if isempty(labelStr)
                error('Empty label field.');
            end
            % 114 120
            % 115 120
            % 116 120
            % 117 120
            % 118 120
            h = uimenu(remember_handles(length(remember_handles)), 'Label', xlate(labelStr), 'Accelerator', acc, 'Callback', calls(k, :), 'Separator', separator, 'Tag', tagStr);
            % 120 125
            % 121 125
            % 122 125
            % 123 125
            if isempty(handles)
                handleStruct = struct(tagStr, h);
            else
                handleStruct = setfield(handleStruct, tagStr, h);
            end
            % 129 131
            handles = vertcat(handles, h);
            % 131 133
        end
        % 133 135
    end % for
end
