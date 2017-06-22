function dlgStruct = getDialogSchema(this, name)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    loopWidgets = this.loop_getDialogSchema(name);
    if not(iscell(loopWidgets))
        loopWidgets = cellhorzcat(loopWidgets);
    end % if
    % 16 18
    % 17 18
    if strcmp(name, 'loop')
        dlgStruct = this.dlgMain('panel', loopWidgets);
    else
        sectionWidgets = this.dlgSectionOptions;
        if not(iscell(sectionWidgets))
            sectionWidgets = cellhorzcat(sectionWidgets);
        end % if
        % 25 26
        dlgStruct = this.dlgMain(name, cellhorzcat(loopWidgets{:}, sectionWidgets{:}));
        % 27 29
        % 28 29
    end % if
end % function
