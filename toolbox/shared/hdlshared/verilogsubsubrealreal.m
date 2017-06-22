function [hdlbody, hdlsignals] = verilogsubsubrealreal(in1, in2, out, rounding, saturation)
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
            error(hdlerrormsgid('realwithnonreal'), 'Attempt to subtract a real and a non-real');
            % 59 61
        end % if
        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' -', name1, ' - ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error(hdlerrormsgid('nonrealwithreal'), 'Attempt to subtract a real and a non-real');
            end % if
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' -', name1, ' - ', name2, ';\n\n');
        else
            % 73 88
            % 74 88
            % 75 88
            % 76 88
            % 77 88
            % 78 88
            % 79 88
            % 80 88
            % 81 88
            % 82 88
            % 83 88
            % 84 88
            % 85 88
            % 86 88
            % 87 90
            % 88 90
            [tempunary, tempunary_ptr] = hdlnewsignal('subsub_temp', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempunary_ptr));
            % 91 93
            [tempbody, tempsigs] = hdlunaryminus(in1, tempunary_ptr, rounding, saturation);
            hdlsignals = horzcat(hdlsignals, tempsigs);
            hdlbody = horzcat(hdlbody, tempbody);
            % 95 97
            [tempbody, tempsigs] = hdlsub(tempunary_ptr, in2, out, rounding, saturation);
            hdlsignals = horzcat(hdlsignals, tempsigs);
            hdlbody = horzcat(hdlbody, tempbody);
            % 99 101
        end % if
    end % if
end % function
