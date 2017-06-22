function result = mech_detectNonVirtualBoundaries(input)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hdls = get_param(input, 'Handle');
    hdls = horzcat(hdls{:});
    hdls = sort(hdls(:));
    % 12 14
    depth = local_computeDepth(hdls);
    % 14 16
    maxdepth = max(depth);
    parents = hdls;
    % 17 19
    result = [];
    maps = [];
    for i=maxdepth:-1.0:1.0
        % 21 25
        % 22 25
        % 23 25
        current = find(eq(depth, i));
        parents(current) = local_GetParents(parents(current));
        depth(current) = minus(depth(current), 1.0);
        % 27 32
        % 28 32
        % 29 32
        % 30 32
        first = parents(1.0);
        if all(eq(parents, first))
            result = [];
            return
        end
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        non_virtual = zeros(length(parents), 1.0);
        non_virtual(current) = local_IsNonVirtual(parents(current));
        if any(non_virtual)
            result = hdls(find(non_virtual));
            return
        end
    end % for
    % 47 49
    error('physmod:mech:mech_detectNonVirtualBoundaries:GoneTooFar', 'shouldn''t get this far');
end
function depth = local_computeDepth(blks)
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    full_names = get_param(blks, 'Parent');
    depth = zeros(length(full_names), 1.0);
    % 60 62
    for i=1.0:length(full_names)
        % 62 67
        % 63 67
        % 64 67
        % 65 67
        curr = 0.0;
        depth(i) = 1.0;
        for j=full_names{i}
            if eq(j, '/')
                curr = plus(curr, 1.0);
            else
                if gt(curr, 0.0)
                    % 73 78
                    % 74 78
                    % 75 78
                    % 76 78
                    depth(i) = plus(depth(i), mod(curr, 2.0));
                    curr = 0.0;
                end
            end
        end % for
    end % for
end
function parents = local_GetParents(hdls)
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    [hdls, i, j] = unique(hdls);
    parents_str_cell = get_param(hdls, 'Parent');
    if not(iscell(parents_str_cell))
        parents_str_cell = cellhorzcat(parents_str_cell);
    end
    % 95 97
    parents_cell = get_param(parents_str_cell, 'Handle');
    parents = horzcat(parents_cell{:});
    parents = parents(j);
end
function non_virtual = local_IsNonVirtual(hdls)
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    [hdls, i, j] = unique(hdls);
    phdls = get_param(hdls, 'PortHandles');
    if iscell(phdls)
        phdls = horzcat(phdls{:});
    end
    % 110 112
    non_virtual = zeros(length(phdls), 1.0);
    enable = cellhorzcat(phdls(:).Enable);
    trigger = cellhorzcat(phdls(:).Trigger);
    ifaction = cellhorzcat(phdls(:).Ifaction);
    for i=1.0:length(phdls)
        non_virtual(i) = or(or(not(isempty(enable{i})), not(isempty(trigger{i}))), not(isempty(ifaction{i})));
        % 117 121
        % 118 121
        % 119 121
    end % for
    % 121 123
    non_virtual = non_virtual(j);
end
