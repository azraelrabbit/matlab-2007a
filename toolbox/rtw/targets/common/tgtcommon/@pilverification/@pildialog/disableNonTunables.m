function dlgStruct = disableNonTunables(obj, dlgStruct)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if isfield(dlgStruct, 'Items')
        for ind=1.0:length(dlgStruct.Items)
            dlgStruct.Items{ind} = obj.disableNonTunables(dlgStruct.Items{ind});
        end % for
    else
        if isfield(dlgStruct, 'Tabs')
            for ind=1.0:length(dlgStruct.Tabs)
                dlgStruct.Tabs{ind} = obj.disableNonTunables(dlgStruct.Tabs{ind});
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
