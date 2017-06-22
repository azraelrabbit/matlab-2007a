function output = struct_optstr(structArray)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    output = '';
    % 9 10
    if isempty(structArray)
        return;
    end % if
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    nameCell = {};
    for i=1.0:length(structArray)
        nameCell{i} = structArray(i).name;
    end % for
    % 23 24
    [sortedNames, indices] = sort(nameCell);
    % 25 26
    for j=indices
        % 27 28
        v = structArray(j).value;
        % 29 30
        if strcmp(structArray(j).enable, 'on') && not(isempty(v))
            % 31 32
            assig = horzcat('-a', structArray(j).name, '=', num2str(v));
            % 33 34
            output = horzcat(output, quoteIfNeeded(assig, ''''), ' ');
            % 35 36
        end % if
    end % for
    % 38 39
    output(end) = [];
end % function
