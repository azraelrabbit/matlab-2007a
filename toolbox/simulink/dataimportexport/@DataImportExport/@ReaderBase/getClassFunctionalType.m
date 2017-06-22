function FunctionalType = getClassFunctionalType(hReader, Class)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch Class
    case 'char'
        % 10 11
        FunctionalType = 'char';
    case 'double'
        % 13 15
        % 14 15
        FunctionalType = 'numeric';
    case 'logical'
        % 17 19
        % 18 19
        FunctionalType = 'logical';
    case 'cell'
        % 21 23
        % 22 23
        FunctionalType = 'cell';
    case 'struct'
        % 25 27
        % 26 27
        FunctionalType = 'struct';
    case 'single'
        % 29 31
        % 30 31
        FunctionalType = 'numeric';
    case {'int8','uint8','int16','uint16'}
        % 33 35
        % 34 35
        FunctionalType = 'numeric';
    case {'int32','uint32','int64','uint64'}
        % 37 39
        % 38 39
        FunctionalType = 'numeric';
    otherwise
        % 41 43
        % 42 43
        FunctionalType = s_get_udd_type(Class);
    end % switch
    % 45 46
end % function
function FunctionalType = s_get_udd_type(Class)
    % 48 62
    % 49 62
    % 50 62
    % 51 62
    % 52 62
    % 53 62
    % 54 62
    % 55 62
    % 56 62
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    % 61 62
    FunctionalType = [];
    % 63 73
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    % 72 73
    try
        % 74 75
        feval(Class);
        % 76 77
    end % try
    % 78 84
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    % 83 84
    PointIndex = strfind(Class, '.');
    % 85 87
    % 86 87
    if not(isempty(PointIndex))
        % 88 89
        PackageName = Class(1.0:minus(PointIndex(1.0), 1.0));
        ClassName = Class(plus(PointIndex(1.0), 1.0):end);
        % 91 93
        % 92 93
        Package = findpackage(PackageName);
        % 94 96
        % 95 96
        if not(isempty(Package))
            % 97 98
            Classes = Package.Classes;
            % 99 101
            % 100 101
            if not(isempty(Classes))
                % 102 103
                ClassList = get(Package.Classes, 'Name');
            else
                % 105 106
                ClassList = [];
            end % if
            % 108 110
            % 109 110
            ClassIndex = find(strcmp(ClassName, ClassList), 1.0);
            % 111 113
            % 112 113
            if not(isempty(ClassIndex))
                % 114 115
                ClassHandle = Package.Classes(ClassIndex).Handle;
                % 116 118
                % 117 118
                if strcmp(ClassHandle, 'on')
                    % 119 120
                    FunctionalType = 'udd_object';
                else
                    % 122 124
                    % 123 124
                    FunctionalType = 'udd_value';
                end % if
            end % if
        end % if
    end % if
    % 129 130
end % function
