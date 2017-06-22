function dlgStruct = dlgDialogSchema(this, name, oParent, oProperty, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 4.0)
        oProperty = '';
        if lt(nargin, 3.0)
            oParent = [];
        end % if
    end % if
    % 12 14
    allFilters = this.getFilterList;
    % 14 16
    if isempty(this.DlgFilter)
        if isempty(this.DlgProperty)
            this.DlgFilter = allFilters{1.0, 1.0};
            filteredProps = locGetPropList(this, oParent, this.DlgFilter);
            propIdx = 1.0;
            if not(isempty(filteredProps))
                this.DlgProperty = filteredProps{propIdx};
            else
                propIdx = [];
            end % if
        else
            % 26 28
            filterFound = false;
            for filterIdx=1.0:size(allFilters, 1.0)
                filteredProps = locGetPropList(this, oParent, allFilters{filterIdx, 1.0});
                propIdx = find(strcmpi(filteredProps, this.DlgProperty));
                if not(isempty(propIdx))
                    filterFound = true;
                    propIdx = propIdx(1.0);
                    break
                end % if
            end % for
            % 37 39
            this.DlgFilter = allFilters{filterIdx, 1.0};
            if not(filterFound)
                filteredProps{plus(end, 1.0)} = initProp;
                propIdx = length(filteredProps);
            end % if
        end % if
    else
        filteredProps = locGetPropList(this, oParent, this.DlgFilter);
        if isempty(this.DlgProperty)
            propIdx = 1.0;
            if not(isempty(filteredProps))
                this.DlgProperty = filteredProps{propIdx};
            else
                propIdx = [];
            end % if
        else
            propIdx = find(strcmpi(filteredProps, this.DlgProperty));
            if not(isempty(propIdx))
                propIdx = propIdx(1.0);
            else
                filteredProps{plus(end, 1.0)} = this.DlgProperty;
                propIdx = length(filteredProps);
            end % if
        end % if
    end % if
    % 63 67
    % 64 67
    % 65 67
    theProp = struct(findprop(this, 'DlgFilter'));
    theProp.DataType = allFilters;
    % 68 70
    wFilter = this.dlgWidget(theProp, 'Type', 'combobox', 'ToolTip', xlate('Available property types'), 'DialogRefresh', true);
    % 70 89
    % 71 89
    % 72 89
    % 73 89
    % 74 89
    % 75 89
    % 76 89
    % 77 89
    % 78 89
    % 79 89
    % 80 89
    % 81 89
    % 82 89
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    wList = struct('Type', 'listbox', 'Tag', 'PropsrcPropertyList', 'ToolTip', xlate('Properties'), 'MultiSelect', false, 'ObjectMethod', 'dlgSelectAction', 'MethodArgs', cellhorzcat(cellhorzcat('%dialog', oParent, oProperty)), 'ArgDataTypes', {{'handle','handle','string'}}, 'UserData', cellhorzcat(ctranspose(filteredProps(:))), 'Entries', cellhorzcat(ctranspose(filteredProps(:))));
    % 89 99
    % 90 99
    % 91 99
    % 92 99
    % 93 99
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    if false
        % 99 101
        wAddBtn = struct('Type', 'pushbutton', 'FilePath', fullfile(matlabroot, 'toolbox', 'rptgen', 'resources', 'move_left.png'), 'ToolTip', xlate('Add property'), 'ObjectMethod', 'dlgAddAction', 'ColSpan', [1.0 1.0], 'RowSpan', [4.0 4.0], 'MethodArgs', cellhorzcat(cellhorzcat('%dialog', oParent, oProperty)), 'ArgDataTypes', {{'handle','handle','string'}});
        % 101 110
        % 102 110
        % 103 110
        % 104 110
        % 105 110
        % 106 110
        % 107 110
        % 108 110
        wFilter.ColSpan = [2.0 6.0];
        wFilter.RowSpan = [1.0 1.0];
        wList.ColSpan = [2.0 6.0];
        wList.RowSpan = [2.0 6.0];
        % 113 115
        dlgStruct = this.dlgMain(name, ctranspose(vertcat(cellhorzcat(wFilter), cellhorzcat(wList), cellhorzcat(wAddBtn))), varargin{:}, 'LayoutGrid', [6.0 6.0]);
    else
        % 116 121
        % 117 121
        % 118 121
        % 119 121
        % 120 122
        dlgStruct = this.dlgMain(name, vertcat(cellhorzcat(wFilter), cellhorzcat(wList)), varargin{:});
        % 122 126
        % 123 126
        % 124 126
    end % if
end % function
function filteredProps = locGetPropList(this, oParent, dlgFilter)
    % 128 131
    % 129 131
    if isa(oParent, 'rptgen.summsrc')
        filteredProps = oParent.getPropList(dlgFilter);
    else
        filteredProps = this.getPropList(dlgFilter);
    end % if
end % function
