function [list, valueStr, valueInt] = pm_resolvedialogunit(default, given)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    default = l_pre_pmu_sanitize(default);
    given = l_pre_pmu_sanitize(given);
    % 14 17
    % 15 17
    if not(l_validate_unit(default))
        error(xlate(horzcat('Unrecognized default unit ''', default, '''.')));
    else
        default = pm_canonicalunit(default);
    end
    % 21 24
    % 22 24
    if not(l_validate_unit(given))
        % 24 26
        disp(xlate(horzcat('Warning: Unrecognized unit ''', given, '''. Defaulting to ''', default, '''.')));
        unit = default;
    else
        % 28 30
        if not(pm_commensurate(given, default))
            % 30 32
            disp(xlate(horzcat('Warning: Unit ''', given, ''' is not commensurate with default unit ''', default, '''. Defaulting to ''', default, '''.')));
            % 32 34
            unit = default;
        else
            unit = pm_canonicalunit(given);
        end
    end
    % 38 41
    % 39 41
    list = pm_suggestunits(unit);
    valueStr = unit;
    % 42 45
    % 43 45
    list = l_post_pmu_sanitize(valueStr, list);
    list = cellhorzcat(list{:});
    % 46 49
    % 47 49
    idxs = find(strcmp(valueStr, list));
    valueInt = idxs(1.0);
    % 50 52
end
function isValid = l_validate_unit(unit)
    % 53 60
    % 54 60
    % 55 60
    % 56 60
    % 57 60
    % 58 60
    isValid = true;
    try
        pm_canonicalunit(unit);
    catch
        isValid = false;
    end % try
    % 65 67
end
function retUnit = l_pre_pmu_sanitize(unit)
    % 68 83
    % 69 83
    % 70 83
    % 71 83
    % 72 83
    % 73 83
    % 74 83
    % 75 83
    % 76 83
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    unit = strrep(unit, '-', '*');
    unit = strrep(unit, char(178.0), '^2');
    % 84 86
    retUnit = unit;
end
function retList = l_post_pmu_sanitize(unit, list)
    % 88 96
    % 89 96
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    energyUnits = l_canonicize({'J','Btu'});
    torqueUnits = l_canonicize({'N*m','lbf*ft','lb*ft'});
    % 97 99
    retList = list;
    excludeLst = {};
    if any(strcmpi(unit, energyUnits))
        excludeLst = torqueUnits;
    else
        if any(strcmpi(unit, torqueUnits))
            excludeLst = energyUnits;
        end
    end
    for idx=1.0:numel(excludeLst)
        matchIdxs = find(strcmpi(excludeLst{idx}, retList));
        if not(isempty(matchIdxs))
            retList(matchIdxs) = [];
        end
    end % for
    % 113 115
end
function retList = l_canonicize(list)
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    retList = {};
    for i=1.0:length(list)
        retList = horzcat(retList, pm_canonicalunit(list{i}));
    end % for
    % 125 127
end
