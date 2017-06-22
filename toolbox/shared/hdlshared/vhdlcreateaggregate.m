function result = vhdlcreateaggregate(value, outsize, outbp, outsigned)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    result = '(';
    % 8 10
    if eq(outsize, 0.0)
        result = sprintf('%E', value);
    else
        if eq(outsize, 1.0)
            result = sprintf('''%d''', ne(value, 0.0));
        else
            temp = floor(plus(mtimes(double(value), mpower(2.0, outbp)), .5));
            if lt(temp, 0.0) && eq(outsigned, 0.0)
                error('Attempt to create a VHDL aggregate with a negative value (%d) for an unsigned result.', temp);
            end
            binform = dec2bin(temp);
            binform(eq(binform, '/')) = '1';
            lenbin = length(binform);
            % 22 24
            if ge(temp, 0.0) && ge(lenbin, outsize) && outsigned && eq(binform(1.0), '1')
                binform = char(horzcat('0', mtimes('1', ones(1.0, minus(lenbin, 1.0)))));
            end
            % 26 28
            if gt(lenbin, outsize)
                error('Attempt to create a VHDL aggregate of length %d that is larger than the word length of %d', lenbin, outsize);
            else
                % 30 34
                % 31 34
                % 32 34
                if lt(lenbin, outsize)
                    if ge(temp, 0.0)
                        binform = horzcat(times(ones(1.0, minus(outsize, lenbin)), '0'), binform);
                        lenbin = outsize;
                    else
                        binform = horzcat(times(ones(1.0, minus(outsize, lenbin)), '1'), binform);
                        lenbin = outsize;
                    end
                end
            end
            onescount = sum(eq(binform, '1'));
            zeroscount = minus(lenbin, onescount);
            if eq(onescount, lenbin)
                result = '(OTHERS => ''1'')';
            else
                if eq(zeroscount, lenbin)
                    result = '(OTHERS => ''0'')';
                else
                    if lt(onescount, zeroscount)
                        result = horzcat(result, parsebinform(binform, '1', '0'));
                    else
                        result = horzcat(result, parsebinform(binform, '0', '1'));
                    end
                end
            end
        end
    end
end
function result = parsebinform(binform, val1, val2)
    result = '';
    list = minus(length(binform), find(eq(binform, val1)));
    lastn = list(1.0);
    in_run = 0.0;
    for n=list(2.0:end)
        if eq(n, minus(lastn, 1.0))
            if eq(in_run, 0.0)
                result = horzcat(result, num2str(lastn), ' DOWNTO ');
                in_run = 1.0;
            end
        else
            result = horzcat(result, num2str(lastn), ' => ''', val1, ''', ');
            in_run = 0.0;
        end
        lastn = n;
    end % for
    result = horzcat(result, num2str(list(end)), ' => ''', val1, ''', ');
    result = horzcat(result, ' OTHERS => ''', val2, ''')');
end
