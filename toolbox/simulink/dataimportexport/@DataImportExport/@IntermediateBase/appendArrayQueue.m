function appendArrayQueue(hIntermediate, Array, ArrayName, ArrayParent)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    s_checkArrayQueueSize(hIntermediate);
    % 9 11
    % 10 11
    hIntermediate.ArrayQueueLastIndex = plus(hIntermediate.ArrayQueueLastIndex, 1.0);
    % 12 14
    % 13 14
    hIntermediate.ArrayQueue(hIntermediate.ArrayQueueLastIndex, :) = cellhorzcat(Array, ArrayName, ArrayParent);
    % 15 17
    % 16 17
end % function
function s_checkArrayQueueSize(hIntermediate)
    % 19 35
    % 20 35
    % 21 35
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    ArrayQueueLastIndex = hIntermediate.ArrayQueueLastIndex;
    ArrayQueue = hIntermediate.ArrayQueue;
    % 37 39
    % 38 39
    LengthArrayQueue = size(ArrayQueue, 1.0);
    % 40 42
    % 41 42
    if isequal(ArrayQueueLastIndex, LengthArrayQueue)
        % 43 46
        % 44 46
        % 45 46
        NUMBER_QUEUE_AUGMENT_ELEMENTS = 25.0;
        BlankQueueItems = cell(NUMBER_QUEUE_AUGMENT_ELEMENTS, 3.0);
        % 48 50
        % 49 50
        if not(isempty(ArrayQueue))
            % 51 52
            ArrayQueueFirstIndex = hIntermediate.ArrayQueueFirstIndex;
            % 53 56
            % 54 56
            % 55 56
            hIntermediate.ArrayQueue = vertcat(ArrayQueue(ArrayQueueFirstIndex:LengthArrayQueue, :), BlankQueueItems);
            % 57 61
            % 58 61
            % 59 61
            % 60 61
            hIntermediate.ArrayQueueLastIndex = plus(minus(LengthArrayQueue, ArrayQueueFirstIndex), 1.0);
        else
            % 63 64
            % 64 66
            % 65 66
            hIntermediate.ArrayQueue = BlankQueueItems;
        end % if
        % 68 71
        % 69 71
        % 70 71
        hIntermediate.ArrayQueueFirstIndex = 1.0;
    end % if
    % 73 74
end % function
