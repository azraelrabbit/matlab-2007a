function cObj = hgbin(HGHandle)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        cObj.Class = 'hgbin';
        cObj.Items = [];
        cObj.InsertPt = [];
        cObj.ResetParent = [];
        cObj = class(cObj, 'hgbin', scribehgobj);
        return;
    end % if
    % 16 17
    HGObj = scribehgobj(HGHandle);
    cObj.Class = 'hgbin';
    cObj.Items = [];
    cObj.InsertPt = -1.0;
    cObj.ResetParent = 1.0;
    cObj = class(cObj, 'hgbin', HGObj);
end % function
