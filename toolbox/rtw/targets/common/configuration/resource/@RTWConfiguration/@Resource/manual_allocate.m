function items_allocated = manual_allocate(resource, host, items_requested)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    items_available = resource.resources;
    % 30 31
    if ischar(items_requested)
        % 32 33
        items_requested = cellhorzcat(items_requested);
    end % if
    % 35 36
    if not(all(ismember(items_requested, items_available)))
        if not(iscell(items_requested))
            items_requested = cellhorzcat(items_requested);
        end % if
        err.message = horzcat('{ ', sprintf('''%s'' ', items_requested{:}), ' } is not one of { ', sprintf('''%s'' ', items_available{:}), ' } items available');
        % 41 43
        % 42 43
        err.identifier = 'RTWConfiguration:Resource:manual_allocate:NoSuchItem';
        error(err);
        % 45 46
    end % if
    % 47 49
    % 48 49
    items_allocated = {};
    for i=1.0:length(items_requested)
        item_requested = items_requested{i};
        % 52 54
        % 53 54
        priority_host = resource.get_host(item_requested);
        if isequal(host, priority_host)
            % 56 58
            % 57 58
            item_allocated = item_requested;
        else
            if isempty(priority_host)
                % 61 62
                item_allocated = item_requested;
                i_allocate_items(resource, host, item_requested)
            else
                % 65 68
                % 66 68
                % 67 68
                priority_allocation = resource.allocations.find('-class', 'RTWConfiguration.Allocation', 'host_object', priority_host);
                % 69 71
                % 70 71
                if priority_allocation.is_auto_allocation
                    % 72 74
                    % 73 74
                    i_allocate_items(resource, host, item_requested)
                    auto_value = resource.auto_allocate(priority_allocation);
                    if not(isempty(auto_value))
                        % 77 79
                        % 78 79
                        priority_allocation.notify_reallocation(resource, auto_value);
                        item_allocated = item_requested;
                    else
                        % 82 85
                        % 83 85
                        % 84 85
                        i_deallocate_items(resource, host, item_requested);
                        % 86 88
                        % 87 88
                        resource.auto_allocate(priority_allocation);
                        item_allocated = [];
                    end % if
                else
                    % 92 94
                    % 93 94
                    item_allocated = [];
                end % if
            end % if
        end % if
        if isempty(item_allocated)
            items_allocated = [];
            % 100 102
            % 101 102
            i_deallocate_items(resource, host, items_requested);
            break
        else
            items_allocated = cellhorzcat(items_allocated{:}, item_allocated);
        end % if
    end % for
    if eq(length(items_allocated), 1.0)
        items_allocated = items_allocated{1.0};
    end % if
end % function
function i_allocate_items(resource, host, items)
    % 113 116
    % 114 116
    % 115 116
    current_allocation = resource.allocations.find('-class', 'RTWConfiguration.Allocation', 'host_object', host);
    if not(isempty(current_allocation))
        % 118 120
        % 119 120
        current_allocation.value = union(current_allocation.value, items);
    else
        % 122 123
        new_alloc_obj = RTWConfiguration.Allocation(host, items, []);
        resource.allocations.connect(new_alloc_obj, 'down');
    end % if
end % function
function i_deallocate_items(resource, host, items)
    current_allocation = resource.allocations.find('-class', 'RTWConfiguration.Allocation', 'host_object', host);
    if not(isempty(current_allocation))
        % 130 132
        % 131 132
        current_allocation.value = setdiff(current_allocation.value, items);
        if isempty(current_allocation.value)
            current_allocation.disconnect;
        end % if
    else
        % 137 138
    end % if
end % function
