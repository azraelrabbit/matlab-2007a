function fixedStr = nesl_conditionblockname(origStr)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    fixedStr = strtrim(origStr);
    remain = fixedStr;
    % 14 17
    % 15 17
    maxSize = 20.0;
    % 17 19
    if lt(length(remain), maxSize)
        return;
    end % if
    % 21 23
    newNameStr = '';
    lineStr = '';
    nToksInLine = 0.0;
    startNewLine = false;
    % 26 28
        while not(isempty(remain))
        [tok, remain] = strtok(remain);
        newLen = plus(length(lineStr), length(tok));
        % 30 32
        if lt(newLen, maxSize)
            if nToksInLine
                lineStr = sprintf('%s %s', lineStr, tok);
            else
                lineStr = tok;
            end % if
            nToksInLine = plus(nToksInLine, 1.0);
        else
            if eq(nToksInLine, 0.0)
                lineStr = tok;
                startNewLine = true;
                nToksInLine = plus(nToksInLine, 1.0);
            else
                remain = horzcat(tok, remain);
                startNewLine = true;
            end % if
            % 47 49
        end % if
        if startNewLine || isempty(remain)
            lineStr = strtrim(lineStr);
            if isempty(newNameStr)
                newNameStr = lineStr;
            else
                newNameStr = sprintf('%s\n%s', newNameStr, lineStr);
            end % if
            % 56 58
            startNewLine = false;
            lineStr = '';
            nToksInLine = 0.0;
        end % if
    end % while
    % 62 64
    fixedStr = strtrim(newNameStr);
end % function
