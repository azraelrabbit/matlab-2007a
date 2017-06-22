function panel = getDialogContainer(hObj, dlgName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    panel = [];
    panel.Type = 'panel';
    panel.Items = {};
    % 12 16
    % 13 16
    % 14 16
    tmpClass = classhandle(hObj);
    tmpProps = tmpClass.Properties;
    % 17 21
    % 18 21
    % 19 21
    colGrid = 2.0;
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    rowIdx = 0.0;
    colIdx = 0.0;
    for i=1.0:length(tmpProps)
        % 28 35
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        tmpPropName = tmpProps(i).Name;
        tmpPropType = tmpProps(i).DataType;
        % 36 38
        tmpItem = [];
        tmpItem.Name = tmpPropName;
        % 39 41
        switch tmpPropType
        case 'bool'
            tmpItem.Type = 'checkbox';
        case {'string','double','int32'}
            % 44 46
            tmpItem.Type = 'edit';
        case 'on/off'
            % 47 49
            tmpItem.Type = 'combobox';
            tmpItem.Entries = {'on','off'};
        otherwise
            % 51 53
            tmpT = findtype(tmpPropType);
            if isa(tmpT, 'schema.EnumType')
                tmpItem.Type = 'combobox';
                tmpItem.Entries = ctranspose(tmpT.Strings);
            else
                fprintf('Warning: in %s, skipping property "%s" of type "%s"', dlgName, tmpPropName, tmpPropType);
                % 58 60
                continue;
            end % if
        end % switch
        % 62 64
        tmpItem.Source = hObj;
        tmpItem.ObjectProperty = tmpPropName;
        tmpItem.Mode = 1.0;
        tmpItem.DialogRefresh = 1.0;
        % 67 69
        tmpItem.RowSpan = horzcat(plus(rowIdx, 1.0), plus(rowIdx, 1.0));
        tmpItem.ColSpan = horzcat(plus(colIdx, 1.0), plus(colIdx, 1.0));
        % 70 72
        panel.Items = horzcat(panel.Items, cellhorzcat(tmpItem));
        % 72 74
        colIdx = mod(plus(colIdx, 1.0), colGrid);
        if eq(colIdx, 0.0)
            rowIdx = plus(rowIdx, 1.0);
        end % if
    end % for
    % 78 80
    panel.LayoutGrid = horzcat(plus(rowIdx, 1.0), colGrid);
