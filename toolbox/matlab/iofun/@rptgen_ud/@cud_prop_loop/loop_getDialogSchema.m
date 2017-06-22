function dlgStruct = loop_getDialogSchema(this, name)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('UddType')), cellhorzcat(this.dlgWidget('LoopType', 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('ReportedProperties', 'ForegroundColor', [1.0 1.0 255.0], 'Enabled', strcmp(this.LoopType, 'manual'))), cellhorzcat(this.dlgWidget('LocalPropertiesOnly')), cellhorzcat(this.dlgWidget('PublicGetOnly')), cellhorzcat(this.dlgWidget('PublicSetOnly')), cellhorzcat(this.dlgWidget('SerializableOnly')), cellhorzcat(this.dlgWidget('VisibleOnly'))), xlate('Select Properties'));
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
end % function
