function [hdlbody, hdlsignals] = hdladd(in1, in2, out, rounding, saturation)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if ne(length(in1), 1.0) || ne(length(in2), 1.0)
        error('Array inputs to hdladd are not handled yet!');
    end
    % 12 14
    if hdlgetparameter('isvhdl')
        if eq(hdlsignalcomplex(in1), 1.0) && eq(hdlsignalcomplex(in2), 1.0)
            [hdlbody, hdlsignals] = vhdladdcomplexcomplex(in1, in2, out, rounding, saturation);
        else
            if eq(hdlsignalcomplex(in1), 1.0)
                [hdlbody, hdlsignals] = vhdladdcomplexreal(in1, in2, out, rounding, saturation);
            else
                if eq(hdlsignalcomplex(in2), 1.0)
                    [hdlbody, hdlsignals] = vhdladdcomplexreal(in2, in1, out, rounding, saturation);
                else
                    if eq(hdlgetparameter('cast_before_sum'), 1.0)
                        [hdlbody, hdlsignals] = vhdladdrealrealbittrue(in1, in2, out, rounding, saturation);
                    else
                        [hdlbody, hdlsignals] = vhdladdrealreal(in1, in2, out, rounding, saturation);
                    end
                end
            end
        end
    else
        if hdlgetparameter('isverilog')
            if eq(hdlsignalcomplex(in1), 1.0) && eq(hdlsignalcomplex(in2), 1.0)
                [hdlbody, hdlsignals] = verilogaddcomplexcomplex(in1, in2, out, rounding, saturation);
            else
                if eq(hdlsignalcomplex(in1), 1.0)
                    [hdlbody, hdlsignals] = verilogaddcomplexreal(in1, in2, out, rounding, saturation);
                else
                    if eq(hdlsignalcomplex(in2), 1.0)
                        [hdlbody, hdlsignals] = verilogaddcomplexreal(in2, in1, out, rounding, saturation);
                    else
                        if eq(hdlgetparameter('cast_before_sum'), 1.0)
                            [hdlbody, hdlsignals] = verilogaddrealrealbittrue(in1, in2, out, rounding, saturation);
                        else
                            [hdlbody, hdlsignals] = verilogaddrealreal(in1, in2, out, rounding, saturation);
                        end
                    end
                end
            end
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end
    end
end
