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
    hParent = findclass(dspPackage, 'DSPDDGBase');
    hThisClass = schema.class(vipPackage, 'Resize2D', hParent);
    % 12 14
    % 13 14
    m = schema.method(hThisClass, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 19 21
    % 20 21
    if isempty(findtype('VIPResize2DSpecify'))
        schema.EnumType('VIPResize2DSpecify', {'Output size as a percentage of input size','Number of output columns and preserve aspect ratio','Number of output rows and preserve aspect ratio','Number of output rows and columns'});
        % 23 26
        % 24 26
        % 25 26
    end % if
    if isempty(findtype('VIPResize2DInterpEnum'))
        schema.EnumType('VIPResize2DInterpEnum', {'Nearest neighbor','Bilinear','Bicubic','Lanczos2','Lanczos3'});
    end % if
    if isempty(findtype('VIPResizeInRectsize'))
        schema.EnumType('VIPResizeInRectsize', {'Full image','User-defined'});
    end % if
    % 33 34
    schema.prop(hThisClass, 'specify', 'VIPResize2DSpecify');
    schema.prop(hThisClass, 'rfactor', 'string');
    schema.prop(hThisClass, 'outCols', 'string');
    schema.prop(hThisClass, 'outRows', 'string');
    schema.prop(hThisClass, 'outRowsCols', 'string');
    schema.prop(hThisClass, 'interp_method', 'VIPResize2DInterpEnum');
    schema.prop(hThisClass, 'antialias', 'bool');
    schema.prop(hThisClass, 'useROI', 'bool');
    schema.prop(hThisClass, 'roiFlag', 'bool');
end % function
