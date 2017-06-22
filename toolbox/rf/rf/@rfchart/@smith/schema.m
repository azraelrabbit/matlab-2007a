function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('rfbase');
    parent = findclass(package, 'rfbase');
    % 9 11
    % 10 11
    h = schema.class(findpackage('rfchart'), 'smith', parent);
    % 12 14
    % 13 14
    if isempty(findtype('ChartTypeDATATYPE'))
        schema.EnumType('ChartTypeDATATYPE', {'Z','Y','ZY','YZ'});
    end % if
    if isempty(findtype('LabelVisibleDATATYPE'))
        schema.EnumType('LabelVisibleDATATYPE', {'On','Off'});
    end % if
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    values = [.2 .5 1.0 2.0 5.0 ;  1.0 2.0 5.0 5.0 30.0];
    % 27 30
    % 28 30
    % 29 30
    p = localCreateProp(h, 'NeedReset', 'bool', true);
    p.Visible = 'Off';
    p = localCreateProp(h, 'Type', 'ChartTypeDATATYPE', 'Z');
    p = localCreateProp(h, 'Values', 'MATLAB array', values);
    p = localCreateProp(h, 'Color', 'color', [.4 .4 .4]);
    p = localCreateProp(h, 'LineWidth', 'double', .5);
    p = localCreateProp(h, 'LineType', 'string', '-');
    p = localCreateProp(h, 'SubColor', 'color', [.8 .8 .8]);
    p = localCreateProp(h, 'SubLineWidth', 'double', .5);
    p = localCreateProp(h, 'SubLineType', 'string', ':');
    p = localCreateProp(h, 'LabelVisible', 'LabelVisibleDATATYPE', 'On');
    p = localCreateProp(h, 'LabelSize', 'double', 10.0);
    p = localCreateProp(h, 'LabelColor', 'color', [0.0 0.0 0.0]);
    p = localCreateProp(h, 'LabelHandles', 'MATLAB array', []);
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
    % 46 48
    % 47 48
    p = localCreateProp(h, 'XData', 'MATLAB array', []);
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
    p = localCreateProp(h, 'YData', 'MATLAB array', []);
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
    % 54 56
    % 55 56
    p = localCreateProp(h, 'Axes', 'handle', []);
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
    p = localCreateProp(h, 'StaticGrid', 'handle', []);
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
    p = localCreateProp(h, 'AdmittanceGrid', 'handle', []);
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
    p = localCreateProp(h, 'ImpedanceGrid', 'handle', []);
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
    % 68 69
    p = localCreateProp(h, 'RFData', 'handle', []);
    p.Visible = 'off';
end % function
function p = localCreateProp(Class, PropName, DataType, FactoryValue)
    % 73 75
    % 74 75
    p = schema.prop(Class, PropName, DataType);
    % 76 77
    p.set('AccessFlags.Init', 'on', 'FactoryValue', FactoryValue);
end % function
