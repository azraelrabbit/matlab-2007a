function name = hdlsafeinput(in, outsltype, idxchar)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    name = hdlsignalname(in);
    sltype = hdlsignalsltype(in);
    % 11 13
    array_deref = hdlgetparameter('array_deref');
    % 13 15
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 15 17
    if isempty(sltype)
        size = 1.0;
        bp = 0.0;
        signed = 0.0;
    else
        [size, bp, signed] = hdlwordsize(sltype);
    end
    % 23 25
    if hdlgetparameter('isvhdl')
        isinport = vhdlisstdlogicvector(in);
    else
        isinport = false;
    end
    % 29 31
    if eq(nargin, 3.0)
        name = horzcat(name, array_deref(1.0), idxchar, array_deref(2.0));
    end
    % 33 35
    if gt(size, 1.0)
        if isinport
            [name, size] = hdlsignaltypeconvert(name, size, signed, hdlportdatatype(sltype), outsigned);
        else
            % 38 40
            [name, size] = hdlsignaltypeconvert(name, size, signed, hdlblockdatatype(sltype), outsigned);
            % 40 42
        end
    else
        if hdlgetparameter('isverilog') && hdlisinportsignal(in)
            [name, size] = hdlsignaltypeconvert(name, size, signed, hdlportdatatype(sltype), outsigned);
        end
    end
end
