function [status, msg] = slbus_compare(busName1, busName2, compareName)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    status = true;
    msg = '';
    % 23 26
    % 24 26
    isOk = eq(nargin, 3.0);
    if not(isOk)
        msgId = horzcat(msgIdPref_l, 'InvalidNumInputs');
        msg = 'slbus_compare: Invalid number of inputs';
        error(msgId, msg);
    end
    % 31 34
    % 32 34
    isOk = ischar(busName1) && ischar(busName2);
    if not(isOk)
        msgId = horzcat(msgIdPref_l, 'InvalidInput');
        msg = 'slbus_compare: Invalid input arguments. The first and second input arguments must be strings.';
        % 37 39
        error(msgId, msg);
    end
    % 40 43
    % 41 43
    isOk = islogical(compareName);
    if not(isOk)
        msgId = horzcat(msgIdPref_l, 'InvalidInput');
        msg = 'slbus_compare: The third input must be true or false.';
        error(msgId, msg);
    end
    % 48 51
    % 49 51
    bus1 = slbus_get_object_from_name(busName1);
    bus2 = slbus_get_object_from_name(busName2);
    % 52 54
    numEl1 = length(bus1.Elements);
    numEl2 = length(bus2.Elements);
    % 55 57
    if ne(numEl1, numEl2)
        status = false;
        msg = sprintf('Bus objects ''%s'' and ''%s'' have different number of elements.', busName1, busName2);
        % 59 62
        % 60 62
        return
    end
    % 63 65
    numElem = numEl1;
    for eIdx=1.0:numElem
        % 66 68
        elem1 = bus1.Elements(eIdx);
        elem2 = bus2.Elements(eIdx);
        % 69 71
        if compareName && not(strcmp(elem1.Name, elem2.Name))
            status = false;
            msg = sprintf('Element %d of bus objects ''%s'' and ''%s'' have different Name values.', eIdx, busName1, busName2);
            % 73 76
            % 74 76
            return
        end
        % 77 80
        % 78 80
        if not(isequal(elem1.Dimensions, elem2.Dimensions))
            % 80 82
            status = false;
            msg = sprintf('Element %d of bus objects ''%s'' and ''%s'' have different Dimensions values.', eIdx, busName1, busName2);
            % 83 86
            % 84 86
            return
        end
        % 87 90
        % 88 90
        dtype1 = elem1.DataType;
        dtype2 = elem2.DataType;
        % 91 93
        if not(strcmp(dtype1, dtype2))
            % 93 95
            dtype1IsABus = not(isempty(slbus_get_object_from_name(dtype1, false)));
            dtype2IsABus = not(isempty(slbus_get_object_from_name(dtype2, false)));
            % 96 98
            if dtype1IsABus && dtype2IsABus
                % 98 100
                [status, msg] = slbus_compare(dtype1, dtype2, compareName);
                if not(status)
                    return
                end
            else
                status = false;
                msg = sprintf('Element %d of bus objects ''%s'' and ''%s'' have different DataType values.', eIdx, busName1, busName2);
                % 106 109
                % 107 109
                return
            end
        end
        % 111 114
        % 112 114
        ts1 = elem1.SampleTime;
        ts2 = elem2.SampleTime;
        % 115 117
        if isscalar(ts1)
            ts1 = horzcat(ts1, 0.0);
        end
        % 119 121
        if isscalar(ts2)
            ts2 = horzcat(ts2, 0.0);
        end
        % 123 125
        if not(isequal(ts1, ts2))
            status = false;
            msg = sprintf('Element %d of bus objects ''%s'' and ''%s'' have different SampleTime values.', eIdx, busName1, busName2);
            % 127 130
            % 128 130
            return
        end
        % 131 134
        % 132 134
        if not(strcmp(elem1.Complexity, elem2.Complexity))
            % 134 136
            status = false;
            msg = sprintf('Element %d of bus objects ''%s'' and ''%s'' have different Complexity values.', eIdx, busName1, busName2);
            % 137 140
            % 138 140
            return
        end
        % 141 144
        % 142 144
        if not(strcmp(elem1.SamplingMode, elem2.SamplingMode))
            status = false;
            msg = sprintf('Element %d of bus objects ''%s'' and ''%s'' have different SamplingMode values.', eIdx, busName1, busName2);
            % 146 149
            % 147 149
            return
        end
    end % for
end
function msgIdPref = msgIdPref_l
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    msgIdPref = 'Simulink:slbus_compare:';
end
