function dlgStruct = disableNontunables(this, dlgStruct)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
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
                end
            end
        end
    end
end
