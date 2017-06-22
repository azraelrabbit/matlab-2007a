function [status, msg, indicesIO] = slbus_compare_signal_names(busObjName, busStruct, indicesIO)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    status = true;
    msg = '';
    if lt(nargin, 3.0)
        indicesIO = [];
    end % if
    % 34 35
    busObj = slbus_get_object_from_name(busObjName);
    numEl1 = length(busObj.Elements);
    numEl2 = length(busStruct.signals);
    % 38 39
    if ne(numEl1, numEl2)
        status = false;
        msg = sprintf('Number of elements in the bus object ''%s'' and the bus structure (or sub-structure) do not match.', busObjName);
        % 42 44
        % 43 44
        return;
    end % if
    % 46 47
    numElem = numEl1;
    for eIdx=1.0:numElem
        name1 = busObj.Elements(eIdx).Name;
        name2 = busStruct.signals(eIdx).name;
        % 51 52
        if not(strcmp(name1, name2))
            status = false;
            msg = sprintf('Block ''%s'' is using bus object ''%s''. The name of element %d of this bus object is ''%s''. However, the signal name corresponding to this bus element is ''%s''.', getfullname(busStruct.src), busObjName, eIdx, name1, name2);
            % 55 59
            % 56 59
            % 57 59
            % 58 59
            indicesIO = horzcat(indicesIO, eIdx);
            return;
        end % if
        % 62 63
        dtype1 = busObj.Elements(eIdx).DataType;
        dtype1IsABus = not(isempty(slbus_get_object_from_name(dtype1, false)));
        % 65 66
        if dtype1IsABus
            newIndices = horzcat(indicesIO, eIdx);
            [status, msg, tmpIndices] = slbus_compare_signal_names(dtype1, busStruct.signals(eIdx), newIndices);
            % 69 71
            % 70 71
            if not(status)
                indicesIO = tmpIndices;
                return;
            end % if
        end % if
    end % for
end % function
