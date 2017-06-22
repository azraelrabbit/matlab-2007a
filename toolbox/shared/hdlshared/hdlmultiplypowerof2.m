function [hdlbody, hdlsignals] = hdlmultiplypowerof2(in1, powerof2, out, rounding, saturation)
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
    outname = hdlsignalname(out);
    outhandle = hdlsignalhandle(out);
    outvector = hdlsignalvector(out);
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 27 29
    if not(hdlispowerof2(powerof2))
        error('hdlmultiplypowerof2 called with non-power of 2 argument %s', num2str(powerof2));
    else
        if eq(size1, 0.0)
            error('hdlmultiplypowerof2 called with a real input %s', name1);
        else
            if eq(size1, 1.0)
                error('hdlmultiplypowerof2 called with a boolean input %s', name1);
            end
        end
    end
    shift_amount = log2(abs(powerof2));
    [newname, newsize] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, outsigned);
    newbp = minus(bp1, shift_amount);
    [newvtype, newsltype] = hdlgettypesfromsizes(newsize, newbp, signed1);
    % 43 67
    % 44 67
    % 45 67
    % 46 67
    % 47 67
    % 48 67
    % 49 67
    % 50 67
    % 51 67
    % 52 67
    % 53 67
    % 54 67
    % 55 67
    % 56 67
    % 57 67
    % 58 67
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    if lt(powerof2, 0.0)
        [minusvtype, minussltype] = hdlgettypesfromsizes(plus(newsize, 1.0), bp1, signed1);
        [tempminus, tempminus_ptr] = hdlnewsignal('mulpwr2_temp', 'block', -1.0, 0.0, 0.0, minusvtype, minussltype);
        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempminus_ptr));
        [tempbody, tempsignals] = hdlunaryminus(in1, tempminus_ptr, rounding, saturation);
        hdlbody = horzcat(hdlbody, tempbody);
        hdlsignals = horzcat(hdlsignals, tempsignals);
        % 73 75
        final_result = hdltypeconvert(tempminus, plus(newsize, 1.0), newbp, outsigned, minusvtype, outsize, outbp, outsigned, outvtype, rounding, saturation);
        % 75 78
        % 76 78
        hdlbody = horzcat(hdlbody, '  ', assign_prefix, outname, ' ', assign_op, ' ', final_result, ';\n\n');
    else
        % 79 81
        final_result = hdltypeconvert(newname, newsize, newbp, outsigned, newvtype, outsize, outbp, outsigned, outvtype, rounding, saturation);
        % 81 84
        % 82 84
        if not(strcmpi(outname, final_result))
            hdlbody = horzcat(hdlbody, '  ', assign_prefix, outname, ' ', assign_op, ' ', final_result, ';\n\n');
        end
    end
end
