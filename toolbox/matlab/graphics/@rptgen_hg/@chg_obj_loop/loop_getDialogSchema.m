function dlgStruct = loop_getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('ExcludeGUI')), cellhorzcat(this.dlgWidget('IncludeHidden')), cellhorzcat(RptgenML.twoColumnTable(this, 'SearchTerms', ''))), xlate('Select Objects'));
    % 8 11
    % 9 11
    % 10 11
end % function
