function hdlbody = hdlcompareval(in, out, op, constval)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    name = hdlsignalname(in);
    vec = hdlsignalvector(in);
    sltype = hdlsignalsltype(in);
    outname = hdlsignalname(out);
    outvec = hdlsignalvector(out);
    outsltype = hdlsignalsltype(out);
    [insize, inbp, insigned] = hdlwordsize(sltype);
    % 15 17
    if eq(insize, 1.0)
        error(hdlerrormsgid('notsupported'), 'Arithmetic operations are not supported on 1-bit quantities');
        % 18 20
    end % if
    % 20 22
    outvecsize = max(outvec);
    % 22 24
    if eq(length(outvec), 1.0)
        % 24 26
        name = hdlsafeinput(in, sltype);
        hdlbody = gencompare(name, sltype, out, '', constval, op);
    else
        if eq(length(vec), 1.0)
            name = hdlsafeinput(in, sltype);
            if isequal(constval, mtimes(ones(size(constval)), constval(1.0)))
                hdlbody = gencompare(name, sltype, out, '', constval(1.0), op);
            else
                % 33 35
                hdlbody = genbody_sv(name, constval, sltype, out, op, outvecsize);
            end % if
        else
            % 37 39
            if isequal(constval, mtimes(ones(size(constval)), constval(1.0)))
                % 39 41
                if hdlgetparameter('isvhdl') && not(hdlgetparameter('loop_unrolling'))
                    % 41 43
                    hdlbody = genbody_vs(in, constval, out, op, outvecsize);
                else
                    hdlbody = genbody_vv(in, mtimes(ones(1.0, outvecsize), constval), out, op, outvecsize);
                end % if
            else
                % 47 49
                hdlbody = genbody_vv(in, constval, out, op, outvecsize);
            end % if
        end % if
    end % if
end % function
function space = spaces(indent)
    % 54 57
    % 55 57
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
function hdlbody = gencompare(name, sltype, out, label, constval, op)
    % 59 61
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    % 61 63
    [insize, inbp, insigned] = hdlwordsize(sltype);
    outname = horzcat(hdlsignalname(out), label);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    constr = hdlconstantvalue(constval, insize, inbp, insigned, 'noaggregate');
    % 67 69
    if hdlgetparameter('isverilog') && ne(insize, 0.0)
        if eq(insigned, 1.0)
            constr = horzcat('$signed(', constr, ')');
        end % if
    end % if
    % 73 75
    cond = horzcat(name, spaces(1.0), op, spaces(1.0), constr);
    strone = hdlconstantvalue(1.0, outsize, outbp, outsigned);
    strzero = hdlconstantvalue(0.0, outsize, outbp, outsigned);
    % 77 79
    if hdlgetparameter('isvhdl')
        hdlbody = horzcat(spaces(2.0), assign_prefix, outname, ' ', assign_op, ' ', strone, ' WHEN ( ', cond, ' ) ELSE ', strzero, ';\n');
    else
        % 81 83
        if hdlgetparameter('isverilog')
            hdlbody = horzcat(spaces(2.0), assign_prefix, outname, ' ', assign_op, ' ', '(', cond, ') ? ', strone, ' : ', strzero, ';\n');
        else
            % 85 87
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
            % 87 89
        end % if
    end % if
end % function
function hdlbody = genbody_sv(inname, cval, sltype, out, op, vecsize)
    hdlbody = [];
    for k=0.0:minus(vecsize, 1.0)
        label = horzcat('(', num2str(k), ')');
        hdlbody = horzcat(hdlbody, gencompare(inname, sltype, out, label, cval(plus(k, 1.0)), op));
    end % for
end % function
function hdlbody = genbody_vs(in, cval, out, op, vecsize)
    sltype = hdlsignalsltype(in);
    outname = hdlsignalname(out);
    genname = horzcat(outname(1.0:minus(strfind(outname, '_out'), 1.0)), hdlgetparameter('block_generate_label'));
    % 102 104
    hdlbody = horzcat(spaces(2.0), genname, ' : FOR k IN 0 TO ', num2str(minus(vecsize, 1.0)), ' GENERATE\n');
    inlabel = hdlsafeinput(in, sltype, 'k');
    array_deref = hdlgetparameter('array_deref');
    label = horzcat(array_deref(1.0), 'k', array_deref(2.0));
    hdlbody = horzcat(hdlbody, spaces(2.0), gencompare(inlabel, sltype, out, label, cval(1.0), op));
    hdlbody = horzcat(hdlbody, spaces(2.0), 'END GENERATE;\n');
end % function
function hdlbody = genbody_vv(in, cval, out, op, vecsize)
    % 111 113
    sltype = hdlsignalsltype(in);
    hdlbody = [];
    array_deref = hdlgetparameter('array_deref');
    for k=0.0:minus(vecsize, 1.0)
        inlabel = hdlsafeinput(in, sltype, num2str(k));
        label = horzcat(array_deref(1.0), num2str(k), array_deref(2.0));
        hdlbody = horzcat(hdlbody, gencompare(inlabel, sltype, out, label, cval(plus(k, 1.0)), op));
    end % for
end % function
