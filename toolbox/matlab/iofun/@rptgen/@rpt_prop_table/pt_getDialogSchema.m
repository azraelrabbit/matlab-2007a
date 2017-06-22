function wLocal = pt_getDialogSchema(this, name)
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
    thisClass = classhandle(this);
    parentClass = thisClass.Superclasses;
    % 15 17
    pLocal = setdiff(get(thisClass.Properties, 'Name'), get(parentClass.Properties, 'Name'));
    % 17 19
    if isempty(pLocal)
        wLocal = cellhorzcat(this.dlgText(xlate('Loop')));
    else
        for i=length(pLocal):-1.0:1.0
            wLocal{i} = this.dlgWidget(pLocal{i}, 'DialogRefresh', true);
            % 23 25
        end % for
    end % if
end % function
