function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    parent = findclass(pk, 'abstractiir');
    c = schema.class(pk, 'abstractclassiciir', parent);
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'SOSScaleNorm', 'string');
    set(p, 'SetFunction', @set_sosscalenorm, 'FactoryValue', 'Linf');
    % 15 16
    findclass(findpackage('fdopts'), 'sosscaling');
    schema.prop(c, 'SOSScaleOpts', 'fdopts.sosscaling');
end % function
function norm = set_sosscalenorm(this, norm)
    % 20 22
    % 21 22
    if not(isempty(norm)) && not(any(strcmp(norm, {'Linf','linf','L1','l1','L2','l2'})))
        error('SOSScaleNorm must be ''Linf'', ''linf'', ''L1'', ''l1'', ''L2'' or ''l2''.');
    end % if
end % function
