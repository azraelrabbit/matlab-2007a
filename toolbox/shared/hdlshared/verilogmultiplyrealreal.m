function [hdlbody, hdlsignals] = verilogmultiplyrealreal(in1, in2, out, rounding, saturation)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    hdlbody = '';
    hdlsignals = '';
    % 10 12
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    comment_char = hdlgetparameter('comment_char');
    % 13 15
    name1 = hdlsignalname(in1);
    handle1 = hdlsignalhandle(in1);
    vector1 = hdlsignalvector(in1);
    vtype1 = hdlsignalvtype(in1);
    sltype1 = hdlsignalsltype(in1);
    [size1, bp1, signed1] = hdlwordsize(sltype1);
    % 20 22
    name2 = hdlsignalname(in2);
    handle2 = hdlsignalhandle(in2);
    vector2 = hdlsignalvector(in2);
    vtype2 = hdlsignalvtype(in2);
    sltype2 = hdlsignalsltype(in2);
    [size2, bp2, signed2] = hdlwordsize(sltype2);
    % 27 29
    outname = hdlsignalname(out);
    outhandle = hdlsignalhandle(out);
    outvector = hdlsignalvector(out);
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 34 51
    % 35 51
    % 36 51
    % 37 51
    % 38 51
    % 39 51
    % 40 51
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    if eq(signed1, 0.0) && eq(signed2, 0.0)
        resultsigned = 0.0;
    else
        resultsigned = 1.0;
    end % if
    % 55 57
    if eq(size1, 0.0)
        if ne(size2, 0.0)
            error(hdlerrormsgid('realwithnonreal'), 'Attempt to multiply a real by a non-real');
            % 59 61
        end % if
        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' * ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error(hdlerrormsgid('nonrealwithreal'), 'Attempt to multiply a real by a non-real');
            end % if
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' * ', name2, ';\n\n');
        else
            % 73 100
            % 74 100
            % 75 100
            % 76 100
            % 77 100
            % 78 100
            % 79 100
            % 80 100
            % 81 100
            % 82 100
            % 83 100
            % 84 100
            % 85 100
            % 86 100
            % 87 100
            % 88 100
            % 89 100
            % 90 100
            % 91 100
            % 92 100
            % 93 100
            % 94 100
            % 95 100
            % 96 100
            % 97 100
            % 98 100
            % 99 101
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            % 102 104
            prodsize = plus(size1, size2);
            prodbp = plus(bp1, bp2);
            % 105 107
            if ne(prodsize, outsize) || ne(prodbp, outbp) || ne(resultsigned, outsigned)
                [tempvtype, tempsltype] = hdlgettypesfromsizes(prodsize, prodbp, resultsigned);
                % 108 110
                [tempprod, tempprod_ptr] = hdlnewsignal('mul_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
                hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempprod_ptr));
                % 111 113
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempprod, ' ', assign_op, ' ', name1, ' * ', name2, ';\n');
                % 113 115
                hdlbody = horzcat(hdlbody, hdldatatypeassignment(tempprod_ptr, out, rounding, saturation));
                if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                    hdlbody = hdlbody(1.0:minus(end, 2.0));
                end % if
            else
                % 119 121
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' * ', name2, ';\n');
            end % if
            % 122 124
            hdlbody = horzcat(hdlbody, '\n');
            % 124 126
        end % if
    end % if
end % function
