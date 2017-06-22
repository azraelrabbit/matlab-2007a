function props = slCSUI2Prop(hObj, uiItem)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    props = [];
    % 7 10
    % 8 10
    if not(isa(hObj, 'Simulink.BaseConfig'))
        return
    end
    % 12 14
    if isa(hObj, 'Simulink.ConfigSet')
        dlg = hObj.getDialogSchema('simprm');
    else
        dlg = hObj.getDialogSchema('');
    end
    % 18 20
    props = locFindProps(dlg, uiItem.Prompt, uiItem.Type, uiItem.Path);
end
function props = locFindProps(dlg, prompt, type, path)
    % 22 24
    props = [];
    % 24 26
    if isfield(dlg, 'Items')
        for i=1.0:length(dlg.Items)
            newProps = locFindProps(dlg.Items{i}, prompt, type, path);
            if isempty(props)
                props = newProps;
            else
                if not(isempty(newProps))
                    props = cellhorzcat(props{1.0:end}, newProps{1.0:end});
                end
            end
        end % for
    else
        if isfield(dlg, 'Tabs')
            for i=1.0:length(dlg.Tabs)
                if not(isempty(path)) && strncmpi(path, dlg.Tabs{i}.Name, length(dlg.Tabs{i}.Name))
                    newPath = path(plus(length(dlg.Tabs{i}.Name), 2.0):end);
                    props = locFindProps(dlg.Tabs{i}, prompt, type, newPath);
                else
                    if not(isempty(path))
                        continue;
                    else
                        newProps = locFindProps(dlg.Tabs{i}, prompt, type, path);
                        if isempty(props)
                            props = newProps;
                        else
                            if not(isempty(newProps))
                                props = cellhorzcat(props{1.0:end}, newProps{1.0:end});
                            end
                        end
                    end
                end
            end % for
        else
            if strcmpi(type, 'any') || strcmpi(type, dlg.Type)
                if isfield(dlg, 'Name') && strncmpi(dlg.Name, prompt, length(prompt))
                    if isfield(dlg, 'ObjectProperty') && not(isempty(dlg.ObjectProperty))
                        props = cellhorzcat(dlg.ObjectProperty);
                    else
                        if isfield(dlg, 'UserData') && isfield(dlg.UserData, 'ObjectProperty') && not(isempty(dlg.UserData.ObjectProperty))
                            if isstr(dlg.UserData.ObjectProperty)
                                props = cellhorzcat(dlg.UserData.ObjectProperty);
                            else
                                if iscell(dlg.UserData.ObjectProperty)
                                    props = dlg.UserData.ObjectProperty;
                                end
                            end
                        end
                    end
                else
                    if isfield(dlg, 'UserData') && isfield(dlg.UserData, 'Name') && not(isempty(dlg.UserData.Name)) && strncmpi(dlg.UserData.Name, prompt, length(prompt))
                        if isfield(dlg, 'ObjectProperty') && not(isempty(dlg.ObjectProperty))
                            props = cellhorzcat(dlg.ObjectProperty);
                        else
                            if isfield(dlg, 'UserData') && isfield(dlg.UserData, 'ObjectProperty') && not(isempty(dlg.UserData.ObjectProperty))
                                if isstr(dlg.UserData.ObjectProperty)
                                    props = cellhorzcat(dlg.UserData.ObjectProperty);
                                else
                                    if iscell(dlg.UserData.ObjectProperty)
                                        props = dlg.UserData.ObjectProperty;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
