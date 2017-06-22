function pirtype = dtconvertsl2pir(dt)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    switch dt
    case ''
        error('No data-type found');
    case 'single'
        pirtype = pir_double_t;
    case 'double'
        pirtype = pir_double_t;
    case 'boolean'
        pirtype = pir_boolean_t;
    case 'int8'
        pirtype = pir_signed_t(8.0);
    case 'uint8'
        pirtype = pir_unsigned_t(8.0);
    case 'int16'
        pirtype = pir_signed_t(16.0);
    case 'uint16'
        pirtype = pir_unsigned_t(16.0);
    case 'int32'
        pirtype = pir_signed_t(32.0);
    case 'uint32'
        pirtype = pir_unsigned_t(32.0);
    otherwise
        if strcmpi(dt(1.0:4.0), 'sfix')
            underpos = strfind(dt, '_');
            if isempty(underpos)
                underpos = plus(length(dt), 1.0);
            end
            wlen = strread(dt(5.0:minus(underpos, 1.0)), '%u');
            if eq(underpos, plus(length(dt), 1.0))
                pirtype = pir_sfixpt_t(wlen, 0.0);
            else
                if strcmpi(dt(plus(underpos, 1.0)), 'e')
                    if strcmpi(dt(plus(underpos, 2.0)), 'n')
                        flen = strread(dt(plus(underpos, 3.0):end));
                        pirtype = pir_sfixpt_t(wlen, minus(0.0, flen));
                    else
                        % 46 48
                        flen = strread(dt(plus(underpos, 2.0):end));
                        pirtype = pir_sfixpt_t(wlen, flen);
                    end
                else
                    warning('****** Unhandled simulink sfix datatype %s ******', dt);
                    pirtype = pir_sfixpt_t(32.0, 0.0);
                    % 53 55
                end
            end
        else
            if strcmp(dt(1.0:4.0), 'ufix')
                underpos = strfind(dt, '_');
                if isempty(underpos)
                    underpos = plus(length(dt), 1.0);
                end
                wlen = strread(dt(5.0:minus(underpos, 1.0)), '%u');
                if eq(underpos, plus(length(dt), 1.0))
                    pirtype = pir_ufixpt_t(wlen, 0.0);
                else
                    if strcmpi(dt(plus(underpos, 1.0)), 'e')
                        if strcmpi(dt(plus(underpos, 2.0)), 'n')
                            flen = strread(dt(plus(underpos, 3.0):end));
                            pirtype = pir_ufixpt_t(wlen, minus(0.0, flen));
                        else
                            flen = strread(dt(plus(underpos, 2.0):end));
                            pirtype = pir_ufixpt_t(wlen, flen);
                        end
                    else
                        warning('****** Unhandled simulink ufix datatype %s ******', dt);
                        pirtype = pir_ufixpt_t(32.0, 0.0);
                    end
                end
            else
                error('Unknown data-type %s', dt);
            end
        end
    end
end
