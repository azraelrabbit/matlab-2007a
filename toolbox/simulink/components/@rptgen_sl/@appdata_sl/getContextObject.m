function [cto, ctxt] = getContextObject(ad, ctxt)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if (lt(nargin, 2.0)) | (strncmpi(ctxt, 'auto', 4.0))
        ctxt = ad.Context;
    end
    % 9 11
    if (strcmp(ctxt, 'None')) | (isempty(ctxt))
        cto = [];
        ctxt = '';
    else
        cto = get(ad, horzcat('Current', ctxt));
    end
end
