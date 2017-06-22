function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    parent = findclass(findpackage('fmethod'), 'abstracteqripdiffhilb');
    c = schema.class(pk, 'eqriphilbmin', parent);
    % 11 13
    % 12 13
    if isempty(findtype('hilbertSpecFIRTypes'))
        schema.EnumType('hilbertSpecFIRTypes', {'3','4'});
        % 15 16
    end % if
    % 17 18
    p = schema.prop(c, 'FIRType', 'hilbertSpecFIRTypes');
    p.FactoryValue = '4';
end % function
