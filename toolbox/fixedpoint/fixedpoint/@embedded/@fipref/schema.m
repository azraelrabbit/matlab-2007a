function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if isempty(findtype('quantizedNumberDisplayEnum'))
        schema.EnumType('quantizedNumberDisplayEnum', {'RealWorldValue','bin','dec','hex','int','none'});
    end % if
    % 11 13
    if isempty(findtype('quantizedNumericTypeDisplayEnum'))
        schema.EnumType('quantizedNumericTypeDisplayEnum', {'full','none','short'});
    end % if
    % 15 17
    if isempty(findtype('quantizedFimathDisplay'))
        schema.EnumType('quantizedFimathDisplay', {'full','none'});
    end % if
    % 19 21
    if isempty(findtype('quantizedFILoggingEnum'))
        schema.EnumType('quantizedFILoggingEnum', {'Off','On','OverflowAndUnderflow'});
    end % if
    % 23 25
    if isempty(findtype('quantizedFILogTypeEnum'))
        schema.EnumType('quantizedFILogTypeEnum', {'Assignment','Tag'});
    end % if
    % 27 29
    if isempty(findtype('embedded_fi_DataTypeOverrideEnum'))
        schema.EnumType('embedded_fi_DataTypeOverrideEnum', {'ForceOff','ScaledDoubles','TrueDoubles','TrueSingles'});
    end % if
    % 31 33
    package = findpackage('embedded');
    class = schema.class(package, 'fipref');
    % 34 36
    property = schema.prop(class, 'NumberDisplay', 'quantizedNumberDisplayEnum');
    % 36 38
    property.AccessFlags.PublicGet = 'on';
    property.AccessFlags.PublicSet = 'on';
    property.FactoryValue = 'RealWorldValue';
    % 40 42
    property = schema.prop(class, 'NumericTypeDisplay', 'quantizedNumericTypeDisplayEnum');
    % 42 44
    property.AccessFlags.PublicGet = 'on';
    property.AccessFlags.PublicSet = 'on';
    property.FactoryValue = 'full';
    % 46 48
    property = schema.prop(class, 'FimathDisplay', 'quantizedFimathDisplay');
    property.AccessFlags.PublicGet = 'on';
    property.AccessFlags.PublicSet = 'on';
    property.FactoryValue = 'full';
    % 51 53
    property = schema.prop(class, 'LoggingMode', 'quantizedFILoggingEnum');
    property.AccessFlags.PublicGet = 'on';
    property.AccessFlags.PublicSet = 'on';
    property.AccessFlags.AbortSet = 'off';
    property.FactoryValue = 'Off';
    property.SetFunction = @setlogging;
    % 58 60
    property = schema.prop(class, 'LogType', 'quantizedFILogTypeEnum');
    property.AccessFlags.PublicGet = 'on';
    property.AccessFlags.PublicSet = 'on';
    property.AccessFlags.AbortSet = 'off';
    property.FactoryValue = 'Assignment';
    property.SetFunction = @setlogtype;
    % 65 67
    property = schema.prop(class, 'DataTypeOverride', 'embedded_fi_DataTypeOverrideEnum');
    property.AccessFlags.PublicGet = 'on';
    property.AccessFlags.PublicSet = 'on';
    property.AccessFlags.AbortSet = 'off';
    property.FactoryValue = 'ForceOff';
function val = setlogging(this, val)
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    switch val
    case 'Off'
        % 78 80
        embedded.qlogger.SetLoggingMode(false);
    case 'On'
        % 81 83
        embedded.qlogger.SetLoggingMode(true);
    case 'OverflowAndUnderflow'
        % 84 86
        embedded.qlogger.SetLoggingMode(true);
        warning('fipref:logging:ObsoleteLoggingMode', 'LoggingMode ''OverflowAndUnderflow'' is obsolete.  Use fipref(''LoggingMode'',''On'') instead.');
        % 87 90
        % 88 90
    end % switch
function val = setlogtype(this, val)
    % 91 97
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    switch val
    case 'Assignment'
        % 98 100
        embedded.qlogger.SetLogType(0.0);
    case 'Tag'
        % 101 103
        embedded.qlogger.SetLogType(1.0);
    end % switch
