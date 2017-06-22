function [copyBufferFig, copyBufferAx] = getcopybuffer(varargin)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    copyBufferFig = findobj(allchild(0.0), 'flat', 'Tag', 'ScribeCopyBufferFig');
    % 15 16
    copyBufferAx = findobj(allchild(copyBufferFig), 'flat', 'Tag', 'ScribeCopyBufferOverlayAxes');
    % 17 19
    % 18 19
    if eq(nargin, 0.0) && isempty(copyBufferAx)
        copyBufferFig = figure('Tag', 'ScribeCopyBufferFig', 'IntegerHandle', 'off', 'HandleVisibility', 'off', 'NumberTitle', 'off', 'Visible', 'off', 'Name', 'Scribe Copy Buffer', 'Resize', 'off');
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        % 26 27
        copyBufferAx = axes('Tag', 'ScribeCopyBufferOverlayAxes', 'HandleVisibility', 'off', 'Visible', 'off', 'Parent', copyBufferFig);
        % 28 31
        % 29 31
        % 30 31
        fh = scribehandle(figobj(copyBufferFig));
    end % if
end % function
