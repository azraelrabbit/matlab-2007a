function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pk = findpackage('fdfmethod');
    parent = findclass(findpackage('fmethod'), 'abstractiir');
    c = schema.class(pk, 'abstractlpnorm', parent);
    set(c, 'Description', 'abstract');
    % 11 13
    p = schema.prop(c, 'Norm', 'posdouble');
    set(p, 'FactoryValue', 128.0, 'SetFunction', @set_norm);
    % 14 16
    p = schema.prop(c, 'DensityFactor', 'double');
    set(p, 'FactoryValue', 20.0, 'SetFunction', @set_densityfactor);
    % 17 19
    p = schema.prop(c, 'MaxPoleRadius', 'posdouble');
    set(p, 'FactoryValue', 1.0, 'SetFunction', @set_maxpoleradius);
    % 20 22
    p = schema.prop(c, 'InitNorm', 'posdouble');
    set(p, 'FactoryValue', 2.0, 'SetFunction', @set_initnorm);
    % 23 25
    schema.prop(c, 'InitNum', 'mxArray');
    schema.prop(c, 'InitDen', 'mxArray');
    % 26 28
    p = schema.prop(c, 'SOSScaleNorm', 'string');
    set(p, 'SetFunction', @set_sosscalenorm, 'FactoryValue', 'Linf');
    % 29 31
    findclass(findpackage('fdopts'), 'sosscaling');
    schema.prop(c, 'SOSScaleOpts', 'fdopts.sosscaling');
end
function norm = set_sosscalenorm(this, norm)
    % 34 37
    % 35 37
    if ~(isempty(norm)) && ~(any(strcmp(norm, {'Linf','linf','L1','l1','L2','l2'})))
        error('SOSScaleNorm must be ''Linf'', ''linf'', ''L1'', ''l1'', ''L2'' or ''l2''.');
    end
end
function p = set_norm(c, p)
    % 41 44
    % 42 44
    if ((~(any(isfinite(p)))) | (any(rem(p, 2.0)))) | (any(le(p, 0.0)))
        error(generatemsgid('InvalidInput'), 'The Norm should be even, finite, and positive.');
    end
end
function p = set_initnorm(c, p)
    % 48 51
    % 49 51
    if ((~(any(isfinite(p)))) | (any(rem(p, 2.0)))) | (any(le(p, 0.0)))
        error(generatemsgid('InvalidInput'), 'The InitNorm should be even, finite, and positive.');
    end
end
function d = set_densityfactor(c, d)
    % 55 58
    % 56 58
    if (lt(d, 10.0)) | (~(isfinite(d)))
        error(generatemsgid('InvalidInput'), 'The DensityFactor must be a finite scalar value of at least 10.');
    end
end
function m = set_maxpoleradius(c, m)
    % 62 65
    % 63 65
    if (lt(m, 0.0)) | (gt(m, 1.0))
        error(generatemsgid('InvalidInput'), 'The MaxPoleRadius should be comprised between 0 and 1.');
    end
end
