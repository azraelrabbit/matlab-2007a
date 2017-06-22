function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    pkg = findpackage('Aero');
    c = schema.class(pkg, 'Geometry');
    % 11 15
    % 12 15
    % 13 15
    if isempty(findtype('Aero.Geometry.SourceEnum'))
        schema.EnumType('Aero.Geometry.SourceEnum', {'Auto','Variable','MatFile','Ac3d','Custom'});
        % 16 18
    end % if
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    sdata = vertcat({'Name','string','','off',[]}, cellhorzcat('Source', 'Aero.Geometry.SourceEnum', 'Auto', 'off', @fcnSetSource), cellhorzcat('Reader', 'MATLAB array', [], 'off', @fcnSetReader), {'FaceVertexColorData','MATLAB array',[],'off',[]});
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    for k=1.0:size(sdata, 1.0)
        p = schema.prop(c, sdata{k, 1.0}, sdata{k, 2.0});
        p.FactoryValue = sdata{k, 3.0};
        p.AccessFlags.Serialize = sdata{k, 4.0};
        if not(isempty(sdata{k, 5.0}))
            p.SetFunction = sdata{k, 5.0};
        end % if
    end % for
    % 39 41
end % function
function v = fcnSetReader(h, v)
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    if not(strcmp(h.Source, 'Custom')) && not(isa(v, 'function_handle'))
        error('To use a Custom geometry reader, set the Source to Custom and set a valid function handle for the Reader');
    end % if
    % 50 52
end % function
function v = fcnSetSource(h, v)
    % 53 56
    % 54 56
    switch v
    case 'Auto'
        h.Reader = [];
    case 'Variable'
        h.Reader = @ReadVariable;
    case 'MatFile'
        h.Reader = @ReadMatFile;
    case 'Ac3d'
        h.Reader = @ReadAc3dFile;
    case 'Custom'
    otherwise
        error('Source must be Auto, Variable, MatFile, Ac3dFile, or Custom');
    end % switch
    % 68 70
end % function
