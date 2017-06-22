function result = hdlconcatnzeros(name, n, signed)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if eq(nargin, 3.0) && hdlgetparameter('isverilog')
        addsign = signed;
    else
        addsign = false;
    end
    % 11 13
    if eq(n, 0.0)
        result = name;
        addsign = false;
    else
        if eq(n, 1.0)
            if hdlgetparameter('isvhdl')
                result = horzcat(name, ' & ''0''');
            else
                if hdlgetparameter('isverilog')
                    result = horzcat('{', name, ', 1''b0}');
                end
            end
        else
            if hdlgetparameter('isvhdl')
                if hdlgetparameter('safe_zero_concat')
                    result = horzcat(name, ' & ', sprintf('''%d'' & ', zeros(1.0, minus(n, 1.0))));
                    result = horzcat(result, '''0''');
                else
                    result = horzcat(name, ' & ', '"', sprintf('%d', zeros(1.0, n)), '"');
                end
            else
                if hdlgetparameter('isverilog')
                    result = sprintf('{%s, %d''b%s}', name, n, sprintf('%d', zeros(1.0, n)));
                end
            end
        end
    end
    if addsign
        result = horzcat('$signed(', result, ')');
    end
end
