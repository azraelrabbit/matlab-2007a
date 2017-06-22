function dlg = getDialogSchema(smc, type)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    perfIdentEvents.Name = 'Execution order of simultaneous events:';
    perfIdentEvents.ObjectProperty = 'propIdentEvents';
    perfIdentEvents.Type = 'combobox';
    perfIdentEvents.Entries = {'Arbitrary','Randomized'};
    perfIdentEvents.RowSpan = [1.0 1.0];
    perfIdentEvents.ColSpan = [1.0 1.0];
    % 23 26
    % 24 26
    % 25 26
    perfIdentEvents.Mode = 1.0;
    perfIdentEvents.DialogRefresh = 1.0;
    % 28 30
    % 29 30
    perfIdentEventSeed.Name = 'Seed for event randomization';
    perfIdentEventSeed.ObjectProperty = 'propIdentEventSeed';
    perfIdentEventSeed.Type = 'edit';
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    perfIdentEventSeed.Visible = double(isequal(smc.propIdentEvents, 1.0));
    perfIdentEventSeed.RowSpan = [2.0 2.0];
    perfIdentEventSeed.ColSpan = [1.0 1.0];
    % 40 41
    errUnconnectedPorts.Name = 'Treat unconnected ports as:';
    errUnconnectedPorts.Type = 'combobox';
    errUnconnectedPorts.ObjectProperty = 'propUnconnectedPorts';
    errUnconnectedPorts.Entries = {'None','Warning','Error'};
    errUnconnectedPorts.RowSpan = [3.0 3.0];
    errUnconnectedPorts.ColSpan = [1.0 1.0];
    % 47 58
    % 48 58
    % 49 58
    % 50 58
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    % 57 58
    instEventLogger4.Name = 'Display events in event calendar';
    instEventLogger4.ObjectProperty = 'propDisplayEventCalendar';
    instEventLogger4.Type = 'checkbox';
    instEventLogger4.RowSpan = [1.0 1.0];
    instEventLogger4.ColSpan = [1.0 4.0];
    instEventLogger4.Mode = 1.0;
    instEventLogger4.DialogRefresh = 1.0;
    % 65 66
    instEventLogger1.Name = 'Log events when scheduled';
    instEventLogger1.ObjectProperty = 'propLogEventsScheduled';
    instEventLogger1.Type = 'checkbox';
    instEventLogger1.RowSpan = [3.0 3.0];
    instEventLogger1.ColSpan = [2.0 4.0];
    instEventLogger1.Enabled = double(isequal(smc.propDisplayEventCalendar, 0.0));
    % 72 73
    instEventLogger2.Name = 'Log events when executed';
    instEventLogger2.ObjectProperty = 'propLogEventsExecuted';
    instEventLogger2.Type = 'checkbox';
    instEventLogger2.RowSpan = [2.0 2.0];
    instEventLogger2.ColSpan = [2.0 4.0];
    instEventLogger2.Enabled = double(isequal(smc.propDisplayEventCalendar, 0.0));
    % 79 80
    instSpacer1.Type = 'text';
    instSpacer1.Name = '';
    instSpacer1.MinimumSize = [25.0 0.0];
    instSpacer1.MaximumSize = [25.0 10000.0];
    instSpacer1.RowSpan = [3.0 3.0];
    instSpacer1.ColSpan = [1.0 1.0];
    % 86 87
    instSpacer2.Type = 'text';
    instSpacer2.Name = '';
    instSpacer2.MinimumSize = [25.0 0.0];
    instSpacer2.MaximumSize = [25.0 10000.0];
    instSpacer2.RowSpan = [2.0 2.0];
    instSpacer2.ColSpan = [1.0 1.0];
    % 93 94
    instEventLogger3.Name = 'Log entities advancing from block to block ';
    instEventLogger3.ObjectProperty = 'propLogDepartureEvents';
    instEventLogger3.Type = 'checkbox';
    instEventLogger3.RowSpan = [4.0 4.0];
    instEventLogger3.ColSpan = [1.0 4.0];
    % 99 101
    % 100 101
    grpInst.Name = 'Event Log';
    grpInst.Type = 'group';
    % 103 104
    grpInst.Items = cellhorzcat(instEventLogger4, instEventLogger2, instEventLogger1, instEventLogger3, instSpacer1, instSpacer2);
    grpInst.RowSpan = [3.0 3.0];
    grpInst.ColSpan = [1.0 1.0];
    grpInst.LayoutGrid = [4.0 4.0];
    % 108 111
    % 109 111
    % 110 111
    items = cellhorzcat(perfIdentEvents, perfIdentEventSeed, grpInst);
    % 112 113
    if isempty(type)
        dlg = l_make_default(smc, items);
    else
        dlg = l_make_stack(smc, items);
    end % if
end % function
function dlg = l_make_default(smc, items)
    % 120 122
    % 121 122
    dlg = struct('DialogTitle', {'SimEvents'}, 'Items', cellhorzcat(cellhorzcat(l_make_panel(smc, items))), 'LayoutGrid', {[6.0,1.0]});
    % 123 124
end % function
function stack = l_make_stack(smc, items)
    % 126 130
    % 127 130
    % 128 130
    % 129 130
    stack = struct('List', {{'SimEvents'}}, 'Items', cellhorzcat(cellhorzcat(l_make_panel(smc, items))), 'Ids', {{[0.0]}});
    % 131 132
end % function
function panel = l_make_panel(smc, items)
    % 134 138
    % 135 138
    % 136 138
    % 137 138
    panel = struct('Name', {''}, 'Type', {'panel'}, 'Items', cellhorzcat(items), 'Source', cellhorzcat(smc), 'LayoutGrid', cellhorzcat(horzcat(plus(length(items), 2.0), 1.0)), 'RowStretch', cellhorzcat(horzcat(zeros(1.0, length(items)), 0.0, 1.0)));
    % 139 143
    % 140 143
    % 141 143
    % 142 143
end % function
