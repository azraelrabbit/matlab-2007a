function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    globalEnable = not(isLibrary(this));
    % 8 10
    dtProp = struct(findprop(classhandle(this), 'DataTypeString'));
    dtProp.DataType = vertcat(cellhorzcat('double', xlate('Double')), cellhorzcat('!ENUMERATION', xlate('Enumeration')), cellhorzcat('int32', xlate('Integer')), cellhorzcat('string', xlate('String')), cellhorzcat('string vector', xlate('String vector')), cellhorzcat(rptgen.makeStringType, xlate('%<ParsedString>')), cellhorzcat('bool', xlate('True/False')));
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    fvProp = 'FactoryValueString';
    if strcmp(this.DataTypeString, '!ENUMERATION')
        if not(isempty(this.EnumValues))
            fvProp = struct(findprop(classhandle(this), fvProp));
            fvProp.DataType = horzcat(strcat('''', this.EnumValues, ''''), this.EnumValues);
        end % if
        % 26 28
        [pPropertyName, wPropertyName] = locWidget(this, 'PropertyName', 'DialogRefresh', true, 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 3.0], 'Enabled', globalEnable);
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        [pDataType, wDataType] = locWidget(this, dtProp, 'Editable', true, 'RowSpan', [2.0 2.0], 'ColSpan', [2.0 3.0], 'DialogRefresh', true, 'Enabled', globalEnable);
        % 33 39
        % 34 39
        % 35 39
        % 36 39
        % 37 39
        [pFactory, wFactory] = locWidget(this, fvProp, 'DialogRefresh', true, 'RowSpan', [4.0 4.0], 'ColSpan', [2.0 3.0], 'Enabled', globalEnable);
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        [pDescription, wDescription] = locWidget(this, 'Description', 'DialogRefresh', true, 'RowSpan', [5.0 5.0], 'ColSpan', [2.0 3.0], 'Enabled', globalEnable);
        % 44 50
        % 45 50
        % 46 50
        % 47 50
        % 48 50
        controls = this.dlgContainer(vertcat(cellhorzcat(pPropertyName), cellhorzcat(wPropertyName), cellhorzcat(pDataType), cellhorzcat(wDataType), cellhorzcat(this.dlgWidget('EnumValues', 'DialogRefresh', true, 'RowSpan', [3.0 3.0], 'ColSpan', [2.0 2.0], 'Enabled', globalEnable)), cellhorzcat(this.dlgWidget('EnumNames', 'DialogRefresh', true, 'RowSpan', [3.0 3.0], 'ColSpan', [3.0 3.0], 'Enabled', globalEnable)), cellhorzcat(pFactory), cellhorzcat(wFactory), cellhorzcat(pDescription), cellhorzcat(wDescription)), xlate('Enumeration Properties'), 'LayoutGrid', [5.0 3.0]);
    else
        % 51 70
        % 52 70
        % 53 70
        % 54 70
        % 55 70
        % 56 70
        % 57 70
        % 58 70
        % 59 70
        % 60 70
        % 61 70
        % 62 70
        % 63 70
        % 64 70
        % 65 70
        % 66 70
        % 67 70
        % 68 70
        % 69 82
        % 70 82
        % 71 82
        % 72 82
        % 73 82
        % 74 82
        % 75 82
        % 76 82
        % 77 82
        % 78 82
        % 79 82
        % 80 82
        controls = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('PropertyName', 'DialogRefresh', true, 'Enabled', globalEnable)), cellhorzcat(this.dlgWidget(dtProp, 'Editable', true, 'DialogRefresh', true, 'Enabled', globalEnable)), cellhorzcat(this.dlgWidget(fvProp, 'DialogRefresh', true, 'Enabled', globalEnable)), cellhorzcat(this.dlgWidget('Description', 'DialogRefresh', true, 'Enabled', globalEnable))), xlate('Properties'));
        % 82 97
        % 83 97
        % 84 97
        % 85 97
        % 86 97
        % 87 97
        % 88 97
        % 89 97
        % 90 97
        % 91 97
        % 92 97
        % 93 97
        % 94 97
        % 95 97
    end % if
    % 97 99
    try
        codeText = this.toString;
    catch
        % 101 103
        codeText = horzcat('<< ', lasterr, ' >>');
        % 103 106
        % 104 106
    end % try
    % 106 108
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(struct('Type', 'pushbutton', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'ObjectMethod', 'exploreAction', 'FilePath', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'ComponentMakerData.png'))), cellhorzcat(this.dlgText(xlate('Add property to current component'), 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0]))), xlate('Add Property'), 'LayoutGrid', [1.0 2.0], 'ColStretch', [0.0 1.0], 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'Visible', not(globalEnable))), cellhorzcat(this.dlgSet(controls, 'RowSpan', [2.0 2.0], 'ColSpan', [1.0 1.0])), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgText(codeText, 'FontFamily', '%fixedwidth'))), xlate('Code Preview'), 'RowSpan', [3.0 3.0], 'ColSpan', [1.0 1.0]))), 'LayoutGrid', [3.0 1.0], 'RowStretch', [0.0 0.0 1.0]);
    % 108 136
    % 109 136
    % 110 136
    % 111 136
    % 112 136
    % 113 136
    % 114 136
    % 115 136
    % 116 136
    % 117 136
    % 118 136
    % 119 136
    % 120 136
    % 121 136
    % 122 136
    % 123 136
    % 124 136
    % 125 136
    % 126 136
    % 127 136
    % 128 136
    % 129 136
    % 130 136
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    dlgStruct.DialogTitle = xlate('Create Component: Property');
function [pPrompt, pWidget] = locWidget(this, varargin)
    % 137 142
    % 138 142
    % 139 142
    % 140 142
    pWidget = this.dlgWidget(varargin{:});
    pPrompt = this.dlgText(pWidget.Name, 'RowSpan', pWidget.RowSpan, 'ColSpan', [1.0 1.0]);
    pWidget = rmfield(pWidget, 'Name');
