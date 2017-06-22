function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('MECH');
    % 9 11
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'MechFrameHelper');
    % 12 14
    % 13 14
    m = schema.method(hThisClass, 'CopyFrameObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'bool'};
    % 19 20
    m = schema.method(hThisClass, 'SetFrameObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','handle'};
    s.OutputTypes = {'handle'};
    % 25 26
    m = schema.method(hThisClass, 'CreateFrameObj');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle'};
    s.OutputTypes = {'handle'};
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    if isempty(findtype('PortSideEnum'))
        schema.EnumType('PortSideEnum', {'Right','Left'});
        % 37 40
        % 38 40
        % 39 40
    end % if
    % 41 42
    if isempty(findtype('OrientTypeEnum'))
        schema.EnumType('OrientTypeEnum', {'Quaternion','3x3 Transform','Euler X-Y-X','Euler X-Y-Z','Euler X-Z-X','Euler X-Z-Y','Euler Y-X-Y','Euler Y-Z-Y','Euler Y-X-Z','Euler Y-Z-X','Euler Z-X-Y','Euler Z-X-Z','Euler Z-Y-X','Euler Z-Y-Z'});
        % 44 50
        % 45 50
        % 46 50
        % 47 50
        % 48 50
        % 49 50
    end % if
    % 51 53
    % 52 53
    if isempty(findtype('FrameHelperRefFrameEnum'))
        schema.EnumType('FrameHelperRefFrameEnum', {'World','CG','CS1'});
        % 55 58
        % 56 58
        % 57 58
    end % if
    % 59 60
    if isempty(findtype('RefFrameEnum'))
        schema.EnumType('RefFrameEnum', {'World','Adjoining','CS1','Blah','Blah2'});
        % 62 65
        % 63 65
        % 64 65
    end % if
    % 66 68
    % 67 68
    schema.prop(hThisClass, 'Port', 'PortSideEnum');
    schema.prop(hThisClass, 'Name', 'string');
    schema.prop(hThisClass, 'Position', 'string');
    schema.prop(hThisClass, 'PositionOrigin', 'string');
    schema.prop(hThisClass, 'PositionReference', 'string');
    schema.prop(hThisClass, 'Orientation', 'string');
    schema.prop(hThisClass, 'OrientationType', 'OrientTypeEnum');
    schema.prop(hThisClass, 'OrientationFrame', 'string');
    schema.prop(hThisClass, 'ShowPort', 'bool');
    % 77 78
    schema.prop(hThisClass, 'PositionUnits', 'int');
    schema.prop(hThisClass, 'OrientationUnits', 'int');
    schema.prop(hThisClass, 'PositionUnitsChoices', 'mxArray');
    schema.prop(hThisClass, 'OrientationUnitsChoices', 'mxArray');
end % function
