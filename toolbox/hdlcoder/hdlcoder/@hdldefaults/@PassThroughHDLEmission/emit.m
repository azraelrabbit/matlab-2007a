function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hdlcode = hdlcodeinit;
    % 8 10
    % 9 10
    inputs = hC.InputPorts;
    outputs = hC.OutputPorts;
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if gt(length(inputs), 1.0) || gt(length(outputs), 1.0)
        error(hdlcodererrormsgid('invalidports'), 'Internal error: found more than one input or output port')
        % 18 19
    end % if
    % 20 21
    in = inputs(1.0).getSignal;
    out = outputs(1.0).getSignal;
    % 23 25
    % 24 25
    rnd = 'floor';
    sat = 0.0;
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    hdlcode.arch_body_blocks = hdldatatypeassignment(in, out, rnd, sat);
    % 37 38
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
