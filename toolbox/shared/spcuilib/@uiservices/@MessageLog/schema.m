function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    pkg_uisvc = findpackage('uiservices');
    hDeriveFromClass = findclass(pkg_uisvc, 'DialogBase');
    hThisClass = schema.class(pkg_uisvc, 'MessageLog', hDeriveFromClass);
    % 9 12
    % 10 12
    uiservices.RegisterDDGMethods(hThisClass, {'closedlg','getDialogSchema'});
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    m = schema.method(hThisClass, 'handleButtons');
    s = m.Signature;
    s.varargin = 'off';
    s.InputTypes = {'handle','string'};
    s.OutputTypes = {};
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    if isempty(findtype('AutoOpenModeType'))
        schema.EnumType('AutoOpenModeType', {'for any new messages','for warn/fail messages','only for fail messages','manually'});
        % 31 36
        % 32 36
        % 33 36
        % 34 36
    end
    % 36 56
    % 37 56
    % 38 56
    % 39 56
    % 40 56
    % 41 56
    % 42 56
    % 43 56
    % 44 56
    % 45 56
    % 46 56
    % 47 56
    % 48 56
    % 49 56
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    p = schema.prop(hThisClass, 'AutoOpenMode', 'AutoOpenModeType');
    p.FactoryValue = 'for any new messages';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'off';
    p.SetFunction = @sf_AutoOpenMode;
    p.GetFunction = @gf_AutoOpenMode;
    % 61 63
    p = schema.prop(hThisClass, 'AutoOpenModeSlave', 'AutoOpenModeType');
    p.FactoryValue = 'for any new messages';
    p.Visible = 'off';
    % 65 71
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    p = schema.prop(hThisClass, 'LinkedLogs', 'uiservices.MessageLog vector');
    p.SetFunction = @sf_LinkedLogs;
    % 72 76
    % 73 76
    % 74 76
    p = schema.prop(hThisClass, 'listen_LinkedLogs', 'handle.listener vector');
    % 76 80
    % 77 80
    % 78 80
    p.Visible = 'off';
    % 80 84
    % 81 84
    % 82 84
    p = schema.prop(hThisClass, 'listen_prop_LinkedLogs', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    p = schema.prop(hThisClass, 'cache_MergedLog', 'uiservices.MessageLog');
    % 91 95
    % 92 95
    % 93 95
    p.Visible = 'off';
    % 95 98
    % 96 98
    p = schema.prop(hThisClass, 'cache_SelectedDetail', 'string');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 100 111
    % 101 111
    % 102 111
    % 103 111
    % 104 111
    % 105 111
    % 106 111
    % 107 111
    % 108 111
    % 109 111
    schema.event(hThisClass, 'LogUpdated');
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    schema.event(hThisClass, 'AutoOpenModeChanged');
end
function listOfLogs = sf_LinkedLogs(hMessageLog, listOfLogs)
    % 118 132
    % 119 132
    % 120 132
    % 121 132
    % 122 132
    % 123 132
    % 124 132
    % 125 132
    % 126 132
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    listenList = hMessageLog.listen_LinkedLogs;
    for i=1.0:numel(listenList)
        delete(listenList(i));
    end % for
    % 135 137
    hMessageLog.listen_LinkedLogs = handle([]);
    % 137 141
    % 138 141
    % 139 141
    listenList = handle([]);
    for i=1.0:numel(listOfLogs)
        % 142 148
        % 143 148
        % 144 148
        % 145 148
        % 146 148
        theLinkedLog = listOfLogs(i);
        % 148 156
        % 149 156
        % 150 156
        % 151 156
        % 152 156
        % 153 156
        % 154 156
        listenList(i) = handle.listener(theLinkedLog, 'LogUpdated', @(hh,ev)updateForLinkedLog(hMessageLog,ev));
        % 156 158
    end % for
    hMessageLog.listen_LinkedLogs = listenList;
end
function val = sf_AutoOpenMode(hMsgLog, val)
    % 161 168
    % 162 168
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    hMsgLog.AutoOpenModeSlave = val;
    % 168 171
    % 169 171
    send(hMsgLog, 'AutoOpenModeChanged');
end
function val = gf_AutoOpenMode(hMsgLog, val)
    % 173 182
    % 174 182
    % 175 182
    % 176 182
    % 177 182
    % 178 182
    % 179 182
    % 180 182
    val = hMsgLog.AutoOpenModeSlave;
end
