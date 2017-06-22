function dlgStruct = disableNontunables(this, dlgStruct)
    % 1 5
    % 2 5
    % 3 5
    if isfield(dlgStruct, 'Items')
        for ind=1.0:length(dlgStruct.Items)
            dlgStruct.Items{ind} = this.disableNontunables(dlgStruct.Items{ind});
        end % for
    else
        if isfield(dlgStruct, 'Tabs')
            for ind=1.0:length(dlgStruct.Tabs)
                dlgStruct.Tabs{ind} = this.disableNontunables(dlgStruct.Tabs{ind});
            end % for
        else
            if isfield(dlgStruct, 'Tunable')
                if not(dlgStruct.Tunable)
                    dlgStruct.Enabled = 0.0;
                end % if
            else
                dlgStruct.Enabled = 0.0;
            end % if
        end % if
    end % if
end % function
