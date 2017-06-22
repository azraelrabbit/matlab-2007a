function result = vhdlconstantvalue(cval, outsize, outbp, outsigned, format)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if eq(nargin, 4.0)
        format = '';
    end % if
    % 18 20
    if ne(length(cval), 1.0)
        warning(hdlerrormsgid('nonscalar'), 'vhdlconstantvalue is ignoring a vector value and using the first element.');
        % 21 23
        cval = cval(1.0);
    end % if
    % 24 26
    if eq(outsize, 0.0)
        result = sprintf('%21.16E', cval);
    else
        if eq(outsize, 1.0)
            result = sprintf('''%d''', ne(cval, 0.0));
        else
            if isinf(cval) && gt(cval, 0.0)
                result = handleplusinf(cval, outsize, outbp, outsigned, format);
            else
                if isinf(cval) && lt(cval, 0.0)
                    result = handleminusinf(cval, outsize, outbp, outsigned, format);
                else
                    if isa(cval, 'double') || isa(cval, 'single') || isinteger(cval) || islogical(cval)
                        result = handlenonfi(cval, outsize, outbp, outsigned, format);
                    else
                        if isa(cval, 'embedded.fi')
                            result = handlefi(cval, outsize, outbp, outsigned, format);
                        else
                            error(hdlerrormsgid('UnknownType'), 'Attempt to generate a constant value for an unknown datatype (%s)', class(cval));
                        end % if
                    end % if
                end % if
            end % if
        end % if
    end % if
end % function
function result = hexconst(val, outsize, outbp, outsigned)
    hexsize = ceil(mrdivide(outsize, 4.0));
    hexval = mydec2hex(val, hexsize, outsigned, lt(val, 0.0));
    result = hexformat(hexval, outsize, outsigned);
end % function
function result = hexformat(hexval, outsize, outsigned)
    bitsize = sprintf('%d', minus(outsize, 1.0));
    result = horzcat('signed(to_stdlogicvector(bit_vector''(X"', hexval, '"))(', bitsize, ' DOWNTO 0))');
    if not(outsigned)
        result = horzcat('un', result);
    end % if
end % function
function str = mydec2bin(d, n, issigned, isneg)
    if lt(nargin, 2.0)
        n = ceil(log2(max(d)));
        isneg = false;
    end % if
    d = double(d);
    % 69 71
    [f, e] = log2(max(d));
    n = max(n, ceil(e));
    binstr = rem(floor(mtimes(d, pow2(minus(1.0, n):0.0))), 2.0);
    if issigned && not(isneg) && eq(binstr(1.0), 1.0)
        binstr = horzcat(0.0, ones(1.0, minus(length(binstr), 1.0)));
    end % if
    % 76 78
    binvalues = '01';
    str = binvalues(plus(transpose(abs(binstr)), 1.0));
end % function
function str = mydec2hex(d, n, issigned, isneg)
    % 81 84
    % 82 84
    if lt(nargin, 2.0)
        n = ceil(mrdivide(log2(max(d)), 4.0));
        isneg = false;
    end % if
    % 87 89
    d = double(d);
    % 89 91
    [f, e] = log2(max(d));
    n = max(n, ceil(mrdivide(e, 4.0)));
    binstr = rem(floor(mtimes(d, pow2(minus(1.0, mtimes(4.0, n)):0.0))), 2.0);
    if issigned && not(isneg) && eq(binstr(1.0), 1.0)
        binstr = horzcat(0.0, ones(1.0, minus(length(binstr), 1.0)));
    end % if
    % 96 99
    % 97 99
    binstr = transpose(reshape(binstr, 4.0, n));
    binstr = mtimes(binstr, [8.0 ;  4.0 ;  2.0 ;  1.0]);
    % 100 102
    hexstr = '0123456789ABCDEF';
    % 102 104
    str = hexstr(plus(transpose(abs(binstr)), 1.0));
end % function
function result = binformat(binstr, outsize, outsigned)
    % 106 108
    result = horzcat('signed''("', binstr, '")');
    if not(outsigned)
        result = horzcat('un', result);
    end % if
end % function
function result = handleplusinf(cval, outsize, outbp, outsigned, format)
    % 113 115
    if outsigned
        if isempty(format) || isempty(strmatch(lower(format), 'noaggregate'))
            result = sprintf('(%d => ''0'', OTHERS => ''1'')', minus(outsize, 1.0));
        else
            hexsize = ceil(mrdivide(outsize, 4.0));
            hexmod = mod(minus(outsize, 1.0), 4.0);
            hexstr = '0137';
            result = char(mtimes('F', ones(1.0, hexsize)));
            result(1.0) = hexstr(plus(hexmod, 1.0));
            result = hexformat(result, outsize, outsigned);
        end % if
    else
        if isempty(format) || isempty(strmatch(lower(format), 'noaggregate'))
            result = '(OTHERS => ''1'')';
        else
            hexsize = ceil(mrdivide(outsize, 4.0));
            hexmod = mod(minus(outsize, 1.0), 4.0);
            hexstr = '137F';
            result = char(mtimes('F', ones(1.0, hexsize)));
            result(1.0) = hexstr(plus(hexmod, 1.0));
            result = hexformat(result, outsize, outsigned);
        end % if
    end % if
end % function
function result = handleminusinf(cval, outsize, outbp, outsigned, format)
    % 139 142
    % 140 142
    if outsigned
        if isempty(format) || isempty(strmatch(lower(format), 'noaggregate'))
            result = sprintf('(%d => ''1'', OTHERS => ''0'')', minus(outsize, 1.0));
        else
            hexsize = ceil(mrdivide(outsize, 4.0));
            hexmod = mod(minus(outsize, 1.0), 4.0);
            hexstr = '1248';
            result = char(mtimes('0', ones(1.0, hexsize)));
            result(1.0) = hexstr(plus(hexmod, 1.0));
            result = hexformat(result, outsize, outsigned);
        end % if
    else
        error('Attempt to assign a negative value constant to an unsigned signal');
    end % if
end % function
function result = handlenonfi(cval, outsize, outbp, outsigned, format)
    % 157 161
    % 158 161
    % 159 161
    temp = floor(plus(mtimes(double(cval), mpower(2.0, outbp)), .5));
    % 161 163
    if lt(temp, 0.0) && eq(outsigned, 0.0)
        error('Attempt to assign a negative value constant to an unsigned signal');
    end % if
    % 165 167
    if not(isempty(format)) && not(isempty(strmatch(lower(format), 'bin')))
        result = sprintf('"%s"', mydec2bin(temp, outsize, outsigned, lt(temp, 0.0)));
    else
        if gt(temp, 2147483647.0) || lt(temp, -2147483648.0) || eq(hdlgetparameter('use_aggregates_for_const'), 1.0)
            if isempty(format) || not(isempty(strmatch(lower(format), 'aggregate')))
                result = vhdlcreateaggregate(cval, outsize, outbp, outsigned);
            else
                result = hexconst(temp, outsize, outbp, outsigned);
            end % if
        else
            if not(isempty(format)) && not(isempty(strmatch(lower(format), 'hex')))
                result = hexconst(temp, outsize, outbp, outsigned);
            else
                if outsigned
                    result = sprintf('to_signed(%d, %d)', temp, outsize);
                else
                    result = sprintf('to_unsigned(%d, %d)', temp, outsize);
                end % if
            end % if
        end % if
    end % if
end % function
function result = handlefi(cval, outsize, outbp, outsigned, format)
    % 189 192
    % 190 192
    if not(isempty(format)) && not(isempty(strmatch(lower(format), 'hex')))
        result = hexformat(hex(cval), outsize, outsigned);
    else
        if not(isempty(format)) && not(isempty(strmatch(lower(format), 'bin')))
            result = sprintf('"%s"', bin(cval));
        else
            if ge(outsize, 32.0)
                result = binformat(bin(cval), outsize, outsigned);
            else
                if not(isempty(format)) && not(isempty(strmatch(lower(format), 'decimal')))
                    if outsigned
                        result = sprintf('to_signed(%d, %d)', int(cval), outsize);
                    else
                        result = sprintf('to_unsigned(%d, %d)', int(cval), outsize);
                    end % if
                else
                    result = binformat(bin(cval), outsize, outsigned);
                end % if
            end % if
        end % if
    end % if
end % function
