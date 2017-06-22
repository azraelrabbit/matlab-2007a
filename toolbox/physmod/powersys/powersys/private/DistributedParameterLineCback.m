function DistributedParameterLineCback(block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    WantPhases = max(1.0, eval(get_param(block, 'Phases')));
    ports = get_param(block, 'ports');
    HavePhases = ports(6.0);
    % 11 12
    if lt(WantPhases, HavePhases)
        PortHandles = get_param(horzcat(block, '/DistributedParametersLine'), 'PortHandles');
        RConnTags = get_param(horzcat(block, '/DistributedParametersLine'), 'RConnTags');
        LConnTags = get_param(horzcat(block, '/DistributedParametersLine'), 'LConnTags');
        for i=HavePhases:-1.0:plus(WantPhases, 1.0)
            ligne_o = get_param(PortHandles.RConn(i), 'line');
            ligne_i = get_param(PortHandles.LConn(i), 'line');
            delete_line(ligne_o);
            delete_line(ligne_i);
            delete_block(horzcat(block, '/i', num2str(i)));
            delete_block(horzcat(block, '/o', num2str(i)));
        end % for
        set_param(horzcat(block, '/DistributedParametersLine'), 'RConnTags', RConnTags(1.0:WantPhases));
        set_param(horzcat(block, '/DistributedParametersLine'), 'LConnTags', LConnTags(1.0:WantPhases));
    end % if
    % 27 28
    if gt(WantPhases, HavePhases)
        for i=plus(HavePhases, 1.0):WantPhases
            % 30 31
            RConnTags = get_param(horzcat(block, '/DistributedParametersLine'), 'RConnTags');
            LConnTags = get_param(horzcat(block, '/DistributedParametersLine'), 'LConnTags');
            RConnTags{plus(end, 1.0)} = horzcat('o', num2str(i));
            LConnTags{plus(end, 1.0)} = horzcat('i', num2str(i));
            set_param(horzcat(block, '/DistributedParametersLine'), 'RConnTags', RConnTags);
            set_param(horzcat(block, '/DistributedParametersLine'), 'LConnTags', LConnTags);
            PortHandles = get_param(horzcat(block, '/DistributedParametersLine'), 'PortHandles');
            % 38 39
            P = plus(38.0, mtimes(35.0, minus(i, 1.0)));
            add_block('built-in/PMIOPort', horzcat(block, '/o', num2str(i)));
            set_param(horzcat(block, '/o', num2str(i)), 'Position', horzcat(225.0, P, 255.0, plus(P, 14.0)), 'side', 'Right', 'orientation', 'left');
            add_block('built-in/PMIOPort', horzcat(block, '/i', num2str(i)));
            set_param(horzcat(block, '/i', num2str(i)), 'Position', horzcat(35.0, P, 65.0, plus(P, 14.0)), 'side', 'Left', 'orientation', 'right');
            % 44 45
            iPortHandle = get_param(horzcat(block, '/i', num2str(i)), 'PortHandles');
            oPortHandle = get_param(horzcat(block, '/o', num2str(i)), 'PortHandles');
            % 47 48
            add_line(block, PortHandles.LConn(i), iPortHandle.RConn);
            add_line(block, PortHandles.RConn(i), oPortHandle.RConn);
        end % for
    end % if
end % function
