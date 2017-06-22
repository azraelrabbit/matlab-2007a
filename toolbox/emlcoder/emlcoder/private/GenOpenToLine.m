function GenOpenToLine(scriptName, filePath, lineNo, colNo, varargin)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    if eq(nargin, 4.0)
        msgType = 'Error';
    else
        msgType = varargin{1.0};
    end % if
    hreftext = sprintf('%s Line: %d Column: %d', scriptName, lineNo, colNo);
    if HasDesktop
        href = sprintf('matlab: emlcprivate(''callproc'',''emcopentoline'',''%s'',%d,%d);', filePath, lineNo, colNo);
        % 13 14
        disp(horzcat(msgType, ' in ==> <a href="', href, '">', hreftext, '</a>'));
    else
        disp(horzcat(msgType, ' in ==> ', hreftext));
    end % if
end % function
