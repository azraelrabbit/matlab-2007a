function [hdlbody, hdlsignals] = vhdlsubsubrealrealbittrue(in1, in2, out, rounding, saturation)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    hdlbody = '';
    hdlsignals = '';
    % 11 14
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
            error('hdlcoder:realmath', 'Attempt to add a real and a non-real');
        end
        hdlbody = horzcat('  ', outname, ' <= -', name1, ' - ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error('hdlcoder:realmath', 'Attempt to add a real and a non-real');
            end
            hdlbody = horzcat('  ', outname, ' <= -', name1, ' - ', name2, ';\n\n');
        else
            if eq(size1, 1.0)
                % 68 70
                error('hdlcoder:bitmath', 'Error: cannot do arithmetic on one bit signals');
            else
                if eq(size2, 1.0)
                    % 72 76
                    % 73 76
                    % 74 76
                    error('hdlcoder:bitmath', 'Error: cannot do arithmetic on one bit signals');
                else
                    if eq(outsize, 1.0)
                        % 78 84
                        % 79 84
                        % 80 84
                        % 81 84
                        % 82 84
                        error('hdlcoder:bitmath', 'Error: cannot do arithmetic to a one bit output signal');
                    else
                        % 85 90
                        % 86 90
                        % 87 90
                        % 88 90
                        if gt(bp1, bp2)
                            name2 = horzcat(name2, ' & ', vhdlnzeros(minus(bp1, bp2)));
                            size2 = plus(size2, minus(bp1, bp2));
                            bp2 = bp1;
                        else
                            if lt(bp1, bp2)
                                name1 = horzcat(name1, ' & ', vhdlnzeros(minus(bp2, bp1)));
                                size1 = plus(size1, minus(bp2, bp1));
                                bp1 = bp2;
                            end
                        end
                        sumbp = outbp;
                        sumsize = plus(outsize, 1.0);
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 104 106
                        name1 = horzcat('resize(', name1, ', ', num2str(sumsize), ')');
                        size1 = sumsize;
                        name2 = horzcat('resize(', name2, ', ', num2str(sumsize), ')');
                        size2 = sumsize;
                        % 109 111
                        [tempvtype, tempsltype] = hdlgettypesfromsizes(sumsize, sumbp, resultsigned);
                        % 111 114
                        % 112 114
                        [tempsum1, tempsum1_ptr] = hdlnewsignal('add_temp', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                        [tempsum2, tempsum2_ptr] = hdlnewsignal('add_temp', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                        [tempsum3, tempsum3_ptr] = hdlnewsignal('add_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
                        [tempsum4, tempsum4_ptr] = hdlnewsignal('add_temp', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum1_ptr));
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum2_ptr));
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum3_ptr));
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum4_ptr));
                        % 121 123
                        first_operand = hdltypeconvert(name1, size1, bp1, resultsigned, vtype1, outsize, outbp, resultsigned, outvtype, rounding, saturation);
                        % 123 127
                        % 124 127
                        % 125 127
                        second_operand = hdltypeconvert(name2, size2, bp2, resultsigned, vtype2, outsize, outbp, resultsigned, outvtype, rounding, saturation);
                        % 127 131
                        % 128 131
                        % 129 131
                        rounded_temp = hdltypeconvert(tempsum3, sumsize, sumbp, resultsigned, tempvtype, outsize, outbp, outsigned, outvtype, rounding, 0.0);
                        % 131 135
                        % 132 135
                        % 133 135
                        if eq(saturation, 0.0)
                            saturate_temp = tempsum4;
                        else
                            saturate_temp = hdlsaturate(tempsum3, sumsize, sumbp, resultsigned, tempvtype, outsize, outbp, outsigned, outvtype, '', saturation, tempsum4);
                            % 138 141
                            % 139 141
                        end
                        % 141 143
                        hdlbody = horzcat(hdlbody, '  ', tempsum1, ' <= ', first_operand, ';\n');
                        hdlbody = horzcat(hdlbody, '  ', tempsum2, ' <= ', second_operand, ';\n');
                        hdlbody = horzcat(hdlbody, '  ', tempsum3, ' <= -resize(', tempsum1, ', ', num2str(sumsize), ')', ' - resize(', tempsum2, ', ', num2str(sumsize), ');\n');
                        % 145 147
                        hdlbody = horzcat(hdlbody, '  ', tempsum4, ' <= ', rounded_temp, ';\n');
                        hdlbody = horzcat(hdlbody, '  ', outname, ' <= ', saturate_temp, ';\n\n');
                        % 148 152
                        % 149 152
                        % 150 152
                    end
                end
            end
        end
    end
end
