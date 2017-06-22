function schema
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    pkg = findpackage('rptgen_sf');
    pkgRG = findpackage('rptgen');
    % 17 19
    h = schema.class(pkg, 'appdata_sf', pkgRG.findclass('appdata'));
    % 19 23
    % 20 23
    % 21 23
    p = newSchema(h, 'CurrentMachine', 'handle');
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    p = newSchema(h, 'CurrentChart', 'handle');
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    p = newSchema(h, 'CurrentState', 'handle');
    % 35 39
    % 36 39
    % 37 39
    p = newSchema(h, 'CurrentObject', 'handle');
    % 39 42
    % 40 42
    p = newSchema(h, 'Context', 'string', '');
    % 42 45
    % 43 45
    p = newSchema(h, 'LegibleSize', 'double', 8.1);
    % 45 47
    p = newSchema(h, 'SFPortal', 'double', -1.0);
    p.getFunction = @gvSFPortal;
    % 48 50
    p = newSchema(h, 'LegiblePictureObjects', 'MATLAB array', []);
    % 50 60
    % 51 60
    % 52 60
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    typeTable = vertcat(cellhorzcat('Root', 'R', false, true, false), cellhorzcat('Machine', 'M', true, true, false), cellhorzcat('Chart', 'C', true, true, true), cellhorzcat('Data', 'D', true, false, false), cellhorzcat('State', 'S', true, true, true), cellhorzcat('Event', 'E', true, false, false), cellhorzcat('Transition', 'T', true, false, true), cellhorzcat('Junction', 'J', true, false, true), cellhorzcat('Target', 'Trgt', true, false, false), cellhorzcat('Box', 'B', true, true, true), cellhorzcat('Function', 'F', true, true, true), cellhorzcat('Editor', '-', false, true, false), cellhorzcat('Clipboard', '-', false, true, true), cellhorzcat('Annotation', 'N', true, false, true), cellhorzcat('TruthTable', 'TT', true, true, true), cellhorzcat('EMFunction', 'EM', true, true, true));
    % 60 84
    % 61 84
    % 62 84
    % 63 84
    % 64 84
    % 65 84
    % 66 84
    % 67 84
    % 68 84
    % 69 84
    % 70 84
    % 71 84
    % 72 84
    % 73 84
    % 74 84
    % 75 84
    % 76 84
    % 77 84
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    typeTable = struct('Name', typeTable(:, 1.0), 'Abbrev', typeTable(:, 2.0), 'isReportable', typeTable(:, 3.0), 'isParentable', typeTable(:, 4.0), 'isGraphical', typeTable(:, 5.0));
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    p = newSchema(h, 'TypeTable', 'MATLAB array', typeTable);
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    p.AccessFlags.Default = 'off';
    p.AccessFlags.Reset = 'off';
    p.AccessFlags.Serialize = 'off';
    p.AccessFlags.Copy = 'on';
end % function
function p = newSchema(h, name, dataType, factoryValue)
    % 98 101
    % 99 101
    p = schema.prop(h, name, dataType);
    p.AccessFlags.Init = 'on';
    p.AccessFlags.Reset = 'on';
    p.AccessFlags.AbortSet = 'off';
    % 104 106
    if gt(nargin, 3.0)
        p.FactoryValue = factoryValue;
    end % if
end % function
function val = gvSFPortal(this, val)
    % 110 113
    % 111 113
    if lt(val, 0.0) && this.ImplyValues
        val = [];
        rgAtt = 'SF_RG_Portal';
        % 115 118
        % 116 118
        allPortals = sf('get', 'all', 'portal.id');
        for i=1.0:length(allPortals)
            if isappdata(sf('get', allPortals(i), '.figH'), rgAtt)
                val = allPortals(i);
                break
            end % if
        end % for
        % 124 126
        if isempty(val)
            val = sf('new', 'portal');
            setappdata(sf('get', val, '.figH'), rgAtt, true);
        end % if
        this.SFPortal = val;
    end % if
end % function
