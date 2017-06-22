function hdlcode = emit(this, hC)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hdlcode = hdlcodeinit;
    % 7 9
    bfp = hC.SimulinkHandle;
    % 9 11
    phan = get_param(bfp, 'PortHandles');
    % 11 13
    block_inputtype = get_param(bfp, 'InputType');
    % 13 15
    if strcmpi(get_param(bfp, 'IndexMode'), 'Zero-based')
        idxoffset = -1.0;
    else
        idxoffset = 0.0;
    end % if
    % 19 21
    if not(strcmpi(block_inputtype, 'Vector'))
        error(hdlcodererrormsgid('MatrixNotHandled'), 'Input type matrix is not handled in assignment blocks');
    else
        if not(strcmpi(get_param(bfp, 'ElementSrc'), 'External'))
            error(hdlcodererrormsgid('InternalElemetnsNotHandled'), 'Internal elements is not handled yet in assignment blocks');
        else
            if not(strcmpi(get_param(bfp, 'IndexIsStartValue'), 'off'))
                error(hdlcodererrormsgid('IndexIsStartingValueOnNotHandled'), 'Index is starting value ''on'' is not handled yet in assignment blocks');
            else
                if not(strcmpi(get_param(bfp, 'OutputInitialize'), 'Initialize using input port <Y0>'))
                    error(hdlcodererrormsgid('OutputInitializeNotHandled'), 'Output(Y) must be ''Initialize using input port <Y0> in assignment blocks');
                else
                    % 32 34
                    u1_in = hC.InputPorts(1.0).getSignal;
                    u2_in = hC.InputPorts(2.0).getSignal;
                    idx_in = hC.InputPorts(3.0).getSignal;
                    % 36 38
                    out = hC.OutputPorts(1.0).getSignal;
                    % 38 40
                    u1_vect = hdlsignalvector(u1_in);
                    if eq(u1_vect, 0.0)
                        error(hdlcodererrormsgid('ScalarNotHandled'), 'Scalar first inputs are not handled in assignment blocks');
                    else
                        % 43 45
                        u1_expanded = hdlexpandvectorsignal(u1_in);
                    end % if
                    % 46 48
                    out_vect = hdlsignalvector(out);
                    if eq(out_vect, 0.0)
                        error(hdlcodererrormsgid('OutScalarNotHandled'), 'Scalar output is not handled in assignment blocks');
                    else
                        if ne(max(u1_vect), max(out_vect))
                            error(hdlcodererrormsgid('InOutSizeNotEqual'), 'The first input port and the output port must have the same vector dimension in assignment blocks');
                        else
                            % 54 56
                            out_expanded = hdlexpandvectorsignal(out);
                        end % if
                        % 57 59
                    end % if
                    for n=1.0:length(u1_expanded)
                        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, hdlmux(horzcat(u2_in, u1_expanded(n)), out_expanded(n), idx_in, {'='}, plus(n, idxoffset), 'when-else'));
                        % 61 64
                        % 62 64
                    end % for
                    hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, '\n');
                    % 65 67
                end % if
                % 67 69
            end % if
        end % if
    end % if
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
