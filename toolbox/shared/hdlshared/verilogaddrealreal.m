function [hdlbody, hdlsignals] = verilogaddrealreal(in1, in2, out, rounding, saturation)
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
    end
    % 54 56
    if eq(size1, 0.0)
        if ne(size2, 0.0)
            error(hdlerrormsgid('realwithnonreal'), 'Attempt to add a real and a non-real');
            % 58 60
        end
        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' + ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error(hdlerrormsgid('nonrealwithreal'), 'Attempt to add a real and a non-real');
            end
            [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
            [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
            hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', name1, ' + ', name2, ';\n\n');
        else
            % 72 90
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
                [tempse1, tempse1_ptr] = hdlnewsignal('add_signext', 'block', -1.0, 0.0, 0.0, sevtype, sesltype);
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
                [tempse2, tempse2_ptr] = hdlnewsignal('add_signext', 'block', -1.0, 0.0, 0.0, sevtype, sesltype);
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
            % 133 136
            % 134 136
            if eq(outsize, sumsize) && eq(outbp, sumbp) && eq(outsigned, resultsigned)
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, outname, ' ', assign_op, ' ', tempse1, ' + ', tempse2, ';\n\n');
            else
                % 138 141
                % 139 141
                [tempsum, tempsum_ptr] = hdlnewsignal('add_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
                hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum_ptr));
                % 142 144
                hdlbody = horzcat(hdlbody, '  ', assign_prefix, tempsum, ' ', assign_op, ' ', tempse1, ' + ', tempse2, ';\n');
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
