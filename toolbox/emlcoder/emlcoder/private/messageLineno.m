function [lineNo, colNo] = messageLineno(script, start)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    srcLen = numel(script.m);
    if lt(srcLen, 1.0)
        lineNo = 1.0;
        colNo = 1.0;
    else
        lineNo = 1.0;
        eolPos = 0.0;
        start = max(0.0, start);
        stop = min(plus(start, 1.0), srcLen);
        for i=1.0:stop
            c = script.m(i);
            if eq(c, char(10.0))
                eolPos = i;
                lineNo = plus(lineNo, 1.0);
            end % if
        end % for
        colNo = max(1.0, minus(i, eolPos));
    end % if
end % function
