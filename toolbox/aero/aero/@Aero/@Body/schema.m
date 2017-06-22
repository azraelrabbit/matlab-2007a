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
    c = schema.class(pkg, 'Body');
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    sdata = vertcat({'Name','off','string',''}, cellhorzcat('CoordTransformFcn', 'off', 'MATLAB array', @nullCoordTransform), {'Position','off','MATLAB array',[0.0,0.0,0.0]}, {'Rotation','off','MATLAB array',[0.0,0.0,0.0]}, {'Geometry','off','handle',[]}, cellhorzcat('PatchGenerationFcn', 'off', 'MATLAB array', @generatePatchesFromFvcData), {'PatchHandles','off','MATLAB array',[]}, {'ViewingTransform','off','MATLAB array',[]}, {'TimeseriesSource','off','MATLAB array',[]}, {'TimeseriesSourceType','off','Aero.TimeseriesTypeEnum','Array6DoF'}, cellhorzcat('TimeseriesReadFcn', 'off', 'MATLAB array', @interp6DoFArrayWithTime));
    % 25 40
    % 26 40
    % 27 40
    % 28 40
    % 29 40
    % 30 40
    % 31 40
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    propType = {'TimeseriesSourceType','TimeseriesReadFcn'};
    fcnType = cellhorzcat(@setFcnType, @setFcnRead);
    % 41 43
    for k=1.0:size(sdata, 1.0)
        p = schema.prop(c, sdata{k, 1.0}, sdata{k, 3.0});
        p.AccessFlags.Serialize = sdata{k, 2.0};
        p.FactoryValue = sdata{k, 4.0};
        match = strmatch(sdata{k, 1.0}, propType, 'exact');
        if match
            p.setFunction = fcnType{match};
        end % if
    end % for
    % 51 53
end % function
function data = setFcnType(h, val)
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    sourceType = set(h, 'TimeseriesSourceType');
    readType = cellhorzcat('interpTimeseries', 'interp6DoFArrayWithTime', 'interp3DoFArrayWithTime', 'interpStructWithTime', h.TimeseriesReadFcn);
    % 61 64
    % 62 64
    h.TimeseriesReadFcn = initReadFcn(readType{strmatch(val, sourceType, 'exact')}, h);
    % 64 66
    data = val;
    % 66 68
end % function
function data = setFcnRead(h, val)
    % 69 73
    % 70 73
    % 71 73
    data = initReadFcn(val, h);
    % 73 75
end % function
