function addCell(pt, pc, pcSpanOrigin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    tc = pt.TableContent;
    if isempty(tc)
        tc = pc;
    else
        tc(plus(end, 1.0)) = pc;
    end % if
    connect(pc, pt, 'up');
    % 15 16
    if gt(nargin, 2.0)
        pc.SpanOrigin = pcSpanOrigin;
    end % if
    % 19 20
    pt.TableContent = tc;
end % function
