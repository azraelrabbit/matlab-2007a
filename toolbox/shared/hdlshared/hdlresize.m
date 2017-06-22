function [hdlbody, hdlsignal] = hdlresize(in, outsltype, idx)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    flag = false;
    hdlbody = '';
    hdlsignals = '';
    % 12 14
    name = hdlsignalname(in);
    handle = hdlsignalhandle(in);
    vector = hdlsignalvector(in);
    vtype = hdlsignalvtype(in);
    sltype = hdlsignalsltype(in);
    [size, bp, signed] = hdlwordsize(sltype);
    % 19 21
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 21 23
    [name, size] = hdlsignaltypeconvert(name, size, signed, vtype, outsigned);
    % 23 25
    if eq(size, outsize) && eq(bp, outbp)
        hdlsignal = in;
        hdlbody = '';
    else
        if hdlgetparameter('isverilog')
            error(hdlcodererrormsgid('unsupportblock'), 'The hdlresize should be reviewed for verilog', fcn_string);
        else
            % 31 39
            % 32 39
            % 33 39
            % 34 39
            % 35 39
            % 36 39
            % 37 39
            % 38 41
            % 39 41
            name = horzcat('resize(', name, ', ', num2str(outsize), ')');
            % 41 43
            [tempvtype, tempsltype] = hdlgettypesfromsizes(outsize, outbp, outsigned);
            % 43 45
            [tempsignal, tempsignal_ptr] = hdlnewsignal(horzcat('resized_In1_', num2str(idx)), 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
            hdlbody = horzcat(hdlbody, '  ', tempsignal, ' <= ', name, ';\n');
            hdlsignal = tempsignal_ptr;
            flag = true;
        end % if
    end % if
end % function
