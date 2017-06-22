function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dspPackage = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(dspPackage, 'DSPDDGBase');
    this = schema.class(vipPackage, 'Blob', parent);
    % 12 14
    % 13 14
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    m = schema.method(this, 'getParamsFromSignalName');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 26 28
    % 27 28
    m = schema.method(this, 'instrumentThisParam');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string','string'};
    s.OutputTypes = {'mxArray'};
    % 33 35
    % 34 35
    if isempty(findtype('VIPBlobOutDT'))
        schema.EnumType('VIPBlobOutDT', {'double','single','Specify via Fixed-point tab'});
        % 37 38
    end % if
    if isempty(findtype('VIPBlobConn'))
        schema.EnumType('VIPBlobConn', {'8','4'});
    end % if
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    schema.prop(this, 'area', 'bool');
    schema.prop(this, 'centroid', 'bool');
    schema.prop(this, 'bBox', 'bool');
    schema.prop(this, 'majorAxis', 'bool');
    schema.prop(this, 'minorAxis', 'bool');
    schema.prop(this, 'angle', 'bool');
    schema.prop(this, 'eccentricity', 'bool');
    schema.prop(this, 'equivDiameterSq', 'bool');
    schema.prop(this, 'extent', 'bool');
    schema.prop(this, 'perimeter', 'bool');
    % 56 57
    schema.prop(this, 'maxBlobs', 'string');
    schema.prop(this, 'warnIfNumBlobsExceeded', 'bool');
    schema.prop(this, 'isCount', 'bool');
    % 60 61
    schema.prop(this, 'useMinArea', 'bool');
    schema.prop(this, 'minArea', 'string');
    schema.prop(this, 'useMaxArea', 'bool');
    schema.prop(this, 'maxArea', 'string');
    schema.prop(this, 'excludeBorderBlob', 'bool');
    % 66 67
    schema.prop(this, 'outDT', 'VIPBlobOutDT');
    schema.prop(this, 'isFill', 'bool');
    schema.prop(this, 'fillValues', 'string');
    % 70 71
    schema.prop(this, 'conn', 'VIPBlobConn');
    schema.prop(this, 'isLabel', 'bool');
end % function
