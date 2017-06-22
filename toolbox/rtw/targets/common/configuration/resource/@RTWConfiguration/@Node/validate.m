function err = validate(node, target)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    if not(isempty(node.resources))
        fields = node.resources.get;
        % 28 29
        fields_c = struct2cell(fields);
        idx = find(cellfun('isclass', fields_c, 'RTWConfiguration.Resource'));
        for i=ctranspose(idx(:))
            clear_allocations(fields_c{i});
        end % for
    end % if
    % 35 37
    % 36 37
    if isempty(node.data)
        % 38 40
        % 39 40
        errTxt = 'Attempt to load a Target Configuration block before the necessary classes were loaded. To fix this problem, please close this model and then reload it. To avoid this problem in the future, execute the ''findpackage'' command before loading models containing a Target Configuration block.';
        % 41 45
        % 42 45
        % 43 45
        % 44 45
        error(errTxt);
    else
        err = node.data.validate(node, target);
    end % if
end % function
