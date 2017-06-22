function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(license('checkout', 'filter_design_toolbox'))
        error('Filter Design Toolbox license required.');
    end % if
    % 11 12
    schema.package('quantum');
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    findpackage('sigdatatypes');
    % 21 22
    if isempty(findtype('ProductNAccumModeType'))
        schema.EnumType('ProductNAccumModeType', {'FullPrecision','KeepMSB','KeepLSB','SpecifyPrecision'});
        % 24 25
    end % if
    % 26 27
    if isempty(findtype('OutputModeType'))
        schema.EnumType('OutputModeType', {'AvoidOverflow','BestPrecision','SpecifyPrecision'});
        % 29 30
    end % if
    % 31 32
    if isempty(findtype('OverflowType'))
        schema.EnumType('OverflowType', {'wrap','saturate'});
        % 34 35
    end % if
    % 36 37
    if isempty(findtype('RoundType'))
        schema.EnumType('RoundType', {'convergent','ceil','fix','floor','round','nearest'});
        % 39 40
    end % if
    % 41 42
    if isempty(findtype('FilterInternalsType'))
        schema.EnumType('FilterInternalsType', {'FullPrecision','SpecifyPrecision'});
        % 44 45
    end % if
end % function
