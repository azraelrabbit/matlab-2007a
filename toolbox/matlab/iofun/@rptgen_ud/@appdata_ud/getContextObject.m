function [cobj, ctxt] = getContextObject(ad, ctxt)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if (lt(nargin, 2.0)) | (strncmpi(ctxt, 'auto', 4.0))
        ctxt = ad.Context;
    end
    % 10 12
    if (strcmp(ctxt, 'None')) | (isempty(ctxt))
        ctxt = '';
        cobj = [];
    else
        cobj = get(ad, horzcat('Current', ctxt));
    end
end
