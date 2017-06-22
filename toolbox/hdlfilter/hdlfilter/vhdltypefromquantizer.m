function [vtype, vsize, vbp, vsigned, sltype] = vhdltypefromquantizer(quantizerobj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch mode(quantizerobj)
    case 'fixed'
        [vsize, vbp] = format(quantizerobj);
        vsigned = 1.0;
        vtype = horzcat('signed(', num2str(minus(vsize, 1.0)), ' DOWNTO 0)');
    case 'ufixed'
        [vsize, vbp] = format(quantizerobj);
        vsigned = 0.0;
        vtype = horzcat('unsigned(', num2str(minus(vsize, 1.0)), ' DOWNTO 0)');
    case 'float'
        error(generatemsgid('quantizernotsupported'), 'Format float is not supported; only fixed, ufixed, and double (VHDL real) types are supported.');
    case 'double'
        % 18 20
        vsize = 0.0;
        vbp = 0.0;
        vsigned = 1.0;
        vtype = 'real';
    case 'single'
        error(generatemsgid('quantizernotsupported'), 'Format single is not supported; only fixed, ufixed, and double (VHDL real) types are supported.');
    case 'none'
        % 26 28
        error(generatemsgid('quantizernotsupported'), 'Format none is not supported; only fixed, ufixed, and double (VHDL real) types are supported.');
    otherwise
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        % 33 35
        error(generatemsgid('quantizernotsupported'), 'Format %s is not supported; only fixed, ufixed, and double (VHDL real) types are supported.', mode(quantizerobj));
        % 35 38
        % 36 38
    end % switch
    % 38 40
    sltype = '';
    if eq(vsize, -1.0)
        sltype = 'pass';
    else
        if strcmp(vtype, 'real')
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
end % function
