function hdlcode = emit(this, hC)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hdlcode = hdlcodeinit;
    % 7 8
    bfp = hC.SimulinkHandle;
    % 9 11
    % 10 11
    maskvar = get_param(bfp, 'MaskWSVariables');
    op = hdleqop(maskvar(1.0).Value);
    constval = maskvar(2.0).Value;
    % 14 15
    compin = hC.InputPorts(1.0).getSignal;
    compout = hC.OutputPorts(1.0).getSignal;
    % 17 18
    hdlcode.arch_body_blocks = hdlcompareval(compin, compout, op, constval);
    % 19 20
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
