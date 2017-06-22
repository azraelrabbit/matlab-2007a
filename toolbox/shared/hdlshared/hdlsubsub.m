function [hdlbody, hdlsignals] = hdlsubsub(in1, in2, out, rounding, saturation)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if ne(length(in1), 1.0) || ne(length(in2), 1.0)
        error(hdlerrormsgid('notsupported'), 'Array inputs to hdlsubsub are not handled yet!');
        % 9 11
    end
    % 11 13
    if hdlgetparameter('isvhdl')
        if eq(hdlsignalcomplex(in1), 1.0) && eq(hdlsignalcomplex(in2), 1.0)
            [hdlbody, hdlsignals] = vhdlsubsubcomplexcomplex(in1, in2, out, rounding, saturation);
        else
            if eq(hdlsignalcomplex(in1), 1.0)
                [hdlbody, hdlsignals] = vhdlsubsubcomplexreal(in1, in2, out, rounding, saturation);
            else
                if eq(hdlsignalcomplex(in2), 1.0)
                    [hdlbody, hdlsignals] = vhdlsubsubcomplexreal(in2, in1, out, rounding, saturation);
                else
                    if eq(hdlgetparameter('cast_before_sum'), 1.0)
                        [hdlbody, hdlsignals] = vhdlsubsubrealrealbittrue(in1, in2, out, rounding, saturation);
                    else
                        [hdlbody, hdlsignals] = vhdlsubsubrealreal(in1, in2, out, rounding, saturation);
                    end
                end
            end
        end
    else
        if hdlgetparameter('isverilog')
            if eq(hdlsignalcomplex(in1), 1.0) && eq(hdlsignalcomplex(in2), 1.0)
                [hdlbody, hdlsignals] = verilogsubsubcomplexcomplex(in1, in2, out, rounding, saturation);
            else
                if eq(hdlsignalcomplex(in1), 1.0)
                    [hdlbody, hdlsignals] = verilogsubsubcomplexreal(in1, in2, out, rounding, saturation);
                else
                    if eq(hdlsignalcomplex(in2), 1.0)
                        [hdlbody, hdlsignals] = verilogsubsubcomplexreal(in2, in1, out, rounding, saturation);
                    else
                        if eq(hdlgetparameter('cast_before_sum'), 1.0)
                            [hdlbody, hdlsignals] = verilogsubsubrealrealbittrue(in1, in2, out, rounding, saturation);
                        else
                            [hdlbody, hdlsignals] = verilogsubsubrealreal(in1, in2, out, rounding, saturation);
                        end
                    end
                end
            end
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end
    end
end
