function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    package = findpackage('MPlay');
    inhcls = findclass(findpackage('slmgr'), 'SLEventSink');
    thisclass = schema.class(package, 'DataAbstract', inhcls);
    % 9 13
    % 10 13
    % 11 13
    if isempty(findtype('ErrorStatusType'))
        schema.EnumType('ErrorStatusType', {'success','failure','cancel'});
    end
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    p = schema.prop(thisclass, 'errorStatus', 'ErrorStatusType');
    p.FactoryValue = 'failure';
    % 23 25
    p = schema.prop(thisclass, 'errorMsg', 'MATLAB array');
    p.FactoryValue = '';
    % 26 30
    % 27 30
    % 28 30
    findclass(package, 'Source');
    p = schema.prop(thisclass, 'srcObj', 'MPlay.Source');
    % 31 34
    % 32 34
    p = schema.prop(thisclass, 'dataType', 'string');
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    if isempty(findtype('colorSpaceType'))
        schema.EnumType('colorSpaceType', {'intensity','rgb'});
    end
    p = schema.prop(thisclass, 'colorSpace', 'colorSpaceType');
    p.FactoryValue = 'intensity';
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    p = schema.prop(thisclass, 'colorMap', 'mxArray');
    % 49 51
    p.FactoryValue = [];
    p.SetFunction = @set_colorMap;
    % 52 56
    % 53 56
    % 54 56
    p = schema.prop(thisclass, 'numFrames', 'double');
    % 56 58
    p.FactoryValue = 0.0;
    % 58 62
    % 59 62
    % 60 62
    p = schema.prop(thisclass, 'frameRows', 'double');
    % 62 64
    p.FactoryValue = 0.0;
    % 64 66
    p = schema.prop(thisclass, 'frameCols', 'double');
    % 66 68
    p.FactoryValue = 0.0;
    % 68 72
    % 69 72
    % 70 72
    p = schema.prop(thisclass, 'frameRate', 'double');
    p.FactoryValue = 20.0;
    % 73 75
    p.SetFunction = @set_frame_rate;
    % 75 79
    % 76 79
    % 77 79
    p = schema.prop(thisclass, 'type', 'string');
    % 79 87
    % 80 87
    % 81 87
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    p = schema.prop(thisclass, 'sourceName', 'string');
    % 87 89
    p = schema.prop(thisclass, 'sourceNameShort', 'string');
    % 89 94
    % 90 94
    % 91 94
    % 92 94
    p = schema.prop(thisclass, 'UserData', 'mxArray');
    p.FactoryValue = [];
    % 95 99
    % 96 99
    % 97 99
    p = schema.prop(thisclass, 'debug', 'bool');
    p.FactoryValue = false;
end
function cmap = set_colorMap(this, cmap)
    % 102 106
    % 103 106
    % 104 106
    if not(isa(cmap, 'double')) || issparse(cmap) || not(isreal(cmap))
        eid = 'mplay:InvalidColormapDType';
        msg = 'Colormap must be real and double-precision.';
        error(eid, '%s', msg);
    end
    if isempty(cmap)
        return
    end
    if ne(ndims(cmap), 2.0) || ne(size(cmap, 2.0), 3.0)
        eid = 'mplay:InvalidColormapDims';
        msg = 'Colormap must be an Nx3 matrix.';
        error(eid, '%s', msg);
    end
end
function rate = set_frame_rate(this, rate)
    % 120 128
    % 121 128
    % 122 128
    % 123 128
    % 124 128
    % 125 128
    % 126 128
    maxRate = 100.0;
    defaultRate = 20.0;
    % 129 131
    if gt(rate, maxRate)
        rate = maxRate;
        MPlay.errorHandler({'Frame rate cannot exceed 100 frames/sec.','Setting rate to maximum.'});
    else
        if lt(rate, 0.0)
            rate = defaultRate;
            MPlay.errorHandler({'Frame rate cannot be <= 0','Setting to default rate'});
            % 137 139
        end
    end
end
