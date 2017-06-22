function schema
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'Signal');
    hCreateInPackage = findpackage('ASAP2');
    % 15 18
    % 16 18
    hThisClass = schema.class(hCreateInPackage, 'Signal', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 19 22
    % 20 22
    hThisProp = schema.prop(hThisClass, 'LongID_ASAP2', 'string');
    hThisProp.Visible = 'off';
    hThisProp.GetFunction = @getLongID_ASAP2;
    hThisProp.SetFunction = @setLongID_ASAP2;
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'off';
    % 27 29
    hThisProp = schema.prop(hThisClass, 'PhysicalMin_ASAP2', 'MATLAB array');
    hThisProp.Visible = 'off';
    hThisProp.GetFunction = @getPhysicalMin_ASAP2;
    hThisProp.SetFunction = @setPhysicalMin_ASAP2;
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'off';
    % 34 36
    hThisProp = schema.prop(hThisClass, 'PhysicalMax_ASAP2', 'MATLAB array');
    hThisProp.Visible = 'off';
    hThisProp.GetFunction = @getPhysicalMax_ASAP2;
    hThisProp.SetFunction = @setPhysicalMax_ASAP2;
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'off';
    % 41 43
    hThisProp = schema.prop(hThisClass, 'Units_ASAP2', 'string');
    hThisProp.Visible = 'off';
    hThisProp.GetFunction = @getUnits_ASAP2;
    hThisProp.SetFunction = @setUnits_ASAP2;
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Init = 'off';
end
function warnForObsoleteProperties(hObj)
    % 50 54
    % 51 54
    % 52 54
    persistent alreadyWarned;
    % 54 56
    if isempty(alreadyWarned)
        alreadyWarned = false;
    end
    % 58 60
    if not(alreadyWarned)
        warnTxt = 'Class: %s\n****************************************************************\n The following properties have been obsoleted and replaced\n by properties in the built-in Simulink.Signal class:\n \n   LongID_ASAP2      --> Description\n   PhysicalMin_ASAP2 --> Min\n   PhysicalMax_ASAP2 --> Max\n   Units_ASAP2       --> DocUnits\n \n Support for the obsoleted properties may be removed in future\n releases so please resave your data objects and update your\n M/TLC code to use the built-in properties.\n****************************************************************';
        % 61 75
        % 62 75
        % 63 75
        % 64 75
        % 65 75
        % 66 75
        % 67 75
        % 68 75
        % 69 75
        % 70 75
        % 71 75
        % 72 75
        % 73 75
        warning('Simulink:ObsoleteASAP2Properties', sprintf(warnTxt, class(hObj)));
        alreadyWarned = true;
    end
end
function newVal = getLongID_ASAP2(hObj, currVal)
    % 79 81
    warnForObsoleteProperties(hObj);
    newVal = hObj.Description;
end
function newVal = setLongID_ASAP2(hObj, newVal)
    % 84 86
    warnForObsoleteProperties(hObj);
    hObj.Description = newVal;
end
function newVal = getPhysicalMin_ASAP2(hObj, currVal)
    % 89 91
    warnForObsoleteProperties(hObj);
    newVal = hObj.Min;
end
function newVal = setPhysicalMin_ASAP2(hObj, newVal)
    % 94 96
    warnForObsoleteProperties(hObj);
    hObj.Min = newVal;
end
function newVal = getPhysicalMax_ASAP2(hObj, currVal)
    % 99 101
    warnForObsoleteProperties(hObj);
    newVal = hObj.Max;
end
function newVal = setPhysicalMax_ASAP2(hObj, newVal)
    % 104 106
    warnForObsoleteProperties(hObj);
    hObj.Max = newVal;
end
function newVal = getUnits_ASAP2(hObj, currVal)
    % 109 111
    warnForObsoleteProperties(hObj);
    newVal = hObj.DocUnits;
end
function newVal = setUnits_ASAP2(hObj, newVal)
    % 114 116
    warnForObsoleteProperties(hObj);
    hObj.DocUnits = newVal;
end
