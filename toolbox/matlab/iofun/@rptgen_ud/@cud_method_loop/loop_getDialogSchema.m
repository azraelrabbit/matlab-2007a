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
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('UddType')), cellhorzcat(this.dlgWidget('LoopType', 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('ReportedMethods', 'ForegroundColor', [1.0 1.0 255.0], 'Enabled', strcmp(this.LoopType, 'manual'))), cellhorzcat(this.dlgWidget('LocalMethodsOnly'))), xlate('Select Methods'));
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
