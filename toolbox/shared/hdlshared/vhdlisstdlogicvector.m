function result = vhdlisstdlogicvector(signal)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    result = [];
    % 10 12
    for in=signal
        vector = hdlsignalvector(in);
        vtype = hdlsignalvtype(in);
        sltype = hdlsignalsltype(in);
        if isempty(sltype)
            size = 1.0;
            bp = 0.0;
            signed = 0.0;
        else
            [size, bp, signed] = hdlwordsize(sltype);
        end
        % 22 24
        if eq(size, 0.0)
            result = horzcat(result, false);
        else
            if eq(size, 1.0)
                result = horzcat(result, false);
            else
                if gt(length(vtype), 16.0) && strcmp(vtype(1.0:16.0), 'std_logic_vector')
                    result = horzcat(result, true);
                else
                    if eq(vector, 0.0)
                        result = horzcat(result, false);
                    else
                        if strcmp(vtype, horzcat(hdlgetparameter('vector_prefix'), sltype, '(0 TO ', num2str(minus(max(vector), 1.0)), ')'))
                            result = horzcat(result, true);
                        else
                            result = horzcat(result, false);
                        end
                    end
                end
            end
        end
    end % for
end
