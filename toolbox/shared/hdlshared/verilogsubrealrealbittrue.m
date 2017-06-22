function [hdlbody, hdlsignals] = verilogsubrealrealbittrue(in1, in2, out, rounding, saturation)
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
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' - ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error(hdlerrormsgid('nonrealwithreal'), 'Attempt to subtract a real and a non-real');
            end % if
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' - ', name2, ';\n\n');
        else
            if eq(size1, 1.0)
                [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', name1, ' == 1)?', name2, ' - 1 : ', name2, ';\n\n');
            else
                if eq(size2, 1.0)
                    [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                    hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', name2, ' == 1)?', name1, ' - 1 : ', name1, ';\n\n');
                else
                    % 81 83
                    if eq(outsize, 1.0)
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 85 87
                        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (name1 != 0 && name2 != 0)? 1 : 0;\n\n');
                    else
                        % 88 90
                        % 89 93
                        % 90 93
                        % 91 93
                        if true
                            [tempse1, tempse1_ptr] = hdlnewsignal('sub_cast', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse1_ptr));
                            hdlbody = horzcat(hdlbody, hdldatatypeassignment(in1, tempse1_ptr, rounding, saturation));
                            if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                                hdlbody = hdlbody(1.0:minus(end, 2.0));
                            end % if
                        else
                            tempse1 = hdlsignaltypeconvert(name1, size1, signed1, vtype1, outsigned);
                        end % if
                        % 102 104
                        if true
                            [tempse2, tempse2_ptr] = hdlnewsignal('sub_cast', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse2_ptr));
                            hdlbody = horzcat(hdlbody, hdldatatypeassignment(in2, tempse2_ptr, rounding, saturation));
                            if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                                hdlbody = hdlbody(1.0:minus(end, 2.0));
                            end % if
                        else
                            tempse2 = hdlsignaltypeconvert(name2, size2, signed2, vtype2, outsigned);
                        end % if
                        % 113 115
                        sumsize = plus(1.0, outsize);
                        sumbp = outbp;
                        [tempvtype, tempsltype] = hdlgettypesfromsizes(sumsize, sumbp, resultsigned);
                        % 117 120
                        % 118 120
                        [tempsum, tempsum_ptr] = hdlnewsignal('sub_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum_ptr));
                        % 121 123
                        hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempsum, ' ', assign_op, ' ', tempse1, ' - ', tempse2, ';\n');
                        % 123 126
                        % 124 126
                        hdlbody = horzcat(hdlbody, hdldatatypeassignment(tempsum_ptr, out, rounding, saturation));
                        % 126 128
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
