function dlgStruct = loop_getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if strcmp(this.LoopType, 'manual')
        extraControl = this.dlgWidget('PackageList', 'ForegroundColor', [1.0 1.0 255.0]);
    else
        % 10 11
        extraControl = this.dlgWidget('DirectoryName');
    end % if
    % 13 15
    % 14 15
    dlgStruct = this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('LoopType', 'DialogRefresh', true)), cellhorzcat(extraControl)), xlate('Select Packages'));
    % 16 18
    % 17 18
end % function
