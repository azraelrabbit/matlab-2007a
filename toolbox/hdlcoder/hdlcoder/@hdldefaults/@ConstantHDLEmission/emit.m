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
    if strcmpi(get_param(bfp, 'BlockType'), 'Constant')
        rto = get_param(bfp, 'RuntimeObject');
        constprm = 0.0;
        for n=1.0:rto.NumRuntimePrms
            if strcmp(rto.RuntimePrm(n).Name, 'Value')
                constprm = n;
            end % if
        end % for
        if eq(constprm, 0.0)
            error(hdlcodererrormsgid('constantvaluenotfound'), 'hdlconstblock was unable to get the constant value.');
            % 20 22
        end % if
        cval = rto.RuntimePrm(constprm).Data;
    else
        if strcmpi(get_param(bfp, 'BlockType'), 'Ground')
            cval = 0.0;
        else
            valstruct = get_param(bfp, 'MaskWSVariables');
            if isempty(valstruct)
                valstruct = get_param(get(get_param(bfp, 'Object'), 'Parent'), 'MaskWSVariables');
            end % if
            if isempty(valstruct)
                cval = get_param(bfp, 'value');
            else
                val_loc = strmatch('Value', cellhorzcat(valstruct.Name), 'exact');
                if isempty(val_loc)
                    error(hdlcodererrormsgid('valuenotfound'), 'The value for the constant block could not be found');
                else
                    cval = valstruct(val_loc).Value;
                end % if
            end % if
            if ischar(cval)
                cval = evalin('base', cval);
            end % if
        end % if
        % 45 47
    end % if
    out = hC.OutputPorts(1.0).getSignal;
    outname = hdlsignalname(out);
    outcomplex = hdlsignalcomplex(out);
    outvector = hdlsignalvector(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 53 55
    if any(ne(outvector, 0.0)) && isscalar(cval)
        if eq(length(outvector), 1.0)
            cval = repmat(cval, outvector, 1.0);
        else
            if eq(outvector(1.0), 0.0)
                cval = repmat(cval, outvector(2.0), 1.0);
            else
                if eq(outvector(2.0), 0.0)
                    cval = repmat(cval, outvector(1.0), 1.0);
                else
                    cval = repmat(cval, outvector);
                end % if
            end % if
        end % if
    end % if
    if eq(outcomplex, 1.0)
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, vectorconstant(out, outname, outsize, outbp, outsigned, outvector, real(cval)));
        outname = hdlsignalname(hdlsignalimag(out));
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, vectorconstant(hdlsignalimag(out), outname, outsize, outbp, outsigned, outvector, imag(cval)));
    else
        % 74 76
        hdlcode.arch_body_blocks = horzcat(hdlcode.arch_body_blocks, vectorconstant(out, outname, outsize, outbp, outsigned, outvector, cval));
        % 76 79
        % 77 79
    end % if
    % 79 81
    hdlcode = hdlcodeconcat(horzcat(this.emitBlockComments(hC), hdlcode));
end % function
function hdlbody = vectorconstant(out, outname, outsize, outbp, outsigned, outvector, cval)
    % 83 87
    % 84 87
    % 85 87
    hdlbody = '';
    array_deref = hdlgetparameter('array_deref');
    % 88 90
    if hdlgetparameter('isverilog') && eq(outsize, 0.0)
        hdlbody = horzcat(hdlbody, '  initial\n    begin\n');
    end % if
    % 92 94
    if eq(outvector, 0.0)
        hdlbody = horzcat(hdlbody, scalarconstant(out, outname, outsize, outbp, outsigned, cval));
    else
        for n=1.0:max(outvector)
            vectname = horzcat(outname, array_deref(1.0), num2str(minus(n, 1.0)), array_deref(2.0));
            vectval = cval(n);
            hdlbody = horzcat(hdlbody, scalarconstant(out, vectname, outsize, outbp, outsigned, vectval));
        end % for
        % 101 103
    end % if
    % 103 105
    if hdlgetparameter('isverilog') && eq(outsize, 0.0)
        hdlbody = horzcat(hdlbody, '    end\n');
    end % if
    % 107 109
    hdlbody = horzcat(hdlbody, '\n');
end % function
function hdlbody = scalarconstant(out, outname, outsize, outbp, outsigned, cval)
    % 111 116
    % 112 116
    % 113 116
    % 114 116
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    % 116 118
    if hdlgetparameter('isverilog') && eq(outsize, 0.0)
        assign_prefix = '    ';
        assign_op = '=';
    end % if
    % 121 123
    hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', hdlconstantvalue(cval, outsize, outbp, outsigned), ';\n');
    % 123 125
end % function
