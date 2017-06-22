function parseArgs(h, vargs)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    i = 1.0;
    N = numel(vargs);
    if gt(N, 0.0)
        % 30 32
        h.Name = vargs{i};
        i = plus(i, 1.0);
        N = minus(N, 1.0);
    else
        error('uimgr:NameNotSpecified', 'Name must be specified')
    end % if
    if gt(N, 0.0) && isnumeric(vargs{i})
        h.AutoPlacement = false;
        h.ActualPlacement = vargs{i};
        i = plus(i, 1.0);
        N = minus(N, 1.0);
    end % if
    if gt(N, 0.0) && isa(vargs{i}, 'function_handle')
        if not(h.allowWidgetFcnArg)
            error('uimgr:WidgetNotSupported', 'Widget functions are not supported by %s objects.', class(h));
            % 46 49
            % 47 49
        end % if
        h.WidgetFcn = vargs{i};
        i = plus(i, 1.0);
        N = minus(N, 1.0);
    end % if
    if gt(N, 0.0)
        if not(h.isGroup)
            error('uimgr:ChildrenNotAllowed', 'Child objects cannot be attached to %s objects.', class(h));
            % 56 58
        end % if
        % 58 60
        h.add(vargs{i:end})
    end % if
end % function
