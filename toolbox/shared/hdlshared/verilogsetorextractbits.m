function hdlbody = verilogsetorextractbits(in, out, bitindex, bitvalstr)
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
    vtype = hdlsignalvtype(in);
    outname = hdlsignalname(out);
    outsltype = hdlsignalsltype(out);
    outvector = hdlsignalvector(out);
    [size, bp, signed] = hdlwordsize(sltype);
    % 16 18
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 18 20
    isinport = hdlisinportsignal(in);
    % 20 24
    % 21 24
    % 22 24
    if eq(nargin, 4.0)
        % 24 26
        if eq(outvector, 0.0)
            % 26 28
            hdlbody = horzcat(set_clear_bit(out, name, sltype, size, outname, outsltype, isinport, bitindex, bitvalstr, 2.0), '\n');
        else
            % 29 32
            % 30 32
            hdlbody = '';
            vecsize = max(outvector(1.0), outvector(2.0));
            for k=0.0:minus(vecsize, 1.0)
                hdlbody = horzcat(hdlbody, set_clear_bit(out, horzcat(name, '[', num2str(k), ']'), sltype, size, horzcat(outname, '[', num2str(k), ']'), outsltype, isinport, bitindex, bitvalstr, 2.0));
                % 35 37
            end % for
            % 37 39
            hdlbody = horzcat(hdlbody, '\n');
            % 39 41
        end % if
        % 41 43
    end % if
end % function
function hdlbody = set_clear_bit(out, name, sltype, size, outname, outsltype, isinport, bitindex, bitvalstr, nspaces)
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    % 51 53
    index = str2num(bitindex);
    % 53 55
    if eq(index, 0.0)
        % 55 57
        idxstr = horzcat('[', int2str(minus(size, 1.0)), ' : 1]');
        hdlbody = horzcat(spaces(nspaces), assign_prefix, outname, idxstr, assign_op, safename(horzcat(name, idxstr), sltype, outsltype, isinport), ';\n');
        % 58 60
        hdlbody = horzcat(hdlbody, spaces(nspaces), assign_prefix, outname, '[0]', assign_op, bitvalstr, ';\n');
    else
        % 61 63
        if eq(index, minus(size, 1.0))
            % 63 65
            idxstr = horzcat('[', int2str(minus(size, 2.0)), ' : 0]');
            hdlbody = horzcat(spaces(nspaces), assign_prefix, outname, '[', int2str(minus(size, 1.0)), ']', assign_op, bitvalstr, ';\n');
            % 66 68
            hdlbody = horzcat(hdlbody, spaces(nspaces), assign_prefix, outname, idxstr, assign_op, safename(horzcat(name, idxstr), sltype, outsltype, isinport), ';\n');
        else
            % 69 71
            % 70 75
            % 71 75
            % 72 75
            % 73 75
            if eq(index, minus(size, 2.0))
                idxstr1 = horzcat('[', int2str(minus(size, 1.0)), ']');
                % 76 78
                hdlbody = horzcat(spaces(nspaces), assign_prefix, outname, idxstr1, assign_op, horzcat(name, idxstr1), ';\n');
            else
                idxstr1 = horzcat('[', int2str(minus(size, 1.0)), ' : ', int2str(plus(index, 1.0)), ']');
                hdlbody = horzcat(spaces(nspaces), assign_prefix, outname, idxstr1, assign_op, safename(horzcat(name, idxstr1), sltype, outsltype, isinport), ';\n');
                % 81 83
            end % if
            % 83 86
            % 84 86
            idxstr = horzcat('[', int2str(index), ']');
            hdlbody = horzcat(hdlbody, spaces(nspaces), assign_prefix, outname, idxstr, assign_op, bitvalstr, ';\n');
            % 87 91
            % 88 91
            % 89 91
            if eq(index, 1.0)
                idxstr2 = horzcat('[', int2str(0.0), ']');
                % 92 94
                hdlbody = horzcat(hdlbody, spaces(nspaces), assign_prefix, outname, idxstr2, assign_op, horzcat(name, idxstr2), ';\n');
            else
                idxstr2 = horzcat('[', int2str(minus(index, 1.0)), ' : 0]');
                hdlbody = horzcat(hdlbody, spaces(nspaces), assign_prefix, outname, idxstr2, assign_op, safename(horzcat(name, idxstr2), sltype, outsltype, isinport), ';\n');
                % 97 99
            end % if
            % 99 101
        end % if
    end % if
end % function
function name = safename(name, sltype, outsltype, isinport)
    % 104 106
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    [size, bp, signed] = hdlwordsize(sltype);
    % 107 109
    if gt(size, 1.0)
        if isinport
            [name, size] = hdlsignaltypeconvert(name, size, signed, verilogportdatatype(sltype), outsigned);
        else
            % 112 114
            [name, size] = hdlsignaltypeconvert(name, size, signed, verilogblockdatatype(sltype), outsigned);
            % 114 116
        end % if
    end % if
end % function
function space = spaces(indent)
    % 119 121
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
