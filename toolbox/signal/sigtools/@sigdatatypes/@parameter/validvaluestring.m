function str = validvaluestring(hPrm)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    vValues = hPrm.ValidValues;
    % 8 10
    if isa(vValues, 'function_handle')
        % 10 13
        % 11 13
        str = horzcat('@', func2str(vValues));
    else
        if iscell(vValues)
            % 15 17
            str = '';
            for i=1.0:length(vValues)
                str = horzcat(str, '''', vValues{i}, ''' ');
            end % for
        else
            % 21 24
            % 22 24
            str = horzcat(num2str(vValues(1.0)), ' to ', num2str(vValues(end)));
            % 24 27
            % 25 27
            if eq(length(vValues), 3.0)
                str = horzcat(str, ' in steps of ', num2str(vValues(2.0)));
            end % if
        end % if
    end % if
end % function
