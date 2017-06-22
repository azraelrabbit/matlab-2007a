function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hCreateInPackage = findpackage('Simulink');
    % 9 11
    % 10 11
    hThisClass = schema.class(hCreateInPackage, 'MdlAdvisorCheck');
    % 12 14
    % 13 14
    hThisProp = schema.prop(hThisClass, 'ModelName', 'string');
    hThisProp.FactoryValue = '';
    % 16 18
    % 17 18
    hThisProp = schema.prop(hThisClass, 'Title', 'string');
    hThisProp.FactoryValue = '';
    % 20 23
    % 21 23
    % 22 23
    hThisProp = schema.prop(hThisClass, 'TitleTips', 'string');
    hThisProp.FactoryValue = '';
    % 25 28
    % 26 28
    % 27 28
    hThisProp = schema.prop(hThisClass, 'TitleInRAWFormat', 'bool');
    hThisProp.FactoryValue = false;
    % 30 32
    % 31 32
    hThisProp = schema.prop(hThisClass, 'RAWTitle', 'string');
    hThisProp.FactoryValue = '';
    % 34 36
    % 35 36
    hThisProp = schema.prop(hThisClass, 'ActionCallbackHandle', 'MATLAB callback');
    hThisProp.FactoryValue = [];
    % 38 40
    % 39 40
    hThisProp = schema.prop(hThisClass, 'ActionEnable', 'bool');
    hThisProp.FactoryValue = true;
    % 42 44
    % 43 44
    hThisProp = schema.prop(hThisClass, 'ActionSuccess', 'bool');
    hThisProp.FactoryValue = true;
    % 46 49
    % 47 49
    % 48 49
    hThisProp = schema.prop(hThisClass, 'ActionButtonName', 'string');
    hThisProp.FactoryValue = '';
    % 51 53
    % 52 53
    hThisProp = schema.prop(hThisClass, 'ActionDescription', 'string');
    hThisProp.FactoryValue = '';
    % 55 57
    % 56 57
    hThisProp = schema.prop(hThisClass, 'ActionResultInHTML', 'string');
    hThisProp.FactoryValue = '';
    % 59 61
    % 60 61
    hThisProp = schema.prop(hThisClass, 'CallbackHandle', 'MATLAB callback');
    hThisProp.FactoryValue = [];
    % 63 67
    % 64 67
    % 65 67
    % 66 67
    hThisProp = schema.prop(hThisClass, 'CallbackContext', 'string');
    hThisProp.FactoryValue = 'None';
    % 69 74
    % 70 74
    % 71 74
    % 72 74
    % 73 74
    hThisProp = schema.prop(hThisClass, 'CallbackStyle', 'string');
    hThisProp.FactoryValue = 'StyleOne';
    % 76 79
    % 77 79
    % 78 79
    hThisProp = schema.prop(hThisClass, 'CallbackReturnInRAWFormat', 'bool');
    hThisProp.FactoryValue = false;
    % 81 85
    % 82 85
    % 83 85
    % 84 85
    hThisProp = schema.prop(hThisClass, 'Visible', 'bool');
    hThisProp.FactoryValue = true;
    hThisProp = schema.prop(hThisClass, 'Enable', 'bool');
    hThisProp.FactoryValue = true;
    hThisProp = schema.prop(hThisClass, 'Value', 'bool');
    hThisProp.FactoryValue = true;
    % 91 94
    % 92 94
    % 93 94
    hThisProp = schema.prop(hThisClass, 'VisibleInProductList', 'bool');
    hThisProp.FactoryValue = true;
    % 96 99
    % 97 99
    % 98 99
    hThisProp = schema.prop(hThisClass, 'Group', 'string');
    hThisProp.FactoryValue = '';
    % 101 106
    % 102 106
    % 103 106
    % 104 106
    % 105 106
    hThisProp = schema.prop(hThisClass, 'GroupID', 'string');
    hThisProp.FactoryValue = '';
    hThisProp = schema.prop(hThisClass, 'TitleID', 'string');
    hThisProp.FactoryValue = '';
    % 110 112
    % 111 112
    hThisProp = schema.prop(hThisClass, 'Result', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 114 116
    % 115 116
    hThisProp = schema.prop(hThisClass, 'FoundObjects', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 118 120
    % 119 120
    hThisProp = schema.prop(hThisClass, 'ResultInHTML', 'string');
    hThisProp.FactoryValue = '';
    % 122 124
    % 123 124
    hThisProp = schema.prop(hThisClass, 'Success', 'bool');
    hThisProp.FactoryValue = true;
    % 126 128
    % 127 128
    hThisProp = schema.prop(hThisClass, 'InputParameters', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 130 132
    % 131 132
    hThisProp = schema.prop(hThisClass, 'InputParametersLayoutGrid', 'MATLAB array');
    hThisProp.FactoryValue = [];
    % 134 136
    % 135 136
    hThisProp = schema.prop(hThisClass, 'InputParamsDlgCallback', 'MATLAB callback');
    hThisProp.FactoryValue = [];
    % 138 140
    % 139 140
    hThisProp = schema.prop(hThisClass, 'ListViewParameters', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 142 145
    % 143 145
    % 144 145
    hThisProp = schema.prop(hThisClass, 'SelectedListViewParamIndex', 'int32');
    hThisProp.FactoryValue = 1.0;
    % 147 150
    % 148 150
    % 149 150
    hThisProp = schema.prop(hThisClass, 'ListViewActionCallback', 'MATLAB callback');
    hThisProp.FactoryValue = [];
    % 152 154
    % 153 154
    hThisProp = schema.prop(hThisClass, 'ListViewCloseCallback', 'MATLAB callback');
    hThisProp.FactoryValue = [];
    % 156 158
    % 157 158
    hThisProp = schema.prop(hThisClass, 'PushToModelExplorer', 'bool');
    hThisProp.FactoryValue = false;
    % 160 161
    hThisProp = schema.prop(hThisClass, 'PushToModelExplorerProperties', 'string vector');
    hThisProp.FactoryValue = {};
    % 163 165
    % 164 165
    hThisProp = schema.prop(hThisClass, 'ResultData', 'MATLAB array');
    hThisProp.FactoryValue = {};
    % 167 169
    % 168 169
    hThisProp = schema.prop(hThisClass, 'LicenseName', 'string vector');
    hThisProp.FactoryValue = {};
    % 171 174
    % 172 174
    % 173 174
    hThisProp = schema.prop(hThisClass, 'CallbackFcnPath', 'string');
    hThisProp.FactoryValue = '';
    % 176 177
    hThisProp = schema.prop(hThisClass, 'Selected', 'bool');
    hThisProp.FactoryValue = false;
    % 179 180
    hThisProp = schema.prop(hThisClass, 'SelectedByTask', 'bool');
    hThisProp.FactoryValue = false;
    % 182 183
    hThisProp = schema.prop(hThisClass, 'TitleIsDuplicate', 'bool');
    hThisProp.FactoryValue = false;
    % 185 186
    hThisProp = schema.prop(hThisClass, 'TitleIDIsDuplicate', 'bool');
    hThisProp.FactoryValue = false;
    % 188 189
    hThisProp = schema.prop(hThisClass, 'Index', 'int32');
    hThisProp.FactoryValue = 0.0;
end % function
