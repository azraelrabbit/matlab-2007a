function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    bfp = hC.SimulinkHandle;
    phan = get_param(bfp, 'PortHandles');
    % 9 12
    % 10 12
    % 11 12
    inportOffset = 0.0;
    % 13 14
    for n=1.0:length(phan.Inport)
        iport = get(get_param(phan.Inport(n), 'Object'), 'PortNumber');
        lowerport = find_system(bfp, 'searchdepth', 1.0, 'BlockType', 'Inport', 'Port', num2str(iport));
        % 17 18
        if isempty(lowerport)
            pname = horzcat('inport', num2str(iport));
        else
            pname = get_param(lowerport, 'Name');
        end % if
        % 23 24
        hC.setInputPortName(minus(plus(n, inportOffset), 1.0), hdllegalnamersvd(pname));
    end % for
    % 26 27
    for n=1.0:length(phan.Outport)
        oport = get(get_param(phan.Outport(n), 'Object'), 'PortNumber');
        lowerport = find_system(bfp, 'searchdepth', 1.0, 'BlockType', 'Outport', 'Port', num2str(oport));
        % 30 31
        if isempty(lowerport)
            pname = horzcat('outport', num2str(oport));
        else
            pname = get_param(lowerport, 'Name');
        end % if
        % 36 37
        hC.setOutputPortName(minus(n, 1.0), hdllegalnamersvd(pname));
    end % for
    % 39 40
    hdlcode.entity_name = hC.Name;
    hdlcode.arch_name = 'rtl';
    hdlcode.component_name = hC.Name;
end % function
