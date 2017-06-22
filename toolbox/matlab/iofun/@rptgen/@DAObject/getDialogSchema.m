function dlgStruct = getDialogSchema(this, name)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    allProps = find(get(classhandle(this), 'Properties'), '-depth', 0.0, 'Visible', 'on');
    % 8 9
    for i=length(allProps):-1.0:1.0
        allWidgets{i} = this.dlgWidget(allProps(i));
    end % for
    % 12 13
    dlgStruct = this.dlgMain(name, this.dlgContainer(allWidgets, 'Properties'));
    % 14 15
end % function
