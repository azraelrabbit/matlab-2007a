function [hdlbody, hdlsignals] = verilogaddrealrealbittrue(in1, in2, out, rounding, saturation)
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
            error(hdlerrormsgid('realwithnonreal'), 'Attempt to add a real and a non-real');
            % 59 61
        end % if
        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' + ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error(hdlerrormsgid('nonrealwithreal'), 'Attempt to add a real and a non-real');
            end % if
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' + ', name2, ';\n\n');
        else
            % 73 90
            % 74 90
            % 75 90
            % 76 90
            % 77 90
            % 78 90
            % 79 90
            % 80 90
            % 81 90
            % 82 90
            % 83 90
            % 84 90
            % 85 90
            % 86 90
            % 87 90
            % 88 90
            % 89 92
            % 90 92
            if true
                [tempse1, tempse1_ptr] = hdlnewsignal('add_cast', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse1_ptr));
                hdlbody = horzcat(hdlbody, hdldatatypeassignment(in1, tempse1_ptr, rounding, saturation));
                if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                    hdlbody = hdlbody(1.0:minus(end, 2.0));
                end % if
            else
                tempse1 = hdlsignaltypeconvert(name1, size1, signed1, vtype1, outsigned);
            end % if
            % 101 103
            if true
                [tempse2, tempse2_ptr] = hdlnewsignal('add_cast', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse2_ptr));
                hdlbody = horzcat(hdlbody, hdldatatypeassignment(in2, tempse2_ptr, rounding, saturation));
                if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                    hdlbody = hdlbody(1.0:minus(end, 2.0));
                end % if
            else
                tempse2 = hdlsignaltypeconvert(name2, size2, signed2, vtype2, outsigned);
            end % if
            % 112 114
            sumsize = plus(1.0, outsize);
            sumbp = outbp;
            [tempvtype, tempsltype] = hdlgettypesfromsizes(sumsize, sumbp, resultsigned);
            % 116 119
            % 117 119
            [tempsum, tempsum_ptr] = hdlnewsignal('add_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum_ptr));
            % 120 122
            hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempsum, ' ', assign_op, ' ', tempse1, ' + ', tempse2, ';\n');
            % 122 125
            % 123 125
            hdlbody = horzcat(hdlbody, hdldatatypeassignment(tempsum_ptr, out, rounding, saturation));
            % 125 127
        end % if
    end % if
end % function
