function [vtype, vsize, vbp, vsigned, sltype] = verilogporttypefromquantizer(quantizerobj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch mode(quantizerobj)
    case 'fixed'
        [vsize, vbp] = format(quantizerobj);
        vsigned = 1.0;
        if gt(vsize, 1.0)
            vtype = horzcat('wire signed [', num2str(minus(vsize, 1.0)), ':0]');
        else
            vtype = 'wire';
        end % if
    case 'ufixed'
        [vsize, vbp] = format(quantizerobj);
        vsigned = 0.0;
        if gt(vsize, 1.0)
            vtype = horzcat('wire [', num2str(minus(vsize, 1.0)), ':0]');
        else
            vtype = 'wire';
        end % if
    case 'float'
        error(generatemsgid('quantizernotsupported'), 'Format float is not supported; only fixed, ufixed, and double types are supported.');
    case 'double'
        % 26 28
        vsize = 0.0;
        vbp = 0.0;
        vsigned = 1.0;
        vtype = 'wire [63:0]';
    case 'single'
        error(generatemsgid('quantizernotsupported'), 'Format single is not supported; only fixed, ufixed, and double types are supported.');
    case 'none'
        % 34 36
        error(generatemsgid('quantizernotsupported'), 'Format none is not supported; only fixed, ufixed, and double types are supported.');
    otherwise
        % 37 42
        % 38 42
        % 39 42
        % 40 42
        % 41 43
        error(generatemsgid('quantizernotsupported'), 'Format %s is not supported; only fixed, ufixed, and double types are supported.', mode(quantizerobj));
        % 43 46
        % 44 46
    end % switch
    % 46 49
    % 47 49
    sltype = '';
    if eq(vsize, -1.0)
        sltype = 'pass';
    else
        if eq(vsize, 0.0)
            sltype = 'double';
        else
            if eq(vsigned, 1.0)
                base = 'sfix';
            else
                base = 'ufix';
            end % if
            if eq(vbp, 0.0)
                sltype = horzcat(base, num2str(vsize));
            else
                if lt(vbp, 0.0)
                    sltype = horzcat(base, num2str(vsize), '_E', num2str(uminus(vbp)));
                else
                    sltype = horzcat(base, num2str(vsize), '_En', num2str(vbp));
                end % if
            end % if
        end % if
    end % if
