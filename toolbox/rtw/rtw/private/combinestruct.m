function output = combinestruct(array1, array2, keyfield)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    if isempty(array1)
        output = array2;
        return
    end
    % 31 33
    if (isempty(array2)) | (~(isfield(array2, keyfield)))
        output = array1;
        return
    end
    % 36 38
    if ~(isfield(array1, keyfield))
        error('Key field not found in primary array.');
    end
    % 40 42
    output = array1;
    for j=1.0:length(array2)
        currentRecord = array2(j);
        duplicate = 0.0;
        array2_val = currentRecord.(keyfield);
        if ~(isempty(array2_val))
            if ~(isfield(currentRecord, 'type')) || ~((strcmp(lower(currentRecord.type), 'category')) | (strcmp(lower(currentRecord.type), 'pushbutton')))
                % 48 51
                % 49 51
                for k=1.0:length(array1)
                    array1_val = array1(k).(keyfield);
                    if isequal(array1_val, array2_val)
                        % 53 55
                        recordFields = fieldnames(currentRecord);
                        for i=1.0:length(recordFields)
                            field = char(recordFields(i));
                            if ~(isempty(currentRecord.(field)))
                                output(k).(field) = currentRecord.(field);
                            end
                        end % for
                        duplicate = 1.0;
                        break
                    end
                end % for
            else
                for k=1.0:length(array1)
                    array1_val = array1(k).(keyfield);
                    if isequal(array1_val, array2_val)
                        warnmsg = horzcat('Option ', array2_val, ' has been specified more than once.');
                        % 70 72
                        duplicate = 1.0;
                        break
                    end
                end % for
            end
        end
        if ~(duplicate)
            output = AddRecordToArray(output, currentRecord);
        end
    end % for
end
function output = AddRecordToArray(array, record)
    % 83 99
    % 84 99
    % 85 99
    % 86 99
    % 87 99
    % 88 99
    % 89 99
    % 90 99
    % 91 99
    % 92 99
    % 93 99
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    if isequal(fieldnames(array), fieldnames(record))
        output = horzcat(array, record);
        return
    else
        output = array;
        k = length(output);
        recordFields = fieldnames(record);
        for j=1.0:length(recordFields)
            field = char(recordFields(j));
            output(plus(k, 1.0)).(field) = record.(field);
        end % for
    end
end
