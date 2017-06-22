function [hdlbody, hdlsignals] = vhdladdrealreal(in1, in2, out, rounding, saturation)
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
            error('Attempt to add a real and a non-real');
        end
        hdlbody = horzcat('  ', outname, ' <= ', name1, ' + ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error('Attempt to add a real and a non-real');
            end
            hdlbody = horzcat('  ', outname, ' <= ', name1, ' + ', name2, ';\n\n');
        else
            if eq(size1, 1.0)
                [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                hdlbody = horzcat('  ', outname, ' <= ', name2, ' + 1 WHEN ', name1, ' = ''1'' ELSE ', name2, ';\n\n');
            else
                if eq(size2, 1.0)
                    [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                    hdlbody = horzcat('  ', outname, ' <= ', name1, ' + 1 WHEN ', name2, ' = ''1'' ELSE ', name1, ';\n\n');
                else
                    if eq(outsize, 1.0)
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 78 80
                        hdlbody = horzcat('  ', outname, ' <= ''1'' WHEN ', name1, ' /= 0', ' AND ', name2, ' /= 0', ' ELSE ''0'';\n\n');
                    else
                        % 81 84
                        % 82 84
                        % 83 89
                        % 84 89
                        % 85 89
                        % 86 89
                        % 87 89
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
                        sumbp = bp1;
                        sumsize = plus(1.0, max(size1, size2));
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 103 105
                        name1 = horzcat('resize(', name1, ', ', num2str(sumsize), ')');
                        size1 = sumsize;
                        name2 = horzcat('resize(', name2, ', ', num2str(sumsize), ')');
                        size2 = sumsize;
                        % 108 110
                        [tempvtype, tempsltype] = hdlgettypesfromsizes(sumsize, sumbp, resultsigned);
                        % 110 112
                        if eq(outsize, sumsize) && eq(outbp, sumbp) && eq(outsigned, resultsigned)
                            hdlbody = horzcat(hdlbody, '  ', outname, ' <= ', name1, ' + ', name2, ';\n\n');
                        else
                            % 114 116
                            [tempsum, tempsum_ptr] = hdlnewsignal('add_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
                            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempsum_ptr));
                            % 117 119
                            hdlbody = horzcat(hdlbody, '  ', tempsum, ' <= ', name1, ' + ', name2, ';\n');
                            % 119 121
                            final_result = hdltypeconvert(tempsum, sumsize, sumbp, resultsigned, tempvtype, outsize, outbp, outsigned, outvtype, rounding, saturation);
                            % 121 125
                            % 122 125
                            % 123 125
                            hdlbody = horzcat(hdlbody, '  ', outname, ' <= ', final_result, ';\n\n');
                        end
                        % 126 128
                    end
                end
            end
        end
    end
end
