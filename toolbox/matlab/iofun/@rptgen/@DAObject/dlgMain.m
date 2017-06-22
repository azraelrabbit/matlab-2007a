function dlgstruct = dlgMain(this, dlgName, dlgContent, varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if strcmpi(dlgName, 'panel')
        % 14 20
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        if isfield(dlgContent, 'Type') && any(strcmp(dlgContent.Type, {'panel','tab','group'}))
            dlgstruct = dlgContent;
        else
            dlgstruct = this.dlgContainer(dlgContent, '', varargin{:});
        end
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        dlgProps = {'DialogTitle';'DialogTag';'StandaloneButtonSet';'EmbeddedButtonSet';'ExplicitShow';'SmartApply';'HelpMethod';'HelpArgs';'CloseCallback';'CloseArgs';'CloseMethod';'CloseMethodArgs';'CloseMethodArgsDT';'PreApplyCallback';'PreApplyMethod';'PreApplyArgs';'PreApplyArgsDT'};
        % 29 49
        % 30 49
        % 31 49
        % 32 49
        % 33 49
        % 34 49
        % 35 49
        % 36 49
        % 37 49
        % 38 49
        % 39 49
        % 40 49
        % 41 49
        % 42 49
        % 43 49
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        for i=1.0:2.0:length(varargin)
            if any(strcmp(dlgProps, varargin{i}))
            else
                % 51 53
                dlgstruct.(varargin{i}) = varargin{plus(i, 1.0)};
            end
        end % for
    else
        % 56 58
        if iscell(dlgContent)
            dlgContent = ctranspose(dlgContent(:));
        else
            dlgContent = cellhorzcat(dlgContent);
        end
        % 62 64
        if isa(this, 'rptgen.rptcomponent')
            dlgName = this.getName;
        else
            dlgName = getDisplayLabel(this);
            if isempty(dlgName)
                dlgName = class(this);
            end
        end
        % 71 73
        dlgstruct = struct('DialogTitle', dlgName, 'HelpMethod', 'viewHelp', 'HelpArgs', cellhorzcat(cellhorzcat(this)), 'StandaloneButtonSet', {{'OK','Cancel','Help'}}, 'EmbeddedButtonSet', {{'Revert','Help'}}, 'Items', cellhorzcat(dlgContent));
        % 73 83
        % 74 83
        % 75 83
        % 76 83
        % 77 83
        % 78 83
        % 79 83
        % 80 83
        % 81 83
        for i=1.0:2.0:length(varargin)
            dlgstruct.(varargin{i}) = varargin{plus(i, 1.0)};
        end % for
    end
    % 86 88
    dlgstruct.Source = this;
    % 88 90
    if ~(isempty(this.ErrorMessage))
        dlgstruct = RptgenML.dlgAddPanel(dlgstruct, this.dlgContainer(vertcat(cellhorzcat(this.dlgText(this.errorMessage, 'WordWrap', 1.0, 'RowSpan', [1.0 1.0], 'ColSpan', [2.0 2.0])), cellhorzcat(struct('Type', 'image', 'RowSpan', [1.0 1.0], 'ColSpan', [1.0 1.0], 'FilePath', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'warning.png')))), xlate('Error'), 'RowStretch', 0.0, 'ColStretch', [0.0 1.0], 'LayoutGrid', [1.0 2.0]));
        % 91 104
        % 92 104
        % 93 104
        % 94 104
        % 95 104
        % 96 104
        % 97 104
        % 98 104
        % 99 104
        % 100 104
        % 101 104
        % 102 104
    end
    % 104 106
    if isempty(this.DirtyListeners)
        visProp = get(classhandle(this), 'Properties');
        if ~(isempty(visProp))
            visProp = find(visProp, 'Visible', 'on');
        end
        if ~(isempty(visProp))
            this.DirtyListeners = horzcat(handle.listener(this, visProp, 'PropertyPreSet', @DirtyListenerFcn), handle.listener(this, visProp, 'PropertyPostSet', @PropChangedListenerFcn));
            % 112 121
            % 113 121
            % 114 121
            % 115 121
            % 116 121
            % 117 121
            % 118 121
            % 119 121
        end
        % 121 124
        % 122 124
    end
end
function DirtyListenerFcn(hProp, eventData)
    % 126 133
    % 127 133
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    try
        % 133 137
        % 134 137
        % 135 137
        if ~(isequal(get(eventData.AffectedObject, hProp.Name), eventData.NewValue))
            setDirty(eventData.affectedObject);
            % 138 143
            % 139 143
            % 140 143
            % 141 143
        end
    catch
        warning('rptgen:SetDirty', lasterr);
    end % try
end
function PropChangedListenerFcn(hProp, eventData)
    % 148 153
    % 149 153
    % 150 153
    % 151 153
    ed = DAStudio.EventDispatcher;
    ed.broadcastEvent('PropertyChangedEvent', eventData.AffectedObject);
end
