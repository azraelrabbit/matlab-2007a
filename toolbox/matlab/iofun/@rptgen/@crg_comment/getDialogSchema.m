function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(this.dlgWidget('CommentText', 'Type', 'editarea')), cellhorzcat(this.dlgWidget('isDisplayComment', 'DialogRefresh', true)), cellhorzcat(this.dlgWidget('CommentStatusLevel', 'Enabled', this.isDisplayComment))), xlate('Properties')))));
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
end % function
