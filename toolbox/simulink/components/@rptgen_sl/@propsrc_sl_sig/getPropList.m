function list = getPropList(h, filterName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch filterName
    case 'all'
        list = vertcat(LocAllProps(h), getPropList(h, 'object'));
        % 11 13
    case 'main'
        % 12 14
        list = {'Name';'GraphicalName';'Tag';'Description';'ParentBlock';'ParentSystem';'Depth';'DefinedInBlk';'UsedByBlk'};
        % 15 25
        % 16 25
        % 17 25
        % 18 25
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
    case 'display'
        % 24 26
        list = {'Position';'Rotation';'FontName';'FontSize';'FontWeight';'FontAngle'};
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
    case 'object'
        % 33 35
        try
            aProps = get(findclass(findpackage('ASAP2'), 'Parameter'), 'Properties');
        catch
            warning('rptgenext:ASAP2Unavailable', lasterr);
            aProps = get(findclass(findpackage('Simulink'), 'Parameter'), 'Properties');
        end % try
        visIdx = strcmp(get(aProps, 'Visible'), 'on');
        aProps = aProps(visIdx);
        list = get(aProps, 'Name');
    case 'other'
        list = {'DocumentLink';'RTWStorageClass';'RTWStorageTypeQualifier'};
        % 45 48
        % 46 48
    end
end
function propNames = LocAllProps(h)
    % 50 54
    % 51 54
    % 52 54
    persistent PROPSRC_ALL_SIGNAL_PROPERTIES;
    % 54 56
    if isempty(PROPSRC_ALL_SIGNAL_PROPERTIES)
        PROPSRC_ALL_SIGNAL_PROPERTIES = sort(vertcat(horzcat(h.getAllGettableProperties), {'Depth';'GraphicalName';'ParentBlock';'ParentSystem';'DefinedInSys';'UsedBySys'}));
        % 57 65
        % 58 65
        % 59 65
        % 60 65
        % 61 65
        % 62 65
        % 63 65
    end
    % 65 67
    propNames = PROPSRC_ALL_SIGNAL_PROPERTIES;
end
