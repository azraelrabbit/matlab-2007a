function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    c = schema.class(pk, 'datatypeselector', pk.findclass('sigcontainer'));
    % 10 11
    if isempty(findtype('signalCDataType'))
        schema.EnumType('signalCDataType', {'int32','int16','int8','uint32','uint16','uint8','double','single'});
        % 13 14
    end % if
    if isempty(findtype('datatypeselections'))
        schema.EnumType('datatypeselections', {'suggested','exportas'});
        % 17 18
    end % if
    % 19 20
    schema.prop(c, 'Selection', 'datatypeselections');
    % 21 22
    p = schema.prop(c, 'ExportType', 'signalCDataType');
    set(p, 'SetFunction', @setexporttype);
    % 24 25
    p = schema.prop(c, 'FractionalLength', 'mxArray');
    set(p, 'FactoryValue', 15.0);
    % 27 28
    schema.prop(c, 'SuggestedType', 'signalCDataType');
    % 29 30
    p = schema.prop(c, 'Listeners', 'handle vector');
    p.AccessFlag.PublicSet = 'Off';
    p.AccessFlag.PublicGet = 'Off';
    % 33 34
    e = schema.event(c, 'NewDataType');
end % function
function extype = setexporttype(this, extype)
    % 37 39
    % 38 39
    set(this, 'Selection', 'exportas');
end % function
