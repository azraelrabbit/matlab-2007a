function dlg = getDialogSchema(smc, type)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    properties = MECH.DialogPropertyList('MECH.ModelEnvironment');
    groups = properties.createPropertyGroups;
    % 13 14
    items = {};
    % 15 16
    for i=1.0:length(groups)
        % 17 18
        if not(isempty(groups(i).Description))
            % 19 24
            % 20 24
            % 21 24
            % 22 24
            % 23 24
            text.Name = groups(i).Description;
            text.Type = 'text';
            text.ColSpan = [1.0 1.0];
            text.RowSpan = [1.0 1.0];
            text.WordWrap = true;
            % 29 30
            textpanel.Name = '';
            textpanel.Type = 'panel';
            textpanel.Items = cellhorzcat(text);
            textpanel.LayoutGrid = [2.0 1.0];
            textpanel.RowStretch = [0.0 1.0];
            textpanel.ColSpan = [1.0 1.0];
            textpanel.RowSpan = [1.0 1.0];
            % 37 38
            parampanel.Name = '';
            parampanel.Type = 'panel';
            parampanel.Items = groups(i).Items;
            parampanel.LayoutGrid = horzcat(plus(length(groups(i).Items), 1.0), 3.0);
            parampanel.RowStretch = horzcat(zeros(1.0, length(groups(i).Items)), 1.0);
            parampanel.RowSpan = [2.0 2.0];
            parampanel.ColSpan = [1.0 1.0];
            % 45 46
            group.Name = groups(i).Name;
            group.Type = 'group';
            group.Items = cellhorzcat(textpanel, parampanel);
            group.LayoutGrid = [3.0 1.0];
            group.RowSpan = horzcat(i, i);
            group.ColSpan = [1.0 1.0];
            group.RowStretch = [0.0 0.0 1.0];
        else
            % 54 58
            % 55 58
            % 56 58
            % 57 58
            parampanel.Name = '';
            parampanel.Type = 'panel';
            parampanel.Items = groups(i).Items;
            parampanel.LayoutGrid = horzcat(plus(length(groups(i).Items), 1.0), 3.0);
            parampanel.RowStretch = horzcat(zeros(1.0, length(groups(i).Items)), 1.0);
            parampanel.RowSpan = [1.0 1.0];
            parampanel.ColSpan = [1.0 1.0];
            % 65 66
            group.Name = groups(i).Name;
            group.Type = 'group';
            group.Items = cellhorzcat(parampanel);
            group.LayoutGrid = [2.0 1.0];
            group.RowSpan = horzcat(i, i);
            group.ColSpan = [1.0 1.0];
            group.RowStretch = [0.0 1.0];
        end % if
        % 74 75
        items{plus(end, 1.0)} = group;
    end % for
    % 77 78
    if isempty(type)
        dlg = l_make_default(smc, items);
    else
        dlg = l_make_stack(smc, items);
    end % if
end % function
function dlg = l_make_default(smc, items)
    % 85 87
    % 86 87
    dlg = struct('DialogTitle', {'SimMechanics'}, 'Items', cellhorzcat(cellhorzcat(l_make_panel(smc, items))), 'LayoutGrid', {[2.0,1.0]}, 'RowStretch', {[0.0,1.0]});
    % 88 90
    % 89 90
end % function
function stack = l_make_stack(smc, items)
    % 92 95
    % 93 95
    % 94 95
    stack = struct('Name', 'SimMechanics', 'List', {{'SimMechanics'}}, 'Items', cellhorzcat(cellhorzcat(l_make_panel(smc, items))), 'Ids', {{[0.0]}});
    % 96 98
    % 97 98
end % function
function panel = l_make_panel(smc, items)
    % 100 104
    % 101 104
    % 102 104
    % 103 104
    panel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(items), 'Source', cellhorzcat(smc), 'LayoutGrid', cellhorzcat(horzcat(plus(length(items), 1.0), 1.0)), 'RowStretch', cellhorzcat(horzcat(zeros(1.0, length(items)), 1.0)));
    % 105 109
    % 106 109
    % 107 109
    % 108 109
end % function
