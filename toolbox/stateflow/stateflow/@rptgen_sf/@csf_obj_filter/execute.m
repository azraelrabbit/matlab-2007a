function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    out = [];
    % 9 11
    adSF = rptgen_sf.appdata_sf;
    currObj = adSF.CurrentObject;
    if (isempty(currObj)) | (~(ishandle(currObj)))
        c.status('No current object', 4.0);
        return
    end
    % 16 18
    if ~(adSF.isaSF(currObj, c.ObjectType))
        % 18 20
        return
    end
    % 21 24
    % 22 24
    if ~(rptgen_ud.verifyChildCount(currObj, c.repMinChildren))
        return
    end
    % 26 28
    out = createDocumentFragment(d);
    % 28 30
    if c.addAnchor
        out.appendChild(makeLinkScalar(rptgen_sf.propsrc_sf, currObj, c.ObjectType, 'anchor', d, ''));
        % 31 37
        % 32 37
        % 33 37
        % 34 37
        % 35 37
    end
    % 37 39
    c.runChildren(d, out);
end
