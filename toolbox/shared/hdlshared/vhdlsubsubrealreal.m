function [hdlbody, hdlsignals] = vhdlsubsubrealreal(in1, in2, out, rounding, saturation)
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
            error('Attempt to add a real and a non-real');
        end % if
        hdlbody = horzcat('  ', outname, ' <= -', name1, ' - ', name2, ';\n\n');
    else
        if eq(size2, 0.0)
            if ne(size1, 0.0)
                error('Attempt to add a real and a non-real');
            end % if
            hdlbody = horzcat('  ', outname, ' <= -', name1, ' - ', name2, ';\n\n');
        else
            if eq(size1, 1.0)
                % 68 70
                error('hdlcoder:bitmath', 'Error: cannot do arithmetic on one bit signals');
            else
                if eq(size2, 1.0)
                    % 72 75
                    % 73 75
                    error('hdlcoder:bitmath', 'Error: cannot do arithmetic on one bit signals');
                else
                    if eq(outsize, 1.0)
                        % 77 83
                        % 78 83
                        % 79 83
                        % 80 83
                        % 81 83
                        error('hdlcoder:bitmath', 'Error: cannot do arithmetic on one bit signals');
                    else
                        % 84 86
                        [tempunary, tempunary_ptr] = hdlnewsignal('subsub_temp', 'block', -1.0, 0.0, 0.0, outvtype, outsltype);
                        hdlsignals = horzcat(hdlsignals, makehdlsignaldecl(tempunary_ptr));
                        % 87 89
                        [tempbody, tempsigs] = hdlunaryminus(in1, tempunary_ptr, rounding, saturation);
                        hdlsignals = horzcat(hdlsignals, tempsigs);
                        hdlbody = horzcat(hdlbody, tempbody);
                        % 91 93
                        [tempbody, tempsigs] = hdlsub(tempunary_ptr, in2, out, rounding, saturation);
                        hdlsignals = horzcat(hdlsignals, tempsigs);
                        hdlbody = horzcat(hdlbody, tempbody);
                        % 95 97
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
