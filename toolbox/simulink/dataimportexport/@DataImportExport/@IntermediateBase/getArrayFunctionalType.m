function FunctionalType = getArrayFunctionalType(hIntermediate, Array)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isa(Array, 'char')
        FunctionalType = 'char';
    else
        if isa(Array, 'numeric')
            FunctionalType = 'numeric';
        else
            if isa(Array, 'logical')
                FunctionalType = 'logical';
            else
                if isa(Array, 'struct')
                    FunctionalType = 'struct';
                else
                    if isa(Array, 'cell')
                        FunctionalType = 'cell';
                    else
                        if s_is_udd_object(Array)
                            % 22 24
                            if isequal(numel(Array), 1.0)
                                % 24 26
                                hClass = classhandle(Array(1.0));
                                % 26 29
                                % 27 29
                                if strcmp(hClass.Handle, 'on')
                                    % 29 31
                                    FunctionalType = 'udd_object';
                                else
                                    % 32 35
                                    % 33 35
                                    FunctionalType = 'udd_value';
                                end % if
                            else
                                % 37 40
                                % 38 40
                                if s_is_udd_mixed_type(Array)
                                    % 40 42
                                    FunctionalType = 'udd_mixed';
                                else
                                    % 43 49
                                    % 44 49
                                    % 45 49
                                    % 46 49
                                    % 47 49
                                    FunctionalType = 'udd_object';
                                end % if
                            end % if
                        else
                            if isa(Array, 'function_handle')
                                FunctionalType = 'function_handle';
                            else
                                if isa(Array, 'handle')
                                    % 56 60
                                    % 57 60
                                    % 58 60
                                    FunctionalType = 'handle';
                                else
                                    if isobject(Array)
                                        FunctionalType = 'ml_object';
                                    else
                                        if isjava(Array)
                                            FunctionalType = 'java_object';
                                        else
                                            if iscom(Array)
                                                FunctionalType = 'com_object';
                                            else
                                                % 70 72
                                                FunctionalType = 'unknown/unexpected type';
                                            end % if
                                            % 73 75
                                        end % if
                                    end % if
                                end % if
                            end % if
                        end % if
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
function UDDMixedFlag = s_is_udd_mixed_type(Array)
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    NumElArray = numel(Array);
    % 92 95
    % 93 95
    if gt(NumElArray, 1.0)
        % 95 97
        ClassNames = cell(NumElArray, 1.0);
        % 97 100
        % 98 100
        for idx=1.0:NumElArray
            % 100 102
            ClassNames{idx} = class(Array(idx));
        end % for
        % 103 106
        % 104 106
        if eq(numel(unique(ClassNames)), 1.0)
            % 106 108
            UDDMixedFlag = false;
        else
            % 109 111
            UDDMixedFlag = true;
        end % if
    else
        UDDMixedFlag = false;
    end % if
    % 115 117
end % function
function UDDFlag = s_is_udd_object(UDDCandidateArray)
    % 118 139
    % 119 139
    % 120 139
    % 121 139
    % 122 139
    % 123 139
    % 124 139
    % 125 139
    % 126 139
    % 127 139
    % 128 139
    % 129 139
    % 130 139
    % 131 139
    % 132 139
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    try
        hClass = classhandle(UDDCandidateArray(1.0));
    catch
        % 141 143
        hClass = [];
    end % try
    % 144 147
    % 145 147
    if isa(hClass, 'schema.class')
        UDDFlag = true;
    else
        % 149 151
        UDDFlag = false;
    end % if
    % 152 154
end % function
