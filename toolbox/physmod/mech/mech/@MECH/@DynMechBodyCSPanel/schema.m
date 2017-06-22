function schema
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    hCreateInPackage = findpackage('MECH');
    hBaseObj = hCreateInPackage.findclass('PmMechBodyCSPanel');
    % 14 16
    % 15 16
    hThisClass = schema.class(hCreateInPackage, 'DynMechBodyCSPanel', hBaseObj);
    % 17 19
    % 18 19
    schema.prop(hThisClass, 'FocusItem', 'mxArray');
    schema.prop(hThisClass, 'FocusTab', 'int32');
    schema.prop(hThisClass, 'nPortsShown', 'int32');
    schema.prop(hThisClass, 'AddButnTagPos', 'string');
    schema.prop(hThisClass, 'DelButnTagPos', 'string');
    schema.prop(hThisClass, 'UpButnTagPos', 'string');
    schema.prop(hThisClass, 'DownButnTagPos', 'string');
    schema.prop(hThisClass, 'AddButnTagRot', 'string');
    schema.prop(hThisClass, 'DelButnTagRot', 'string');
    schema.prop(hThisClass, 'UpButnTagRot', 'string');
    schema.prop(hThisClass, 'DownButnTagRot', 'string');
    % 30 33
    % 31 33
    % 32 33
    m = schema.method(hThisClass, 'Render');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','mxArray'};
    s.OutputTypes = {'bool','mxArray'};
    % 38 39
    m = schema.method(hThisClass, 'OnAddButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','string','mxArray'};
    s.OutputTypes = {};
    % 44 45
    m = schema.method(hThisClass, 'OnDelButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','string','mxArray'};
    s.OutputTypes = {};
    % 50 51
    m = schema.method(hThisClass, 'OnUpButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','string','mxArray'};
    s.OutputTypes = {};
    % 56 57
    m = schema.method(hThisClass, 'OnDownButton');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle','handle','string','mxArray'};
    s.OutputTypes = {};
end % function
