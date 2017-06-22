function details = slCSProp2UI(hObj, hDlg, propName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    details = [];
    % 9 12
    % 10 12
    if not(isa(hObj, 'Simulink.BaseConfig'))
        return
    end
    % 14 17
    % 15 17
    if not(hObj.hasProp(propName))
        return
    end
    % 19 21
    if isa(hObj, 'Simulink.ConfigSet')
        dlg = hObj.getDialogSchema('simprm');
    else
        dlg = hObj.getDialogSchema('');
    end
    % 25 27
    [widget, path] = locFindWidget(dlg, propName, '');
    % 27 29
    if not(isempty(widget))
        if not(isfield(widget, 'Name')) || isempty(widget.Name)
            if isfield(widget, 'UserData') && isfield(widget.UserData, 'Name')
                details.Prompt = widget.UserData.Name;
            else
                details.Prompt = '';
            end
        else
            details.Prompt = widget.Name;
        end
        % 38 40
        details.Tag = widget.Tag;
        details.Type = widget.Type;
        details.Path = path;
    else
        details.Prompt = '';
        details.Tag = '';
        details.Type = 'NonUI';
        details.Path = '';
    end
    % 48 50
    if not(isempty(hDlg))
        if not(isempty(details.Tag))
            details.Visible = hDlg.isVisible(details.Tag);
            details.Enabled = hDlg.isEnabled(details.Tag);
        else
            details.Visible = 1.0;
            details.Enabled = 1.0;
        end
    end
end
function [widget, path] = locFindWidget(dlg, propName, path)
    % 60 62
    widget = [];
    % 62 64
    for i=1.0:length(dlg.Items{1.0}.Items)
        widget = loc_getWidget(dlg.Items{1.0}.Items{i}, propName);
        if not(isempty(widget))
            path = horzcat(' ', loc_getPath('', 1.0, i, dlg.Items{2.0}.TreeItems));
            return
        end
    end % for
end
function widget = loc_getWidget(dlg, propName)
    % 72 75
    % 73 75
    widget = [];
    % 75 77
    if isfield(dlg, 'Items')
        for i=1.0:length(dlg.Items)
            widget = loc_getWidget(dlg.Items{i}, propName);
            if not(isempty(widget))
                return
            end
        end % for
    else
        if isfield(dlg, 'ObjectProperty') && strcmp(dlg.ObjectProperty, propName)
            widget = dlg;
            return
        end
        if isfield(dlg, 'UserData') && isfield(dlg.UserData, 'ObjectProperty')
            if isstr(dlg.UserData.ObjectProperty) && strcmp(dlg.UserData.ObjectProperty, propName)
                widget = dlg;
                return
            else
                if iscell(dlg.UserData.ObjectProperty)
                    for i=1.0:length(dlg.UserData.ObjectProperty)
                        if isstr(dlg.UserData.ObjectProperty{i}) && strcmp(dlg.UserData.ObjectProperty{i}, propName)
                            widget = dlg;
                            return
                        end
                    end % for
                end
            end
        end
    end
end
function [path, curridx] = loc_getPath(path, curridx, targetidx, tree)
    % 106 108
    for i=1.0:length(tree)
        % 108 120
        % 109 120
        % 110 120
        % 111 120
        % 112 120
        % 113 120
        % 114 120
        % 115 120
        % 116 120
        % 117 120
        % 118 120
        if ischar(tree{i})
            if eq(curridx, targetidx)
                path = tree{i};
                return
            else
                if lt(i, length(tree)) && iscell(tree{plus(i, 1.0)})
                    [path, curridx] = loc_getPath(path, plus(curridx, 1.0), targetidx, tree{plus(i, 1.0)});
                    if eq(curridx, targetidx)
                        if not(isempty(path))
                            path = horzcat(tree{i}, '/', path);
                            return
                        end
                    end
                else
                    curridx = plus(curridx, 1.0);
                end
            end
        end
    end % for
end
