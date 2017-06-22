function parsedText = parseExpressionText(rawText, wksp, charLimit, delimStart, delimEnd)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    if lt(nargin, 4.0)
        if lt(nargin, 3.0)
            charLimit = 1024.0;
            if lt(nargin, 2.0)
                wksp = 'base';
            end % if
        end % if
        % 31 33
        parsedText = rptgen.makeSingleLineText(rawText, char(10.0));
        parsedText = rptgen.parseExpressionText(parsedText, wksp, 0.0, '%<<', '>>');
        parsedText = rptgen.parseExpressionText(parsedText, wksp, charLimit, '%<', '>');
        return;
    end % if
    % 37 39
    beginIndex = findstr(rawText, delimStart);
    numBegin = length(beginIndex);
    % 40 42
    delimStartLen = length(delimStart);
    delimEndLen = length(delimEnd);
    % 43 45
    if eq(length(beginIndex), 0.0)
        parsedText = rawText;
    else
        endIndex = findstr(rawText, delimEnd);
        % 48 50
        prevEnd = 0.0;
        parsedText = '';
        % 51 53
        for i=1.0:numBegin
            plainText = rawText(plus(prevEnd, 1.0):minus(beginIndex(i), 1.0));
            % 54 56
            if eq(i, numBegin)
                nextBegin = plus(length(rawText), 1.0);
            else
                nextBegin = beginIndex(plus(i, 1.0));
            end % if
            % 60 62
            nextEnd = find(and(gt(endIndex, beginIndex(i)), lt(endIndex, nextBegin)));
            if gt(length(nextEnd), 0.0)
                prevEnd = minus(plus(endIndex(nextEnd(1.0)), delimEndLen), 1.0);
                varName = rawText(plus(beginIndex(i), delimStartLen):minus(prevEnd, delimEndLen));
                % 65 67
                if gt(length(varName), 0.0)
                    try
                        varValue = evalin(wksp, varName);
                        ok = 1.0;
                    catch
                        ok = 0.0;
                    end % try
                else
                    ok = 0.0;
                end % if
                % 76 78
                if not(ok)
                    varText = varName;
                else
                    varText = rptgen.toString(varValue, charLimit);
                end % if
            else
                varText = rawText(beginIndex(i):minus(nextBegin, 1.0));
                prevEnd = minus(nextBegin, 1.0);
            end % if
            parsedText = horzcat(parsedText, plainText, varText);
        end % for
        % 88 90
        if lt(prevEnd, length(rawText))
            parsedText = horzcat(parsedText, rawText(plus(prevEnd, 1.0):end));
        end % if
    end % if
