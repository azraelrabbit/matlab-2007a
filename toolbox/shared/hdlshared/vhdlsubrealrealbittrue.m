function [hdlbody, hdlsignals] = vhdlsubrealrealbittrue(in1, in2, out, rounding, saturation)
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
    comment_char = hdlgetparameter('comment_char');
    % 12 14
    name1 = hdlsignalname(in1);
    handle1 = hdlsignalhandle(in1);
    vector1 = hdlsignalvector(in1);
    vtype1 = hdlsignalvtype(in1);
    sltype1 = hdlsignalsltype(in1);
    [size1, bp1, signed1] = hdlwordsize(sltype1);
    % 19 21
    name2 = hdlsignalname(in2);
    handle2 = hdlsignalhandle(in2);
    vector2 = hdlsignalvector(in2);
    vtype2 = hdlsignalvtype(in2);
    sltype2 = hdlsignalsltype(in2);
    [size2, bp2, signed2] = hdlwordsize(sltype2);
    % 26 28
    outname = hdlsignalname(out);
    outhandle = hdlsignalhandle(out);
    outvector = hdlsignalvector(out);
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 33 50
    % 34 50
    % 35 50
    % 36 50
    % 37 50
    % 38 50
    % 39 50
    % 40 50
    % 41 50
    % 42 50
    % 43 50
    % 44 50
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    if eq(signed1, 0.0) && eq(signed2, 0.0)
        resultsigned = 0.0;
    else
        resultsigned = 1.0;
    end % if
    % 54 56
    if eq(size1, 0.0)
        if ne(size2, 0.0)
            error('Attempt to add a real and a non-real');
        end % if
        hdlbody = horzcat('  ', outname, ' <= ', name1, ' - ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error('Attempt to add a real and a non-real');
            end % if
            hdlbody = horzcat('  ', outname, ' <= ', name1, ' - ', name2, ';\n\n');
        else
            if eq(size1, 1.0)
                [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                hdlbody = horzcat('  ', outname, ' <= ', name2, ' - 1 WHEN ', name1, ' = ''1'' ELSE ', name2, ';\n\n');
            else
                if eq(size2, 1.0)
                    [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                    hdlbody = horzcat('  ', outname, ' <= ', name1, ' - 1 WHEN ', name2, ' = ''1'' ELSE ', name1, ';\n\n');
                else
                    if eq(outsize, 1.0)
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 78 80
                        hdlbody = horzcat('  ', outname, ' <= ''1'' WHEN ', name1, ' /= 0', ' AND ', name2, ' /= 0', ' ELSE ''0'';\n\n');
                    else
                        % 81 84
                        % 82 84
                        % 83 85
                        [castvtype, castsltype] = hdlgettypesfromsizes(outsize, outbp, resultsigned);
                        % 85 87
                        [tempse1, tempse1_ptr] = hdlnewsignal('sub_cast', 'block', -1.0, 0.0, 0.0, castvtype, castsltype);
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse1_ptr));
                        hdlbody = horzcat(hdlbody, hdldatatypeassignment(in1, tempse1_ptr, rounding, saturation));
                        if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                            hdlbody = hdlbody(1.0:minus(end, 2.0));
                        end % if
                        % 92 94
                        [tempse2, tempse2_ptr] = hdlnewsignal('sub_cast', 'block', -1.0, 0.0, 0.0, castvtype, castsltype);
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse2_ptr));
                        hdlbody = horzcat(hdlbody, hdldatatypeassignment(in2, tempse2_ptr, rounding, saturation));
                        if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                            hdlbody = hdlbody(1.0:minus(end, 2.0));
                        end % if
                        % 99 101
                        sumsize = plus(1.0, outsize);
                        sumbp = outbp;
                        [sumvtype, sumsltype] = hdlgettypesfromsizes(sumsize, sumbp, resultsigned);
                        % 103 106
                        % 104 106
                        [tempsum, tempsum_ptr] = hdlnewsignal('sub_temp', 'block', -1.0, 0.0, 0.0, sumvtype, sumsltype);
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum_ptr));
                        % 107 109
                        hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempsum, ' ', assign_op, ' ', 'resize(', tempse1, ', ', num2str(sumsize), ')', ' - ', 'resize(', tempse2, ', ', num2str(sumsize), ')', ';\n');
                        % 109 114
                        % 110 114
                        % 111 114
                        % 112 114
                        hdlbody = horzcat(hdlbody, hdldatatypeassignment(tempsum_ptr, out, rounding, saturation));
                        % 114 116
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
