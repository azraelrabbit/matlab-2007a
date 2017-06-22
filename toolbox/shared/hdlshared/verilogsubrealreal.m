function [hdlbody, hdlsignals] = verilogsubrealreal(in1, in2, out, rounding, saturation)
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
    end
    % 55 57
    if eq(size1, 0.0)
        if ne(size2, 0.0)
            error(hdlerrormsgid('realwithnonreal'), 'Attempt to subtract a real and a non-real');
            % 59 61
        end
        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' - ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error(hdlerrormsgid('nonrealwithreal'), 'Attempt to subtract a real and a non-real');
            end
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' - ', name2, ';\n\n');
        else
            if eq(size1, 1.0)
                [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', name1, ' == 1)? ', name2, ' - 1 : ', name2, ';\n\n');
            else
                if eq(size2, 1.0)
                    [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                    hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', name1, ' == 1)? ', name1, ' - 1 : ', name2, ';\n\n');
                else
                    % 81 83
                    if eq(outsize, 1.0)
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 85 87
                        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', name1, ' != 0 && ', name2, ' != 0)? 1 : 0;\n\n');
                    else
                        % 88 90
                        % 89 95
                        % 90 95
                        % 91 95
                        % 92 95
                        % 93 95
                        in1need_signext = false;
                        in2need_signext = false;
                        if gt(bp1, bp2)
                            size2 = plus(size2, minus(bp1, bp2));
                            bp2 = bp1;
                            in2need_signext = true;
                        else
                            if lt(bp1, bp2)
                                size1 = plus(size1, minus(bp2, bp1));
                                bp1 = bp2;
                                in1need_signext = true;
                            end
                        end
                        sumbp = bp1;
                        [sevtype, sesltype] = hdlgettypesfromsizes(max(size1, size2), sumbp, resultsigned);
                        if true
                            [tempse1, tempse1_ptr] = hdlnewsignal('sub_signext', 'block', -1.0, 0.0, 0.0, sevtype, sesltype);
                            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse1_ptr));
                            hdlbody = horzcat(hdlbody, hdldatatypeassignment(in1, tempse1_ptr, 'floor', 0.0));
                            if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                                hdlbody = hdlbody(1.0:minus(end, 2.0));
                            end
                        else
                            tempse1 = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        end
                        % 119 121
                        if true
                            [tempse2, tempse2_ptr] = hdlnewsignal('sub_signext', 'block', -1.0, 0.0, 0.0, sevtype, sesltype);
                            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempse2_ptr));
                            hdlbody = horzcat(hdlbody, hdldatatypeassignment(in2, tempse2_ptr, 'floor', 0.0));
                            if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                                hdlbody = hdlbody(1.0:minus(end, 2.0));
                            end
                        else
                            tempse2 = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        end
                        % 130 132
                        sumsize = plus(1.0, max(size1, size2));
                        [tempvtype, tempsltype] = hdlgettypesfromsizes(sumsize, sumbp, resultsigned);
                        % 133 135
                        if eq(outsize, sumsize) && eq(outbp, sumbp) && eq(outsigned, resultsigned)
                            hdlbody = horzcat(hdlbody, '  ', assign_prefix, outname, ' ', assign_op, ' ', tempse1, ' - ', tempse2, ';\n\n');
                        else
                            % 137 141
                            % 138 141
                            % 139 141
                            [tempsum, tempsum_ptr] = hdlnewsignal('sub_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
                            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum_ptr));
                            % 142 144
                            hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempsum, ' ', assign_op, ' ', tempse1, ' - ', tempse2, ';\n');
                            % 144 147
                            % 145 147
                            final_result = hdltypeconvert(tempsum, sumsize, sumbp, resultsigned, tempvtype, outsize, outbp, outsigned, outvtype, rounding, saturation);
                            % 147 151
                            % 148 151
                            % 149 151
                            hdlbody = horzcat(hdlbody, '  ', assign_prefix, outname, ' ', assign_op, ' ', final_result, ';\n\n');
                        end
                        % 152 154
                    end
                end
            end
        end
    end
end
