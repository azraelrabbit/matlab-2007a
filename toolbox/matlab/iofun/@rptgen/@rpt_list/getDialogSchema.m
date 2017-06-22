function dlgStruct = getDialogSchema(this, name)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    thisClass = classhandle(this);
    parentClass = thisClass.Superclasses;
    % 9 11
    pLocal = setdiff(get(thisClass.Properties, 'Name'), get(parentClass.Properties, 'Name'));
    % 11 13
    if isempty(pLocal)
        wLocal = cellhorzcat(this.dlgText('LIST'));
    else
        for i=length(pLocal):-1.0:1.0
            wLocal{i} = this.dlgWidget(pLocal{i});
        end % for
    end % if
    % 19 21
    dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(this.dlgContainer(wLocal, xlate('List Content'))), cellhorzcat(this.list_getDialogSchema(name))));
    % 21 24
    % 22 24
end % function
