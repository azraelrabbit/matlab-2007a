function propList = getPropList(h, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if strcmpi(filterName, 'name')
        propList = {'Name';'FullPath+Name';'SFPath+Name'};
    else
        % 9 13
        % 10 13
        % 11 13
        if gt(length(filterName), 6.0) && strcmpi(filterName(minus(end, 5.0):end), ' (all)')
            % 13 15
            pkg = findpackage('Stateflow');
            cls = pkg.findclass(filterName(1.0:minus(end, 6.0)));
            propList = sort(get(cls.Properties, 'Name'));
        else
            % 18 21
            % 19 21
            switch lower(filterName)
            case 'machine'
                propList = {'Description';'Document';'Created';'Creator';'Modified';'Version';'Charts';'Data';'Events'};
                % 24 34
                % 25 34
                % 26 34
                % 27 34
                % 28 34
                % 29 34
                % 30 34
                % 31 34
                % 32 34
            case 'chart'
                % 33 35
                propList = {'Description';'Document';'States';'Junctions';'Transitions';'Data';'Events'};
                % 36 44
                % 37 44
                % 38 44
                % 39 44
                % 40 44
                % 41 44
                % 42 44
            case {'state','and state','or state'}
                % 43 45
                propList = {'Description';'Document';'Label';'Data';'Events'};
                % 46 53
                % 47 53
                % 48 53
                % 49 53
                % 50 53
                % 51 53
            case {'box','function'}
                % 52 54
                propList = {'LabelString';'IsGrouped';'IsSubchart';'Document';'Description';'Data';'Events'};
                % 55 63
                % 56 63
                % 57 63
                % 58 63
                % 59 63
                % 60 63
                % 61 63
            case 'transition'
                % 62 64
                propList = {'Source';'Destination';'Description';'ExecutionOrder';'Document';'Label'};
                % 65 72
                % 66 72
                % 67 72
                % 68 72
                % 69 72
                % 70 72
            case 'junction'
                % 71 73
                propList = {'Description';'Document';'sourcedTransitions'};
                % 74 78
                % 75 78
                % 76 78
            case 'data'
                % 77 79
                propList = {'Description';'Document';'Scope';'DataType';'Range';'InitValue'};
                % 80 87
                % 81 87
                % 82 87
                % 83 87
                % 84 87
                % 85 87
            case 'event'
                % 86 88
                propList = {'Description';'Document';'Scope';'Trigger'};
                % 89 94
                % 90 94
                % 91 94
                % 92 94
            case 'target'
                % 93 95
                propList = {'Description';'Document';'CustomCode';'UserSources';'UserIncludeDirs';'UserLibraries'};
                % 96 103
                % 97 103
                % 98 103
                % 99 103
                % 100 103
                % 101 103
            case {'note','annotation'}
                % 102 104
                propList = {'Text';'Description';'Document'};
                % 105 109
                % 106 109
                % 107 109
            case 'truthtable'
                % 108 110
                propList = {'LabelString';'Document';'Description';'BadIntersection';'UnderSpecDiagnostic';'OverspecDiagnostic'};
                % 111 120
                % 112 120
                % 113 120
                % 114 120
                % 115 120
                % 116 120
                % 117 120
                % 118 120
            case 'emfunction'
                % 119 121
                propList = {'LabelString';'Document';'Script';'Data'};
            otherwise
                % 122 132
                % 123 132
                % 124 132
                % 125 132
                % 126 132
                % 127 132
                % 128 132
                % 129 132
                % 130 132
                % 131 133
                propList = {'Parent';'Description';'Document'};
                % 133 138
                % 134 138
                % 135 138
                % 136 138
            end % switch
        end % if
    end % if
