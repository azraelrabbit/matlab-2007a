function host = get_host(resource, keys)
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
    % 27 28
    allocations = resource.allocations.find('-class', 'RTWConfiguration.Allocation');
    host = [];
    if not(isempty(allocations))
        for i=1.0:length(allocations)
            allocation = allocations(i);
            if any(ismember(keys, get(allocation, 'value')))
                host = allocation.host_object;
                return;
            end % if
        end % for
    end % if
end % function
