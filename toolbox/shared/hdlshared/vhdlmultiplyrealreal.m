function [hdlbody, hdlsignals] = vhdlmultiplyrealreal(in1, in2, out, rounding, saturation)
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
    end % if
    % 54 56
    if eq(size1, 0.0)
        if ne(size2, 0.0)
            error('Attempt to multiply a real by a non-real');
        end % if
        hdlbody = horzcat('  ', outname, ' <= ', name1, ' * ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error('Attempt to multiply a real by a non-real');
            end % if
            hdlbody = horzcat('  ', outname, ' <= ', name1, ' * ', name2, ';\n\n');
        else
            if eq(size1, 1.0)
                if eq(size2, 1.0)
                    zeroresult = '''0''';
                else
                    zeroresult = '(OTHERS => ''0'')';
                end % if
                [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                hdlbody = horzcat('  ', outname, ' <= ', name2, ' WHEN ', name1, ' = ''1''', ' ELSE ', zeroresult, ';\n\n');
            else
                if eq(size2, 1.0)
                    if eq(size1, 1.0)
                        zeroresult = '''0''';
                    else
                        zeroresult = '(OTHERS => ''0'')';
                    end % if
                    [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                    hdlbody = horzcat('  ', outname, ' <= ', name1, ' WHEN ', name2, ' = ''1''', ' ELSE ', zeroresult, ';\n\n');
                else
                    if eq(outsize, 1.0)
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 88 90
                        hdlbody = horzcat('  ', outname, ' <= ''1'' WHEN ', name1, ' /= 0', ' AND ', name2, ' /= 0', ' ELSE ''0'';\n\n');
                    else
                        % 91 93
                        % 92 94
                        [name1, size1] = hdlsignaltypeconvert(name1, size1, signed1, vtype1, resultsigned);
                        [name2, size2] = hdlsignaltypeconvert(name2, size2, signed2, vtype2, resultsigned);
                        % 95 97
                        prodsize = plus(size1, size2);
                        prodbp = plus(bp1, bp2);
                        % 98 100
                        if ne(prodsize, outsize) || ne(prodbp, outbp) || ne(resultsigned, outsigned)
                            [tempvtype, tempsltype] = hdlgettypesfromsizes(prodsize, prodbp, resultsigned);
                            % 101 103
                            [tempprod, tempprod_ptr] = hdlnewsignal('mul_temp', 'block', -1.0, 0.0, 0.0, tempvtype, tempsltype);
                            hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempprod_ptr));
                            % 104 106
                            hdlbody = horzcat(hdlbody, '  ', tempprod, ' <= ', name1, ' * ', name2, ';\n');
                            % 106 108
                            hdlbody = horzcat(hdlbody, hdldatatypeassignment(tempprod_ptr, out, rounding, saturation));
                            if strcmp(hdlbody(minus(end, 3.0):end), '\n\n')
                                hdlbody = hdlbody(1.0:minus(end, 2.0));
                            end % if
                        else
                            % 112 114
                            hdlbody = horzcat(hdlbody, '  ', outname, ' <= ', name1, ' * ', name2, ';\n');
                        end % if
                        % 115 117
                        hdlbody = horzcat(hdlbody, '\n');
                        % 117 119
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
