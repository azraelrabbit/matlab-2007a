function nesl_extractinputs(model)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    solver_block = horzcat(model, '/Solver Configuration');
    net = nesl_network(solver_block);
    sys = net.build;
    input_names = get(sys.Input, 'Descriptor');
    if isempty(input_names)
        num_inputs = 0.0;
    else
        if isa(input_names, 'cell')
            num_inputs = length(input_names);
        else
            if isa(input_names, 'char')
                num_inputs = 1.0;
            end
        end
    end
    for i=1.0:num_inputs
        if gt(num_inputs, 1.0)
            input_fullname = input_names{i};
        else
            input_fullname = input_names;
        end
        input_name = get_param(input_fullname, 'Name');
        line_handle = get_param(input_fullname, 'LineHandles');
        src_handle = get_param(line_handle.Inport, 'SrcBlockHandle');
        src_porthandle = get_param(line_handle.Inport, 'SrcPortHandle');
        src_portnum = get_param(src_porthandle, 'PortNumber');
        src_portnum_str = num2str(src_portnum);
        src_name = get_param(src_handle, 'Name');
        src_name_with_portnum = horzcat(src_name, '/', src_portnum_str);
        src_fullname = horzcat(model, '/', src_name);
        src_position = get_param(src_fullname, 'Position');
        inport_position(1.0) = src_position(1.0);
        inport_position(2.0) = plus(src_position(4.0), 30.0);
        inport_position(3.0:4.0) = plus(inport_position(1.0:2.0), 20.0);
        inport_name = horzcat('myinport', num2str(i));
        inport_fullname = horzcat(model, '/', inport_name);
        add_block('built-in/Inport', inport_fullname, 'Position', inport_position);
        sum_position = plus(inport_position, [30.0 0.0 30.0 0.0]);
        sum_name = horzcat('mysum', num2str(i));
        sum_fullname = horzcat(model, '/', sum_name);
        add_block('built-in/Sum', sum_fullname, 'Position', sum_position);
        delete_line(model, src_name_with_portnum, horzcat(input_name, '/1'));
        add_line(model, horzcat(inport_name, '/1'), horzcat(sum_name, '/2'));
        add_line(model, src_name_with_portnum, horzcat(sum_name, '/1'));
        add_line(model, horzcat(sum_name, '/1'), horzcat(input_name, '/1'));
        % 51 55
        % 52 55
        % 53 55
        input_position = get_param(input_fullname, 'Position');
        outport_name = horzcat('myoutport', num2str(i));
        outport_fullname = horzcat(model, '/', outport_name);
        outport_position(1.0) = input_position(1.0);
        outport_position(2.0) = plus(input_position(4.0), 30.0);
        outport_position(3.0:4.0) = plus(outport_position(1.0:2.0), [20.0 20.0]);
        add_block('built-in/Outport', outport_fullname, 'Position', outport_position);
        add_line(model, src_name_with_portnum, horzcat(outport_name, '/1'));
    end % for
    % 63 66
    % 64 66
    output_names = get(sys.Output, 'Descriptor');
    if isempty(output_names)
        num_outputs = 0.0;
    else
        if isa(output_names, 'cell')
            num_outputs = length(output_names);
        else
            if isa(output_names, 'char')
                num_outputs = 1.0;
            end
        end
    end
    for i=1.0:num_outputs
        if gt(num_outputs, 1.0)
            output_fullname = output_names{i};
        else
            output_fullname = output_names;
        end
        output_name = get_param(output_fullname, 'Name');
        output_position = get_param(output_fullname, 'Position');
        outport_position(1.0) = plus(output_position(3.0), 30.0);
        outport_position(2.0) = minus(output_position(2.0), 20.0);
        outport_position(3.0:4.0) = plus(outport_position(1.0:2.0), 20.0);
        outport_name = horzcat('myoutport', num2str(plus(i, num_inputs)));
        outport_fullname = horzcat(model, '/', outport_name);
        add_block('built-in/Outport', outport_fullname, 'Position', outport_position);
        add_line(model, horzcat(output_name, '/1'), horzcat(outport_name, '/1'));
    end % for
end
