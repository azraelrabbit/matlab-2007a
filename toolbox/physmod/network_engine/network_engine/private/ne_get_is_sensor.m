function boolvec = ne_get_is_sensor(sys)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    equation_names = cellhorzcat(sys.equationData.path);
    boolvec = zeros(1.0, length(equation_names));
    for i=1.0:length(equation_names)
        if strfind(equation_names{i}, 'Sensor')
            boolvec(i) = 1.0;
        end % if
    end % for
end % function
