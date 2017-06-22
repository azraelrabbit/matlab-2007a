function vector_can_msg_ids_check(ids, msg_type)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if ischar(ids)
        error('The CAN message identifiers must be specified as numbers, not as strings')
    end
    % 18 21
    % 19 21
    switch msg_type
    case 1.0
        if ((any(ne(floor(ids), ids))) | (any(lt(ids, 0.0)))) | (any(ge(ids, 2048.0)))
            str = num2str(ids);
            % 24 26
            indices = findstr(str, '  ');
            str(indices) = [];
            error(horzcat('[', str, '] is an invalid vector of 11-bit CAN message identifiers'))
        end
    case 2.0
        if ((any(ne(floor(ids), ids))) | (any(lt(ids, 0.0)))) | (any(ge(ids, 536870912.0)))
            str = num2str(ids);
            % 32 34
            indices = findstr(str, '  ');
            str(indices) = [];
            error(horzcat('[', str, '] is an invalid vector of 29-bit CAN message identifiers'))
        end
    otherwise
        error(horzcat('Unrecognized message type ', num2str(msg_type)))
    end
end
