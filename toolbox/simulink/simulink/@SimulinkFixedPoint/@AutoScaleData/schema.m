function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('SimulinkFixedPoint');
    % 9 10
    hThisClass = schema.class(hCreateInPackage, 'AutoScaleData');
    % 11 12
    hThisProp = schema.prop(hThisClass, 'RangeFactor', 'double');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 1.0;
    % 15 16
    hThisProp = schema.prop(hThisClass, 'topSubSystemToScale', 'string');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = '';
    % 19 20
    hThisProp = schema.prop(hThisClass, 'enrichedFixPtSimRanges', 'mxArray');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = {};
    % 23 24
    hThisProp = schema.prop(hThisClass, 'enrichedPathsForQuickSearch', 'mxArray');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = {};
    % 27 28
    m = schema.method(hThisClass, 'resetQuickSearchData');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {};
    % 33 34
    m = schema.method(hThisClass, 'findIndexToRecordFromPathWithAppend');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 39 40
    m = schema.method(hThisClass, 'findIndexToRecordFromPathSigWithAppend');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {'mxArray'};
    % 45 46
    m = schema.method(hThisClass, 'findIndexToRecordFromPath');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 51 52
    m = schema.method(hThisClass, 'findIndexToRecordFromPathSig');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {'mxArray'};
    % 57 58
    m = schema.method(hThisClass, 'getRefAutoScaleDataFromModel', 'static');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'string'};
    s.OutputTypes = {'mxArray'};
    % 63 83
    % 64 83
    % 65 83
    % 66 83
    % 67 83
    % 68 83
    % 69 83
    % 70 83
    % 71 83
    % 72 83
    % 73 83
    % 74 83
    % 75 83
    % 76 83
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    % 82 83
end % function
