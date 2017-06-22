function output = borrow(array1, array2, keyfield, borrowfield)
    % 1 46
    % 2 46
    % 3 46
    % 4 46
    % 5 46
    % 6 46
    % 7 46
    % 8 46
    % 9 46
    % 10 46
    % 11 46
    % 12 46
    % 13 46
    % 14 46
    % 15 46
    % 16 46
    % 17 46
    % 18 46
    % 19 46
    % 20 46
    % 21 46
    % 22 46
    % 23 46
    % 24 46
    % 25 46
    % 26 46
    % 27 46
    % 28 46
    % 29 46
    % 30 46
    % 31 46
    % 32 46
    % 33 46
    % 34 46
    % 35 46
    % 36 46
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    if isempty(array1)
        DAStudio.error('RTW:utility:borrowEmptyPrimaryArray');
    end
    % 48 50
    if ~(isfield(array1, keyfield))
        DAStudio.error('RTW:utility:borrowEmptyKeyField', 'primary');
    end
    % 52 54
    if ~(isfield(array1, borrowfield))
        output = array1;
        return
    end
    % 57 59
    if (isempty(array2)) | (~(isfield(array2, keyfield)))
        DAStudio.error('RTW:utility:borrowEmptyKeyField', 'secondary');
    end
    % 61 64
    % 62 64
    array1_fields = fieldnames(array1);
    k = 1.0;
    for j=1.0:length(array1_fields)
        if isfield(array2, array1_fields{j})
            commonfields{k} = array1_fields{j};
            k = plus(k, 1.0);
        end
    end % for
    % 71 73
    output = array1;
    % 73 75
    for k=1.0:length(array1)
        array1_val = getfield(array1(k), keyfield);
        for j=1.0:length(array2)
            array2_val = getfield(array2(j), keyfield);
            if ~(isempty(array1_val))
                if isequal(array1_val, array2_val)
                    % 80 82
                    if isempty(getfield(array1(k), borrowfield))
                        for l=1.0:length(commonfields)
                            if isempty(getfield(array1(k), commonfields{l}))
                                output(k) = setfield(output(k), commonfields{l}, getfield(array2(j), commonfields{l}));
                                % 85 87
                            end
                        end % for
                    end
                    array2(j) = [];
                    break
                end
            end
        end % for
    end % for
end
