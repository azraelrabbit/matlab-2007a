function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    bfp = hC.SimulinkHandle;
    % 7 9
    name = hdllegalname(get_param(bfp, 'Name'));
    modelname = hdllegalnamersvd(get_param(bfp, 'ModelName'));
    inportnamestruct = get_param(bfp, 'InputPortNames');
    outportnamestruct = get_param(bfp, 'OutputPortNames');
    % 12 14
    phan = get_param(bfp, 'PortHandles');
    % 14 16
    userData = this.getHDLUserData(hC);
    % 16 18
    if userData.hasClock
        inportOffset = 3.0;
    else
        inportOffset = 0.0;
    end
    % 22 25
    % 23 25
    for n=1.0:length(phan.Inport)
        iport = get(get_param(phan.Inport(n), 'Object'), 'PortNumber');
        portn = horzcat('port', num2str(minus(iport, 1.0)));
        hC.setInputPortName(minus(plus(n, inportOffset), 1.0), hdllegalnamersvd(inportnamestruct.(portn)));
    end % for
    % 29 31
    for n=1.0:length(phan.Outport)
        oport = get(get_param(phan.Outport(n), 'Object'), 'PortNumber');
        portn = horzcat('port', num2str(minus(oport, 1.0)));
        hC.setOutputPortName(minus(n, 1.0), hdllegalnamersvd(outportnamestruct.(portn)));
    end % for
    % 35 37
    hdlcode.entity_name = modelname;
    hdlcode.arch_name = 'rtl';
    hdlcode.component_name = modelname;
end
