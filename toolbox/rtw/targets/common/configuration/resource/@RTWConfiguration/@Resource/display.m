function display(resource)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    allocations = resource.allocations.find('-class', 'RTWConfiguration.Allocation');
    % 9 11
    % 10 11
    disp(sprintf('\n'));
    disp(' --- All Resources --------------------- ');
    disp(sprintf(' |''%s''\n', resource.resources{:}));
    disp(' --- Allocations ----------------------- ');
    if not(isempty(allocations))
        for alloc=allocations
            t = evalc('alloc.host_object');
            t = strrep(t, sprintf('ans =\n'), '');
            t = strrep(t, sprintf('\n'), '');
            values = alloc.value;
            disp(horzcat(' | ', t, ' -> ', sprintf('''%s'' ', values{:})));
        end % for
    end % if
    disp(' ---------------------------------------');
end % function
