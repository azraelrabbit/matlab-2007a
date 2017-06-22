function hdlbody = hdldatatypeassignment(in, out, rounding, saturation, label)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    % 7 9
    inname = hdlsignalname(in);
    inhandle = hdlsignalhandle(in);
    invector = hdlsignalvector(in);
    incomplex = hdlsignalcomplex(in);
    invtype = hdlsignalvtype(in);
    insltype = hdlsignalsltype(in);
    [insize, inbp, insigned] = hdlwordsize(insltype);
    if hdlgetparameter('isvhdl')
        inputisslv = vhdlisstdlogicvector(in);
    else
        inputisslv = false;
    end % if
    % 20 23
    % 21 23
    outname = hdlsignalname(out);
    outhandle = hdlsignalhandle(out);
    outvector = hdlsignalvector(out);
    outcomplex = hdlsignalcomplex(out);
    outvtype = hdlsignalvtype(out);
    outsltype = hdlsignalsltype(out);
    [outsize, outbp, outsigned] = hdlwordsize(outsltype);
    % 29 31
    if eq(incomplex, 1.0)
        inname_c = hdlsignalname(hdlsignalimag(in));
        outname_c = hdlsignalname(hdlsignalimag(out));
    end % if
    % 34 36
    if eq(nargin, 4.0)
        isloop = 0.0;
        genlabel = horzcat(outname, hdlgetparameter('block_generate_label'));
    else
        if isempty(label)
            isloop = 1.0;
            genlabel = '';
        else
            isloop = 0.0;
            genlabel = label;
        end % if
    end % if
    hdlbody = '';
    array_deref = hdlgetparameter('array_deref');
    if not(all(eq(invector, 0.0)))
        if eq(hdlgetparameter('loop_unrolling'), 1.0)
            for n=0.0:minus(max(invector), 1.0)
                idx = horzcat(array_deref(1.0), num2str(n), array_deref(2.0));
                hdlbody = horzcat(hdlbody, datatypebit(horzcat(inname, idx), insize, inbp, insigned, invtype, inputisslv, horzcat(outname, idx), outsize, outbp, outsigned, outvtype, rounding, saturation, assign_prefix, assign_op));
                % 54 57
                % 55 57
                if eq(incomplex, 1.0)
                    hdlbody = horzcat(hdlbody, datatypebit(horzcat(inname_c, idx), insize, inbp, insigned, invtype, inputisslv, horzcat(outname_c, idx), outsize, outbp, outsigned, outvtype, rounding, saturation, assign_prefix, assign_op));
                    % 58 62
                    % 59 62
                    % 60 62
                end % if
            end % for
            hdlbody = horzcat(hdlbody, '\n');
        else
            % 65 67
            idx = 'k';
            loopcount = num2str(minus(max(invector), 1.0));
            if isloop
                hdlbody = horzcat('  FOR k IN 0 TO ', loopcount, ' LOOP\n');
            else
                hdlbody = horzcat('  ', genlabel, ':FOR k IN 0 TO ', loopcount, ' GENERATE\n');
            end % if
            % 73 75
            hdlbody = horzcat(hdlbody, '  ', datatypebit(horzcat(inname, '(', idx, ')'), insize, inbp, insigned, invtype, inputisslv, horzcat(outname, '(', idx, ')'), outsize, outbp, outsigned, outvtype, rounding, saturation, assign_prefix, assign_op));
            % 75 79
            % 76 79
            % 77 79
            if eq(incomplex, 1.0)
                hdlbody = horzcat(hdlbody, '  ', datatypebit(horzcat(inname_c, '(', idx, ')'), insize, inbp, insigned, invtype, inputisslv, horzcat(outname_c, '(', idx, ')'), outsize, outbp, outsigned, outvtype, rounding, saturation, assign_prefix, assign_op));
                % 80 84
                % 81 84
                % 82 84
            end % if
            if isloop
                hdlbody = horzcat(hdlbody, '  END LOOP;\n\n');
            else
                hdlbody = horzcat(hdlbody, '  END GENERATE;\n\n');
            end % if
        end % if
    else
        hdlbody = horzcat(hdlbody, datatypebit(inname, insize, inbp, insigned, invtype, inputisslv, outname, outsize, outbp, outsigned, outvtype, rounding, saturation, assign_prefix, assign_op));
        % 92 96
        % 93 96
        % 94 96
        if eq(incomplex, 1.0)
            hdlbody = horzcat(hdlbody, datatypebit(inname_c, insize, inbp, insigned, invtype, inputisslv, outname_c, outsize, outbp, outsigned, outvtype, rounding, saturation, assign_prefix, assign_op));
            % 97 101
            % 98 101
            % 99 101
        end % if
        hdlbody = horzcat(hdlbody, '\n');
    end % if
end % function
function [begstr, endstr] = hdltoreal
    % 105 107
    if hdlgetparameter('isvhdl')
        begstr = 'REAL(TO_INTEGER(';
        endstr = '))';
    else
        begstr = '$itor(';
        endstr = ')';
    end % if
end % function
function [begstr, endstr] = hdlfromreal(outsize, outbp, outsigned)
    % 115 117
    if hdlgetparameter('isvhdl')
        lang = 'VHDL';
        if outsigned
            begstr = 'TO_SIGNED(INTEGER(';
        else
            begstr = 'TO_UNSIGNED(INTEGER(';
        end % if
        if lt(outbp, 0.0)
            endstr = horzcat('/(2.0**', num2str(mtimes(-1.0, outbp)), ')', '), ', num2str(outsize), ')');
        else
            endstr = horzcat('*(2.0**', num2str(outbp), ')', '), ', num2str(outsize), ')');
        end % if
    else
        begstr = '$rtoi(';
        if lt(outbp, 0.0)
            endstr = horzcat('/(2**', num2str(mtimes(-1.0, outbp)), '))');
        else
            endstr = horzcat(' * (2**', num2str(outbp), '))');
        end % if
        lang = 'Verilog';
    end % if
    % 137 139
    if gt(outbp, 31.0)
        % 139 143
        % 140 143
        % 141 143
        warning(hdlcodererrormsgid('HDLIntegerOverflow'), 'Conversion from double to sfix with a binary point greater than 31 might cause loss of precision in the HDL simulator and a mismatch in expected and actual results.');
        % 143 146
        % 144 146
    end % if
end % function
function hdlbody = datatypebit(inname, insize, inbp, insigned, invtype, inputisslv, outname, outsize, outbp, outsigned, outvtype, rounding, saturation, assign_prefix, assign_op)
    % 148 155
    % 149 155
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    if eq(outsize, 0.0) && eq(insize, 0.0)
        [inname, insize] = hdlsignaltypeconvert(inname, insize, insigned, invtype, 0.0);
        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', inname, ';\n\n');
    else
        % 158 160
        if eq(outsize, 0.0)
            [st, ts] = hdltoreal;
            % 161 163
            [inname, insize] = hdlsignaltypeconvert(inname, insize, insigned, invtype, 1.0);
            if hdlgetparameter('isvhdl')
                if lt(inbp, 0.0)
                    hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', st, inname, ts, '*(2.0**', num2str(mtimes(-1.0, inbp)), ')', ';\n\n');
                else
                    % 167 169
                    hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', st, inname, ts, '/(2.0**', num2str(inbp), ')', ';\n\n');
                    % 169 171
                end % if
            else
                if not(insigned)
                    if lt(inbp, 0.0)
                        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', inname, ts, '*(2**', num2str(mtimes(-1.0, inbp)), ');\n');
                    else
                        % 176 178
                        hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', inname, ts, '/(2**', num2str(inbp), ');\n');
                        % 178 180
                    end % if
                else
                    if gt(insize, 2.0)
                        ip_sign_bit = horzcat(inname, '[', num2str(minus(insize, 1.0)), ']');
                        ip_no_sign_bit = horzcat(inname, '[', num2str(minus(insize, 2.0)), ':0]');
                    else
                        ip_sign_bit = inname;
                        ip_no_sign_bit = inname;
                    end % if
                    % 188 190
                    if gt(insize, inbp)
                        lval_base2 = minus(minus(insize, inbp), 1.0);
                    else
                        lval_base2 = 0.0;
                    end % if
                    % 194 197
                    % 195 197
                    if lt(inbp, 0.0)
                        bp_hdlbody = horzcat('*(2**', num2str(mtimes(-1.0, inbp)), ')');
                    else
                        bp_hdlbody = horzcat('/(2**', num2str(inbp), ')');
                    end % if
                    % 201 204
                    % 202 204
                    hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' (', st, ip_no_sign_bit, ts, bp_hdlbody, ') - ', '((2**', num2str(lval_base2), ') * ', ip_sign_bit, ');\n');
                    % 204 207
                    % 205 207
                end % if
            end % if
        else
            if eq(insize, 0.0)
                [st, ts] = hdlfromreal(outsize, outbp, outsigned);
                [inname, insize] = hdlsignaltypeconvert(inname, insize, insigned, invtype, 0.0);
                hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', st, inname, ts, ';\n\n');
            else
                % 214 216
                % 215 217
                [inname, insize] = hdlsignaltypeconvert(inname, insize, insigned, invtype, outsigned, inputisslv);
                % 217 219
                if hdlgetparameter('isvhdl') && eq(insize, 1.0) && ne(outsize, 1.0)
                    inname = horzcat('"0" & ', inname);
                end % if
                % 221 223
                if inputisslv
                    % 223 225
                    invtype = hdlgetporttypesfromsizes(insize, inbp, insigned);
                end % if
                % 226 228
                final_result = hdltypeconvert(inname, insize, inbp, insigned, invtype, outsize, outbp, outsigned, outvtype, rounding, saturation);
                % 228 232
                % 229 232
                % 230 232
                hdlbody = horzcat('  ', assign_prefix, outname, ' ', assign_op, ' ', final_result, ';\n');
                % 232 235
                % 233 235
            end % if
        end % if
    end % if
end % function
