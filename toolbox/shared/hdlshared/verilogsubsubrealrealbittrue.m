function [hdlbody, hdlsignals] = verilogsubsubrealrealbittrue(in1, in2, out, rounding, saturation)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    hdlbody = '';
    hdlsignals = '';
    % 9 11
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    % 11 13
    name1 = hdlsignalname(in1);
    handle1 = hdlsignalhandle(in1);
    vector1 = hdlsignalvector(in1);
    vtype1 = hdlsignalvtype(in1);
    sltype1 = hdlsignalsltype(in1);
    [size1, bp1, signed1] = hdlwordsize(sltype1);
    % 18 20
    name2 = hdlsignalname(in2);
    handle2 = hdlsignalhandle(in2);
    vector2 = hdlsignalvector(in2);
    vtype2 = hdlsignalvtype(in2);
    sltype2 = hdlsignalsltype(in2);
    [size2, bp2, signed2] = hdlwordsize(sltype2);
    % 25 27
    outname = hdlsignalname(out);
    outhandle = hdlsignalhandle(out);
    outvector = hdlsignalvector(out);
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 32 49
    % 33 49
    % 34 49
    % 35 49
    % 36 49
    % 37 49
    % 38 49
    % 39 49
    % 40 49
    % 41 49
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    if eq(signed1, 0.0) && eq(signed2, 0.0)
        resultsigned = 0.0;
    else
        resultsigned = 1.0;
    end % if
    % 53 55
    if eq(size1, 0.0)
        if ne(size2, 0.0)
            error(hdlerrormsgid('realwithnonreal'), 'Attempt to subtract a real and a non-real');
            % 57 59
        end % if
        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' -', name1, ' - ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error(hdlerrormsgid('realwithnonreal'), 'Attempt to subtract a real and a non-real');
            end % if
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' -', name1, ' - ', name2, ';\n\n');
        else
            % 71 85
            % 72 85
            % 73 85
            % 74 85
            % 75 85
            % 76 85
            % 77 85
            % 78 85
            % 79 85
            % 80 85
            % 81 85
            % 82 85
            % 83 85
            % 84 87
            % 85 87
            [tempunary, tempunary_ptr] = hdlnewsignal('subsub_temp', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempunary_ptr));
            % 88 90
            [tempbody, tempsigs] = hdlunaryminus(in1, tempunary_ptr, rounding, saturation);
            hdlsignals = horzcat(hdlsignals, tempsigs);
            hdlbody = horzcat(hdlbody, tempbody);
            % 92 94
            [tempbody, tempsigs] = verilogsubrealrealbittrue(tempunary_ptr, in2, out, rounding, saturation);
            hdlsignals = horzcat(hdlsignals, tempsigs);
            hdlbody = horzcat(hdlbody, tempbody);
            % 96 98
        end % if
    end % if
end % function
