function dlgStruct = getDialogSchema(this, dummy)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    algorithm = dspGetLeafWidgetBase('combobox', 'Interpolation algorithm:', 'algorithm', this, 'algorithm');
    % 15 16
    algorithm.DialogRefresh = 1.0;
    algorithm.Visible = 0.0;
    % 18 20
    % 19 20
    algorithmActive = dspGetLeafWidgetBase('combobox', 'Interpolation algorithm:', 'algorithmActive', this, 'algorithmActive');
    % 21 22
    algorithmActive.DialogRefresh = 1.0;
    % 23 25
    % 24 25
    alignment = dspGetLeafWidgetBase('combobox', 'Sensor alignment:', 'alignment', this, 'alignment');
    % 26 27
    alignment.DialogRefresh = 1.0;
    % 28 29
    imagePortsMenu = dspGetLeafWidgetBase('combobox', 'Output image signal:', 'imagePorts', this, 'imagePorts');
    % 30 31
    imagePortsMenu.Entries = ctranspose(set(this, 'imagePorts'));
    % 32 33
    dlgStruct = this.getRootSchemaStruct(cellhorzcat(algorithm, algorithmActive, alignment, imagePortsMenu));
end % function
