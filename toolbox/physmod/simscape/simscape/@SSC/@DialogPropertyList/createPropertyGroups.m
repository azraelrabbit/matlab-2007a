function groups = createPropertyGroups(lst, varargin)
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
    properties = lst.Properties;
    items = {};
    groupnames = {};
    groupdesc = {};
    for i=1.0:length(properties)
        items{plus(end, 1.0)} = properties(i).makeWidget(varargin{:});
        groupnames{plus(end, 1.0)} = properties(i).getGroup;
        groupdesc{plus(end, 1.0)} = properties(i).getGroupDescription;
    end % for
    % 22 24
    if gt(nargin, 1.0)
        src = varargin{1.0};
        items = src.setEnables(items);
    end % if
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    [uniquegroups, g, idx] = unique(groupnames);
    groups = struct('Name', {''}, 'Items', {{}}, 'Description', '');
    % 33 36
    % 34 36
    groups = repmat(groups, 1.0, length(g));
    groupidx = zeros(length(g), 1.0);
    itemrow = zeros(length(g), 1.0);
    groupcnt = 1.0;
    % 39 44
    % 40 44
    % 41 44
    % 42 44
    i = 0.0;
        while lt(i, length(items))
        i = plus(i, 1.0);
        groupnum = idx(i);
        if eq(groupidx(groupnum), 0.0)
            groupidx(groupnum) = groupcnt;
            groups(groupnum).Name = groupnames{i};
            groups(groupnum).Description = groupdesc{i};
            groupcnt = plus(groupcnt, 1.0);
        end % if
        % 53 55
        itemstoadd = {};
        if properties(i).HasUnit
            label.Name = items{i}.Name;
            label.Type = 'text';
            label.ColSpan = [1.0 1.0];
            % 59 61
            value = items{i};
            value.Name = '';
            value.ColSpan = [2.0 2.0];
            % 63 65
            i = plus(i, 1.0);
            % 65 67
            if not(properties(i).IsUnit)
                pm_error('platform:SSC:DialogPropertyList:createPropertyGroups:UnitExpected');
            end % if
            % 69 71
            unit = items{i};
            unit.ColSpan = [3.0 3.0];
            % 72 74
            itemstoadd = cellhorzcat(label, value, unit);
        else
            if strcmp(items{i}.Type, 'checkbox')
                checkbox = items{i};
                checkbox.ColSpan = [1.0 3.0];
                % 78 80
                itemstoadd = cellhorzcat(checkbox);
            else
                label.Name = items{i}.Name;
                label.Type = 'text';
                label.ColSpan = [1.0 1.0];
                % 84 86
                value = items{i};
                value.Name = '';
                value.ColSpan = [2.0 3.0];
                % 88 90
                itemstoadd = cellhorzcat(label, value);
            end % if
        end % if
        % 92 94
        itemrow(groupnum) = plus(itemrow(groupnum), 1.0);
        rowspan = horzcat(itemrow(groupnum), itemrow(groupnum));
        % 95 97
        for j=1.0:length(itemstoadd)
            itemstoadd{j}.RowSpan = rowspan;
            groups(groupnum).Items{plus(end, 1.0)} = itemstoadd{j};
        end % for
    end % while
    % 101 103
    groups(groupidx) = groups;
