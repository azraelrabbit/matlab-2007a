function v = validate(this, hC)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    status = 0.0;
    msg = '';
    % 9 11
    bfp = hC.SimulinkHandle;
    % 11 13
    block_inputtype = get_param(bfp, 'InputType');
    % 13 15
    if not(strcmpi(block_inputtype, 'Vector'))
        status = 1.0;
        msg = 'Input type matrix is not handled in assignment blocks';
    else
        if not(strcmpi(get_param(bfp, 'ElementSrc'), 'External'))
            status = 1.0;
            msg = 'Internal elements is not handled yet in assignment blocks';
        else
            if not(strcmpi(get_param(bfp, 'IndexIsStartValue'), 'off'))
                status = 1.0;
                msg = 'Index is starting value ''on'' is not handled yet in assignment blocks';
            else
                if not(strcmpi(get_param(bfp, 'OutputInitialize'), 'Initialize using input port <Y0>'))
                    status = 1.0;
                    msg = 'Output(Y) must be ''Initialize using input port <Y0> in assignment blocks';
                end
            end
        end
    end
    if status
        v = getValStruct(status, msg);
        return
    end
    u1_in = hC.InputPorts(1.0).getSignal;
    out = hC.OutputPorts(1.0).getSignal;
    u1_vect = hdlsignalvector(u1_in);
    if eq(u1_vect, 0.0)
        status = 1.0;
        msg = 'Scalar first inputs are not handled in assignment blocks';
        v = getValStruct(status, msg);
        return
    end
    out_vect = hdlsignalvector(out);
    if eq(out_vect, 0.0)
        status = 1.0;
        msg = 'Scalar output is not handled in assignment blocks';
    else
        if ne(max(u1_vect), max(out_vect))
            status = 1.0;
            msg = 'The first input port and the output port must have the same vector dimension in assignment blocks';
        end
    end
    v = getValStruct(status, msg);
end
function v = getValStruct(status, msg)
    v.Status = status;
    v.Message = msg;
    v.MessageID = 'AssignmentHDLEmission:validate';
end
