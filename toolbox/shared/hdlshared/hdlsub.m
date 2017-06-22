function [hdlbody, hdlsignals] = hdlsub(in1, in2, out, rounding, saturation)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if ne(length(in1), 1.0) || ne(length(in2), 1.0)
        error(hdlerrormsgid('notsupported'), 'Array inputs to hdlsub are not handled yet!');
        % 10 12
    end
    % 12 14
    if hdlgetparameter('isvhdl')
        if eq(hdlsignalcomplex(in1), 1.0) && eq(hdlsignalcomplex(in2), 1.0)
            [hdlbody, hdlsignals] = vhdlsubcomplexcomplex(in1, in2, out, rounding, saturation);
        else
            if eq(hdlsignalcomplex(in1), 1.0)
                [hdlbody, hdlsignals] = vhdlsubcomplexreal(in1, in2, out, rounding, saturation);
            else
                if eq(hdlsignalcomplex(in2), 1.0)
                    [hdlbody, hdlsignals] = vhdlsubcomplexreal(in2, in1, out, rounding, saturation);
                else
                    if eq(hdlgetparameter('cast_before_sum'), 1.0)
                        [hdlbody, hdlsignals] = vhdlsubrealrealbittrue(in1, in2, out, rounding, saturation);
                    else
                        [hdlbody, hdlsignals] = vhdlsubrealreal(in1, in2, out, rounding, saturation);
                    end
                end
            end
        end
    else
        if hdlgetparameter('isverilog')
            if eq(hdlsignalcomplex(in1), 1.0) && eq(hdlsignalcomplex(in2), 1.0)
                [hdlbody, hdlsignals] = verilogsubcomplexcomplex(in1, in2, out, rounding, saturation);
            else
                if eq(hdlsignalcomplex(in1), 1.0)
                    [hdlbody, hdlsignals] = verilogsubcomplexreal(in1, in2, out, rounding, saturation);
                else
                    if eq(hdlsignalcomplex(in2), 1.0)
                        [hdlbody, hdlsignals] = verilogsubcomplexreal(in2, in1, out, rounding, saturation);
                    else
                        if eq(hdlgetparameter('cast_before_sum'), 1.0)
                            [hdlbody, hdlsignals] = verilogsubrealrealbittrue(in1, in2, out, rounding, saturation);
                        else
                            [hdlbody, hdlsignals] = verilogsubrealreal(in1, in2, out, rounding, saturation);
                        end
                    end
                end
            end
        else
            error(hdlerrormsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end
    end
end
