function can_msg_id_check(id, msg_type)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if ischar(id)
        error('The CAN message identifier must be specified as a number, not a string')
    end
    % 19 21
    if gt(length(id), 1.0)
        error('The CAN message identifier cannot be a vector')
    end
    % 23 25
    switch msg_type
    case 1.0
        if ((ne(floor(id), id)) | (lt(id, 0.0))) | (ge(id, 2048.0))
            error(horzcat(num2str(id), ' is an invalid 11-bit CAN message identifer'))
        end
    case 2.0
        if ((ne(floor(id), id)) | (lt(id, 0.0))) | (ge(id, 536870912.0))
            error(horzcat(num2str(id), ' is an invalid 29-bit CAN message identifer'))
        end
    otherwise
        error(horzcat('Unrecognized message type ', num2str(msg_type)))
    end
end
