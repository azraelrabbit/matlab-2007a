function simmenu(action)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if eq(nargin, 0.0)
        % 9 11
        figNumber = get(0.0, 'CurrentFigure');
        set(figNumber, 'CreateFcn', '');
        if strcmp(get(figNumber, 'MenuBar'), 'none')
            if strncmp(computer, 'MA', 2.0)
                action = 'initialize';
            else
                action = '';
            end % if
        else
            error('Simmenu is to be used only when the menubar property is set to "none".')
            % 20 22
            action = '';
        end % if
    end % if
    % 24 26
    switch action
    case 'initialize'
        figNumber = gcf;
        % 28 30
        fileHndl = uimenu(figNumber, 'Label', 'File', 'Tag', 'MenuFile', 'HandleVisibility', 'callback');
        % 30 34
        % 31 34
        % 32 34
        newHndl = uimenu(fileHndl, 'Label', 'New', 'Tag', 'MenuFileNew', 'HandleVisibility', 'callback');
        % 34 38
        % 35 38
        % 36 38
        uimenu(newHndl, 'Label', 'M-File', 'Tag', 'MenuFileNewM-File', 'HandleVisibility', 'callback', 'Enable', 'off', 'Callback', 'simmenu newmfile');
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        uimenu(newHndl, 'Label', 'Figure', 'Tag', 'MenuFileNewFigure', 'HandleVisibility', 'callback', 'Callback', 'figure');
        % 44 50
        % 45 50
        % 46 50
        % 47 50
        % 48 50
        if not(exist('open_system', 'builtin'))
            enableStr = 'off';
        else
            enableStr = 'on';
        end % if
        uimenu(newHndl, 'Label', 'Model', 'Tag', 'MenuFileNewModel', 'HandleVisibility', 'callback', 'Accelerator', 'n', 'Enable', enableStr, 'Callback', 'simmenu newmodel');
        % 55 58
        % 56 58
        uimenu(fileHndl, 'Label', 'Open', 'Tag', 'MenuFileOpen', 'HandleVisibility', 'callback', 'Accelerator', 'o', 'Enable', 'off', 'Callback', 'simmenu open');
        % 58 65
        % 59 65
        % 60 65
        % 61 65
        % 62 65
        % 63 65
        uimenu(fileHndl, 'Label', 'Close', 'Tag', 'MenuFileClose', 'HandleVisibility', 'callback', 'Accelerator', 'w', 'Callback', 'close(gcf)');
        % 65 71
        % 66 71
        % 67 71
        % 68 71
        % 69 71
        uimenu(fileHndl, 'Label', 'Save', 'Tag', 'MenuFileSave', 'HandleVisibility', 'callback', 'Enable', 'off', 'Accelerator', 's', 'Callback', '');
        % 71 78
        % 72 78
        % 73 78
        % 74 78
        % 75 78
        % 76 78
        uimenu(fileHndl, 'Label', 'Save As...', 'Tag', 'MenuFileSave As...', 'HandleVisibility', 'callback', 'Enable', 'off', 'Callback', '');
        % 78 84
        % 79 84
        % 80 84
        % 81 84
        % 82 84
        uimenu(fileHndl, 'Label', 'Printer Setup...', 'Tag', 'MenuFilePrinter Setup...', 'HandleVisibility', 'callback', 'Enable', 'off', 'Callback', '');
        % 84 90
        % 85 90
        % 86 90
        % 87 90
        % 88 90
        uimenu(fileHndl, 'Label', 'Print...', 'Tag', 'MenuFilePrint...', 'HandleVisibility', 'callback', 'Enable', 'off', 'Accelerator', 'p', 'Callback', '');
        % 90 97
        % 91 97
        % 92 97
        % 93 97
        % 94 97
        % 95 97
        uimenu(fileHndl, 'Label', 'Quit', 'Tag', 'MenuFileQuit', 'HandleVisibility', 'callback', 'Callback', 'quit');
        % 97 105
        % 98 105
        % 99 105
        % 100 105
        % 101 105
        % 102 105
        % 103 105
        editHndl = uimenu(figNumber, 'Label', 'Edit', 'Tag', 'MenuEdit', 'HandleVisibility', 'callback');
        % 105 109
        % 106 109
        % 107 109
        uimenu(editHndl, 'Label', 'Undo', 'Tag', 'MenuEditUndo', 'HandleVisibility', 'callback', 'Enable', 'off', 'Accelerator', 'z', 'Callback', '%uiundo');
        % 109 116
        % 110 116
        % 111 116
        % 112 116
        % 113 116
        % 114 116
        uimenu(editHndl, 'Label', 'Cut', 'Tag', 'MenuEditCut', 'HandleVisibility', 'callback', 'Enable', 'off', 'Accelerator', 'x', 'Callback', '%uicut');
        % 116 123
        % 117 123
        % 118 123
        % 119 123
        % 120 123
        % 121 123
        uimenu(editHndl, 'Label', 'Copy', 'Tag', 'MenuEditCopy', 'HandleVisibility', 'callback', 'Enable', 'off', 'Accelerator', 'c', 'Callback', '%uicopy');
        % 123 130
        % 124 130
        % 125 130
        % 126 130
        % 127 130
        % 128 130
        uimenu(editHndl, 'Label', 'Paste', 'Tag', 'MenuEditPaste', 'HandleVisibility', 'callback', 'Enable', 'off', 'Accelerator', 'v', 'Callback', '%uipaste');
        % 130 137
        % 131 137
        % 132 137
        % 133 137
        % 134 137
        % 135 137
        uimenu(editHndl, 'Label', 'Clear', 'Tag', 'MenuEditClear', 'HandleVisibility', 'callback', 'Enable', 'off', 'Callback', '%uiclear');
        % 137 143
        % 138 143
        % 139 143
        % 140 143
        % 141 143
        uimenu(editHndl, 'Label', 'Select All', 'Tag', 'MenuEditSelect All', 'HandleVisibility', 'callback', 'Enable', 'off', 'Callback', '%uiselectall');
        % 144 150
        % 145 150
        % 146 150
        % 147 150
        % 148 150
    case 'newmfile'
        % 150 152
    case 'newmodel'
        % 151 153
        new_system('untitled');
        open_system('untitled');
    case 'open'
        % 155 175
        % 156 175
        % 157 175
        % 158 175
        % 159 175
        % 160 175
        % 161 175
        % 162 175
        % 163 175
        % 164 175
        % 165 175
        % 166 175
        % 167 175
        % 168 175
        % 169 175
        % 170 175
        % 171 175
        % 172 175
        % 173 175
    end % switch
