function [one_err_string, topology_only] = ne_get_one_err_string(err_row, is_general, equationNames)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    one_err_string = '';
    involved_equations = find(and(err_row, is_general));
    equationNames = equationNames(:);
    if eq(length(involved_equations), 0.0)
        one_err_string = sprintf('Dependency found among topology equations. Check for missing reference node.\n');
        topology_only = 1.0;
    else
        topology_only = 0.0;
        % 15 16
        involvedEquationNames = equationNames(involved_equations);
        % 17 21
        % 18 21
        % 19 21
        % 20 21
        involvedEquationNames(strcmp(involvedEquationNames, '')) = [];
        % 22 26
        % 23 26
        % 24 26
        % 25 26
        involvedEquationNames = strrep(involvedEquationNames, sprintf('\n'), ' ');
        % 27 31
        % 28 31
        % 29 31
        % 30 31
        [uniqueNames, I, J] = unique(involvedEquationNames);
        I = sort(I, 'descend');
        % 33 37
        % 34 37
        % 35 37
        % 36 37
        one_err_string = sprintf('''%s''\n', involvedEquationNames{I});
    end % if
end % function
