function hdlbody = vhdlsetorextractbits(in, out, bitindex, bitvalstr)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    singlequote = char(39.0);
    % 10 12
    name = hdlsignalname(in);
    sltype = hdlsignalsltype(in);
    vtype = hdlsignalvtype(in);
    outname = hdlsignalname(out);
    outsltype = hdlsignalsltype(out);
    outvector = hdlsignalvector(out);
    [size, bp, signed] = hdlwordsize(sltype);
    % 18 20
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 20 22
    isinport = hdlisinportsignal(in);
    % 22 26
    % 23 26
    % 24 26
    if eq(nargin, 4.0)
        % 26 28
        if eq(outvector, 0.0)
            % 28 30
            hdlbody = horzcat(set_clear_bit(name, sltype, size, outname, outsltype, isinport, bitindex, bitvalstr, 2.0), '\n');
        else
            % 31 34
            % 32 34
            vecsize = max(outvector(1.0), outvector(2.0));
            genname = horzcat(outname(1.0:minus(strfind(outname, '_out'), 1.0)), hdlgetparameter('block_generate_label'));
            hdlbody = horzcat(spaces(2.0), genname, ' : ', 'FOR k IN 0 TO ', num2str(minus(vecsize, 1.0)), ' GENERATE\n');
            hdlbody = horzcat(hdlbody, set_clear_bit(horzcat(name, '(k)'), sltype, size, horzcat(outname, '(k)'), outsltype, isinport, bitindex, bitvalstr, 4.0));
            % 37 39
            hdlbody = horzcat(hdlbody, spaces(2.0), 'END GENERATE;\n\n');
            % 39 41
        end % if
        % 41 43
    end % if
end % function
function hdlbody = set_clear_bit(name, sltype, size, outname, outsltype, isinport, bitindex, bitvalstr, nspaces)
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    singlequote = char(39.0);
    % 51 53
    index = str2num(bitindex);
    if eq(index, 0.0)
        % 54 56
        idxstr = horzcat('(', int2str(minus(size, 1.0)), ' DOWNTO 1)');
        hdlbody = horzcat(spaces(nspaces), outname, idxstr, ' <= ', safename(horzcat(name, idxstr), sltype, outsltype, isinport), ';\n');
        % 57 59
        hdlbody = horzcat(hdlbody, spaces(nspaces), outname, '(0)', ' <= ', singlequote, bitvalstr, singlequote, ';\n');
    else
        % 60 62
        if eq(index, minus(size, 1.0))
            % 62 64
            idxstr = horzcat('(', int2str(minus(size, 2.0)), ' DOWNTO 0)');
            hdlbody = horzcat(spaces(nspaces), outname, '(', int2str(minus(size, 1.0)), ')', ' <= ', singlequote, bitvalstr, singlequote, ';\n');
            % 65 67
            hdlbody = horzcat(hdlbody, spaces(nspaces), outname, idxstr, ' <= ', safename(horzcat(name, idxstr), sltype, outsltype, isinport), ';\n');
        else
            % 68 70
            % 69 74
            % 70 74
            % 71 74
            % 72 74
            if eq(index, minus(size, 2.0))
                idxstr1 = horzcat('(', int2str(minus(size, 1.0)), ')');
                % 75 77
                hdlbody = horzcat(spaces(nspaces), outname, idxstr1, ' <= ', horzcat(name, idxstr1), ';\n');
            else
                idxstr1 = horzcat('(', int2str(minus(size, 1.0)), ' DOWNTO ', int2str(plus(index, 1.0)), ')');
                hdlbody = horzcat(spaces(nspaces), outname, idxstr1, ' <= ', safename(horzcat(name, idxstr1), sltype, outsltype, isinport), ';\n');
                % 80 82
            end % if
            % 82 85
            % 83 85
            idxstr = horzcat('(', int2str(index), ')');
            hdlbody = horzcat(hdlbody, spaces(nspaces), outname, idxstr, ' <= ', singlequote, bitvalstr, singlequote, ';\n');
            % 86 90
            % 87 90
            % 88 90
            if eq(index, 1.0)
                idxstr2 = horzcat('(', int2str(0.0), ')');
                % 91 93
                hdlbody = horzcat(hdlbody, spaces(nspaces), outname, idxstr2, ' <= ', horzcat(name, idxstr2), ';\n');
            else
                idxstr2 = horzcat('(', int2str(minus(index, 1.0)), ' DOWNTO 0', ')');
                hdlbody = horzcat(hdlbody, spaces(nspaces), outname, idxstr2, ' <= ', safename(horzcat(name, idxstr2), sltype, outsltype, isinport), ';\n');
                % 96 98
            end % if
            % 98 100
        end % if
    end % if
end % function
function name = safename(name, sltype, outsltype, isinport)
    % 103 105
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    [size, bp, signed] = hdlwordsize(sltype);
    % 106 108
    if gt(size, 1.0)
        if isinport
            [name, size] = hdlsignaltypeconvert(name, size, signed, vhdlportdatatype(sltype), outsigned);
        else
            % 111 113
            [name, size] = hdlsignaltypeconvert(name, size, signed, vhdlblockdatatype(sltype), outsigned);
            % 113 115
        end % if
    end % if
end % function
function space = spaces(indent)
    % 118 120
    space = mtimes(fix(' '), ones(1.0, indent));
end % function
