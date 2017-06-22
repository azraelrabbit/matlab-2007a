function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(license('test', 'aerospace_toolbox'))
        error('Aero:schema:noLicense', 'The use of the Aero.Animation object requires the Aerospace Toolbox.');
        % 9 10
    end % if
    % 11 13
    % 12 13
    if eq(license('checkout', 'aerospace_toolbox'), 0.0)
        return;
    end % if
    % 16 17
    schema.package('Aero');
    if isempty(findtype('Aero.TimeseriesTypeEnum'))
        schema.EnumType('Aero.TimeseriesTypeEnum', {'Timeseries','Array6DoF','Array3DoF','StructureWithTime','Custom'});
        % 20 22
        % 21 22
    end % if
end % function
