function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock
    % 9 13
    % 10 13
    % 11 13
    hCreateInPackage = findpackage('Simulink');
    % 13 16
    % 14 16
    hThisClass = schema.class(hCreateInPackage, 'CSCDefn');
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    cscdefn_enumtypes;
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    hThisProp = schema.prop(hThisClass, 'Name', 'string');
    % 28 30
    hThisProp = schema.prop(hThisClass, 'OwnerPackage', 'string');
    % 30 32
    hThisProp = schema.prop(hThisClass, 'CSCType', 'CSC_Enum_CSCType');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'Unstructured';
    % 34 36
    hPostSetListener = handle.listener(hThisClass, hThisProp, 'PropertyPostSet', @postSetFcn_CSCType);
    % 36 39
    % 37 39
    schema.prop(hThisProp, 'PostSetListener', 'handle');
    hThisProp.PostSetListener = hPostSetListener;
    % 40 42
    hThisProp = schema.prop(hThisClass, 'MemorySection', 'string');
    % 42 44
    hThisProp = schema.prop(hThisClass, 'IsMemorySectionInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 46 48
    hThisProp = schema.prop(hThisClass, 'IsGrouped', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 50 52
    hPostSetListener = handle.listener(hThisClass, hThisProp, 'PropertyPostSet', @postSetFcn_IsGrouped);
    % 52 55
    % 53 55
    schema.prop(hThisProp, 'PostSetListener', 'handle');
    hThisProp.PostSetListener = hPostSetListener;
    % 56 68
    % 57 68
    % 58 68
    % 59 68
    % 60 68
    % 61 68
    % 62 68
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    hThisProp = schema.prop(hThisClass, 'DataUsage', 'handle');
    % 68 70
    hThisProp = schema.prop(hThisClass, 'DataScope', 'CSC_Enum_DataScope');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'Auto';
    % 72 74
    hThisProp = schema.prop(hThisClass, 'IsDataScopeInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 76 78
    hThisProp = schema.prop(hThisClass, 'DataInit', 'CSC_Enum_DataInit');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'Auto';
    % 80 82
    hThisProp = schema.prop(hThisClass, 'IsDataInitInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 84 86
    hThisProp = schema.prop(hThisClass, 'DataAccess', 'CSC_Enum_DataAccess');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'Direct';
    % 88 90
    hThisProp = schema.prop(hThisClass, 'IsDataAccessInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 92 94
    hThisProp = schema.prop(hThisClass, 'HeaderFile', 'string');
    hThisProp.SetFunction = @setFcn_HeaderFile;
    % 95 97
    hThisProp = schema.prop(hThisClass, 'IsHeaderFileInstanceSpecific', 'bool');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = logical(0);
    % 99 101
    hThisProp = schema.prop(hThisClass, 'CommentSource', 'CSC_Enum_CommentSource');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'Default';
    % 103 105
    hThisProp = schema.prop(hThisClass, 'TypeComment', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 106 108
    hThisProp = schema.prop(hThisClass, 'DeclareComment', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 109 111
    hThisProp = schema.prop(hThisClass, 'DefineComment', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 112 114
    hThisProp = schema.prop(hThisClass, 'CSCTypeAttributesClassName', 'string');
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 115 119
    % 116 119
    % 117 119
    hPostSetListener = handle.listener(hThisClass, hThisProp, 'PropertyPostSet', @postSetFcn_CSCTypeAttributesClassName);
    % 119 122
    % 120 122
    schema.prop(hThisProp, 'PostSetListener', 'handle');
    hThisProp.PostSetListener = hPostSetListener;
    % 123 125
    hThisProp = schema.prop(hThisClass, 'CSCTypeAttributes', 'handle');
    hThisProp.SetFunction = @setFcn_CSCTypeAttributes;
    % 126 128
    hThisProp = schema.prop(hThisClass, 'TLCFileName', 'string');
    hThisProp.AccessFlags.Init = 'on';
    hThisProp.FactoryValue = 'Unstructured.tlc';
    % 130 133
    % 131 133
    hThisProp.SetFunction = @setFcn_StringTrim;
    % 133 140
    % 134 140
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    m = schema.method(hThisClass, 'isAddressable');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','Simulink.Data'};
    s.OutputTypes = {'bool'};
end
function actVal = setFcn_StringTrim(hObj, newVal)
    % 146 160
    % 147 160
    % 148 160
    % 149 160
    % 150 160
    % 151 160
    % 152 160
    % 153 160
    % 154 160
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    actVal = strtrim(newVal);
end
function actVal = setFcn_HeaderFile(hObj, newVal)
    % 162 171
    % 163 171
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    errTxt = slprivate('check_headerfile_string', newVal);
    if not(isempty(errTxt))
        error(errTxt);
    end
    % 174 176
    actVal = strtrim(newVal);
end
function postSetFcn_CSCType(hProp, eventData)
    % 178 186
    % 179 186
    % 180 186
    % 181 186
    % 182 186
    % 183 186
    % 184 186
    hObj = eventData.AffectedObject;
    % 186 189
    % 187 189
    newVal = eventData.NewVal;
    % 189 191
    switch newVal
    case 'Unstructured'
        set(hObj, 'IsGrouped', false);
        set(hObj, 'CSCTypeAttributesClassName', '');
        set(hObj, 'TLCFileName', 'Unstructured.tlc');
    case 'FlatStructure'
        % 196 198
        set(hObj, 'IsGrouped', true);
        set(hObj, 'CSCTypeAttributesClassName', 'Simulink.CSCTypeAttributes_FlatStructure');
        set(hObj, 'TLCFileName', 'FlatStructure.tlc');
    case 'Other'
        % 201 203
        set(hObj, 'CSCTypeAttributesClassName', '');
        set(hObj, 'TLCFileName', '');
    end
end
function postSetFcn_IsGrouped(hProp, eventData)
    % 207 215
    % 208 215
    % 209 215
    % 210 215
    % 211 215
    % 212 215
    % 213 215
    hObj = eventData.AffectedObject;
    % 215 218
    % 216 218
    newVal = eventData.NewVal;
    % 218 220
    if newVal
        set(hObj, 'IsMemorySectionInstanceSpecific', false);
        set(hObj, 'IsDataScopeInstanceSpecific', false);
        set(hObj, 'IsDataInitInstanceSpecific', false);
        set(hObj, 'IsDataAccessInstanceSpecific', false);
        set(hObj, 'IsHeaderFileInstanceSpecific', false);
    end
end
function postSetFcn_CSCTypeAttributesClassName(hProp, eventData)
    % 228 236
    % 229 236
    % 230 236
    % 231 236
    % 232 236
    % 233 236
    % 234 236
    hObj = eventData.AffectedObject;
    % 236 239
    % 237 239
    newVal = strtrim(eventData.NewVal);
    % 239 241
    set(hObj, 'CSCTypeAttributes', []);
    % 241 243
    if not(isempty(newVal))
        % 243 246
        % 244 246
        hCSCTypeAttributes = [];
        try
            hCSCTypeAttributes = eval(newVal);
            set(hObj, 'CSCTypeAttributes', hCSCTypeAttributes);
        catch
            error(horzcat('Cannot use class ''', newVal, ''': ', lasterr));
        end % try
    end
end
function actVal = setFcn_CSCTypeAttributes(hObj, newVal)
    % 255 265
    % 256 265
    % 257 265
    % 258 265
    % 259 265
    % 260 265
    % 261 265
    % 262 265
    % 263 265
    if not(isempty(newVal)) && not(isa(newVal, 'Simulink.CustomStorageClassAttributes'))
        % 265 267
        newValCls = class(newVal);
        error('Expected an object belonging to class: Simulink.CustomStorageClassAttributes');
        % 268 270
    end
    % 270 272
    actVal = newVal;
end
