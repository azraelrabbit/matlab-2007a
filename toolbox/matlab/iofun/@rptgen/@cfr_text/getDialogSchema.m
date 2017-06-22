function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    w = this.dlgWidget;
    % 8 9
    this.updateErrorState;
    % 10 12
    % 11 12
    wIsCode = this.dlgWidget('isCode', 'DialogRefresh', true);
    % 13 15
    % 14 15
    wIsEmphasis = this.dlgWidget('isEmphasis', 'DialogRefresh', true);
    % 16 18
    % 17 18
    wIsLiteral = this.dlgWidget('isLiteral', 'DialogRefresh', true);
    % 19 22
    % 20 22
    % 21 22
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgSet(w.Content, 'Type', 'editarea')), cellhorzcat(this.dlgContainer(vertcat(cellhorzcat(wIsCode), cellhorzcat(wIsEmphasis), cellhorzcat(wIsLiteral)), xlate('Style')))));
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
end % function
