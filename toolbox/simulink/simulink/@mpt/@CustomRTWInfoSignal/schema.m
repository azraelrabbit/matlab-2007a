function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hDeriveFromPackage = findpackage('Simulink');
    hDeriveFromClass = findclass(hDeriveFromPackage, 'CustomRTWInfo');
    hCreateInPackage = findpackage('mpt');
    % 10 13
    % 11 13
    hThisClass = schema.class(hCreateInPackage, 'CustomRTWInfoSignal', hDeriveFromClass);
    hThisClass.Handle = hDeriveFromClass.Handle;
    % 14 17
    % 15 17
    if isempty(findtype('mpt_CustomStorageClassList_for_Signal'))
        cscList = processcsc('GetNamesForSignal', 'mpt');
        schema.EnumType('mpt_CustomStorageClassList_for_Signal', cscList);
    else
        warning('A type named ''mpt_CustomStorageClassList_for_Signal'' already exists.');
    end
    % 22 25
    % 23 25
    hThisProp = schema.prop(hThisClass, 'CustomStorageClass', 'mpt_CustomStorageClassList_for_Signal');
    % 25 27
    hThisProp = schema.prop(hThisClass, 'InitialValue', 'MATLAB array');
    % 27 30
    % 28 30
    hThisProp.Visible = 'off';
    % 30 32
    hThisProp.AccessFlags.Serialize = 'on';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = [];
    hThisProp.GetFunction = @getFcn_InitialValue;
    hThisProp.SetFunction = @setFcn_InitialValue;
    % 36 40
    % 37 40
    % 38 40
    hThisProp = schema.prop(hThisClass, 'hParentObject', 'handle');
    hThisProp.Visible = 'off';
    hThisProp.AccessFlags.Serialize = 'off';
    hThisProp.AccessFlags.Copy = 'off';
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.AccessFlags.PublicGet = 'on';
    hThisProp.AccessFlags.PublicSet = 'on';
    hThisProp.FactoryValue = [];
    hThisProp.SetFunction = @setFcn_hParentObject;
    % 48 52
    % 49 52
    % 50 52
    hThisProp = schema.prop(hThisClass, 'CustomAttributes', 'Simulink.BaseCSCAttributes');
    % 52 55
    % 53 55
    createcsclisteners(hThisClass);
    % 55 57
end
function newVal = getFcn_InitialValue(hObj, currVal)
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    newVal = currVal;
    % 63 66
    % 64 66
    hParentObject = hObj.hParentObject;
    % 66 69
    % 67 69
    if not(isempty(hParentObject)) && isprop(hParentObject, 'InitialValue')
        % 69 71
        if isempty(deblank(hParentObject.InitialValue))
            newVal = [];
        else
            newVal = evalin('base', hParentObject.InitialValue);
        end
    end
    % 76 78
end
function actVal = setFcn_InitialValue(hObj, newVal)
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    persistent PERSISTENT_WARN_STATE;
    % 86 88
    if isempty(PERSISTENT_WARN_STATE)
        s = warning;
        warning('off', 'backtrace')
        warning(sprintf('The RTWInfo.InitialValue property of the mpt.Signal object will\nbe obsolete in a future version of Simulink.  Use the InitialValue\nproperty of the signal object.'));
        % 91 94
        % 92 94
        warning(s);
        % 94 98
        % 95 98
        % 96 98
        PERSISTENT_WARN_STATE = 1.0;
    end
    % 99 103
    % 100 103
    % 101 103
    actVal = newVal;
    if isnumeric(newVal)
        if not(isa(newVal, 'double'))
            actVal = double(newVal);
            s = warning;
            warning('off', 'backtrace')
            warning('InitialValue must be double. Cast the specified value to double.');
            warning(s);
        end
    else
        error('InitialValue must be numeric.');
    end
    % 114 117
    % 115 117
    hParentObject = hObj.hParentObject;
    % 117 120
    % 118 120
    if not(isempty(hParentObject)) && isprop(hParentObject, 'InitialValue')
        % 120 122
        strInitialValue = num2str(actVal, ' %.16g');
        % 122 125
        % 123 125
        strInitialValue(:, plus(end, 1.0)) = ';';
        strInitialValue = ctranspose(strInitialValue);
        strInitialValue = ctranspose(strInitialValue(:));
        strInitialValue = regexprep(strInitialValue, {' +','; *$',' *; *'}, {' ','','; '});
        % 128 131
        % 129 131
        strInitialValue = deblank(strInitialValue);
        if gt(numel(actVal), 1.0)
            strInitialValue = horzcat('[', strInitialValue, ']');
        end
        % 134 137
        % 135 137
        hParentObject.InitialValue = strInitialValue;
    end
    % 138 140
end
function actVal = setFcn_hParentObject(hObj, newVal)
    % 141 146
    % 142 146
    % 143 146
    % 144 146
    actVal = newVal;
    % 146 148
    if not(isempty(actVal)) && isprop(actVal, 'InitialValue')
        % 148 150
        strInitialValue = num2str(hObj.InitialValue, ' %.16g');
        % 150 153
        % 151 153
        strInitialValue(:, plus(end, 1.0)) = ';';
        strInitialValue = ctranspose(strInitialValue);
        strInitialValue = ctranspose(strInitialValue(:));
        strInitialValue = regexprep(strInitialValue, {' +','; *$',' *; *'}, {' ','','; '});
        % 156 159
        % 157 159
        strInitialValue = deblank(strInitialValue);
        if gt(numel(hObj.InitialValue), 1.0)
            strInitialValue = horzcat('[', strInitialValue, ']');
        end
        % 162 165
        % 163 165
        actVal.InitialValue = strInitialValue;
    end
    % 166 168
end
