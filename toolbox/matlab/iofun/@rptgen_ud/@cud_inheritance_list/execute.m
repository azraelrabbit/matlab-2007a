function out = execute(c, d, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    currClass = get(rptgen_ud.appdata_ud, 'CurrentClass');
    if (isempty(currClass)) | (~(ishandle(currClass)))
        c.status('No current class');
        out = [];
        return
    end
    % 15 17
    out = createDocumentFragment(d);
    psObj = getPropSourceObject(rptgen_ud.propsrc_ud, c.ListType);
    psClass = rptgen_ud.propsrc_ud_class;
    % 19 21
    if c.ShowLocal
        locMakeList(currClass, c.ListType, psObj, psClass, d, out, xlate('in'));
    end
    % 23 25
    if c.ShowInherited
        locTraverseUp(currClass, c.ListType, psObj, psClass, d, out);
    end
end
function locMakeList(currClass, listType, psObj, psClass, d, df, titleVerb)
    % 29 32
    % 30 32
    objList = get(currClass, listType);
    if strcmpi(listType, 'properties')
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        for i=1.0:length(currClass.Superclasses)
            superProps = currClass.Superclasses(i).Properties;
            if ~(isempty(superProps))
                objList = setdiff(objList, superProps);
            end
        end % for
    else
        if ~(isempty(objList))
            objList = find(objList, '-depth', 0.0, '-not', 'Name', currClass.Name);
        end
    end
    objList = objList(:);
    titleEl = d.createElement('title', rptgen.capitalizeFirst(sprintf('%s %s class ', listType, titleVerb)));
    % 50 52
    titleEl.appendChild(psClass.makeLink(currClass, '', 'link', d));
    titleEl.appendChild(d.createTextNode(':  '));
    % 53 55
    if eq(length(objList), 0.0)
        oList = d.createElement('para', xlate('(None)'));
    else
        if gt(length(objList), 1.0)
            for i=1.0:length(objList)
                objList(i, 2.0) = currClass;
            end % for
            oList = psObj.makeLink(objList, '', 'link', d, 'para', ', ');
        else
            oList = createElement(d, 'para', psObj.makeLink(horzcat(objList, currClass), '', 'link', d));
        end
    end
    df.appendChild(d.createElement('formalpara', titleEl, oList));
end
function locTraverseUp(currClass, listType, psObj, psClass, d, df)
    % 69 72
    % 70 72
    for i=1.0:length(currClass.superclasses)
        sc = currClass.superclasses(i);
        locMakeList(sc, listType, psObj, psClass, d, df, 'inherited from');
        locTraverseUp(sc, listType, psObj, psClass, d, df);
    end % for
end
