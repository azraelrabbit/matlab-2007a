function setArrayQueue(hObject, Array, ArrayName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    NUMBER_QUEUE_ELEMENTS = 50.0;
    % 11 13
    % 12 13
    USER_PARENT = -1.0;
    % 14 16
    % 15 16
    hObject.ArrayQueueTop = 1.0;
    hObject.ArrayQueueBottom = LengthArrays;
    ArrayQueue = cell(NUMBER_QUEUE_ELEMENTS, 3.0);
    % 19 21
    % 20 21
    ArrayQueue(1.0, :) = cellhorzcat(Array, ArrayName, USER_PARENT);
    hObject.ArrayQueue = ArrayQueue;
    % 23 24
end % function
