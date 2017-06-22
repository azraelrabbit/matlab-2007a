function [optr, body, signals, tempsigs] = hdlcoeffmultiply(iptr, coeff, coeffptr, name, vtype, sltype, rounding, sat)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    body = '';
    signals = '';
    tempsigs = '';
    % 9 11
    if eq(coeff, 0.0)
        optr = 0.0;
    else
        if eq(coeff, 1.0)
            if hdlgetparameter('bit_true_to_filter')
                [tempname, optr] = hdlnewsignal(name, 'filter', -1.0, 0.0, 0.0, vtype, sltype);
                signals = makehdlsignaldecl(optr);
                body = hdldatatypeassignment(iptr, optr, rounding, sat);
            else
                optr = iptr;
            end % if
        else
            if eq(coeff, -1.0)
                [tempname, optr] = hdlnewsignal(name, 'filter', -1.0, 0.0, 0.0, vtype, sltype);
                signals = makehdlsignaldecl(optr);
                [body, tempsigs] = hdlfilterunaryminus(iptr, optr, rounding, sat);
            else
                if not(strcmpi(vtype, 'real')) && hdlispowerof2(coeff)
                    [tempname, optr] = hdlnewsignal(name, 'filter', -1.0, 0.0, 0.0, vtype, sltype);
                    signals = makehdlsignaldecl(optr);
                    [body, tempsigs] = hdlmultiplypowerof2(iptr, coeff, optr, rounding, sat);
                else
                    if not(strcmpi(vtype, 'real')) && strcmpi(hdlgetparameter('filter_multipliers'), 'csd')
                        [tempname, optr] = hdlnewsignal(name, 'filter', -1.0, 0.0, 0.0, vtype, sltype);
                        signals = makehdlsignaldecl(optr);
                        [body, tempsigs] = hdlfiltermultiplycsd(iptr, coeff, coeffptr, optr, rounding, sat);
                    else
                        if not(strcmpi(vtype, 'real')) && strcmpi(hdlgetparameter('filter_multipliers'), 'factored-csd')
                            [tempname, optr] = hdlnewsignal(name, 'filter', -1.0, 0.0, 0.0, vtype, sltype);
                            signals = makehdlsignaldecl(optr);
                            [body, tempsigs] = hdlfiltermultiplyfactoredcsd(iptr, coeff, coeffptr, optr, rounding, sat);
                        else
                            % 42 44
                            [tempname, optr] = hdlnewsignal(name, 'filter', -1.0, 0.0, 0.0, vtype, sltype);
                            signals = makehdlsignaldecl(optr);
                            [body, tempsigs] = hdlfiltermultiply(iptr, coeffptr, optr, rounding, sat);
                        end % if
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
