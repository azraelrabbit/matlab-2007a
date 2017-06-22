function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    dspPackage = findpackage('dspfixptddg');
    vipPackage = findpackage('vipfixptddg');
    parent = findclass(dspPackage, 'DSPDDGBase');
    this = schema.class(vipPackage, 'SAD2D', parent);
    % 13 15
    % 14 15
    m = schema.method(this, 'getDialogSchema');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {'mxArray'};
    % 20 22
    % 21 22
    if isempty(findtype('VIPSAD2DOutput'))
        schema.EnumType('VIPSAD2DOutput', {'SAD values','Minimum SAD value index'});
    end % if
    if isempty(findtype('VIPSAD2DMethod'))
        schema.EnumType('VIPSAD2DMethod', {'Exhaustive','Three-step'});
    end % if
    if isempty(findtype('VIPSAD2DInvalidROI'))
        schema.EnumType('VIPSAD2DInvalidROI', {'Ignore','Warn','Error'});
    end % if
    % 31 33
    % 32 33
    schema.prop(this, 'output', 'VIPSAD2DOutput');
    schema.prop(this, 'method', 'VIPSAD2DMethod');
    schema.prop(this, 'invalidROI', 'VIPSAD2DInvalidROI');
    schema.prop(this, 'roi', 'bool');
    schema.prop(this, 'nearbyPel', 'bool');
    schema.prop(this, 'nearbySize', 'string');
end % function
