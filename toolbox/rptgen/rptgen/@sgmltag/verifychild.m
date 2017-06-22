function t = verifychild(t)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch lower(t.tag)
    case 'listitem'
        t = flatten(t, logical(0));
        okChildren = {'Para','SimPara','Comment','Equation','Figure','FormalPara','Graphic','ItemizedList','OrderedList','SimpleList','Table'};
        % 10 13
        % 11 13
        t = LocVerify(t, okChildren, set(sgmltag, 'Tag', 'Para'));
    case 'callout'
        t = flatten(t, logical(0));
        okChildren = {'Anchor','BlockQuote','BridgeHead','CalloutList','Equation','Figure','FormalPara','GlossList','Graphic','GraphicCO','InformalEquation','InformalExample','InformalTable','ItemizedList','LiteralLayout','OrderedList','Para','ProgramListing','SegmentedList','SimPara','SimpleList','Table'};
        % 16 21
        % 17 21
        % 18 21
        % 19 21
        t = LocVerify(t, okChildren, set(sgmltag, 'Tag', 'Para'));
    end
end
function t = LocVerify(t, okChildren, wrapperTag)
    % 24 27
    % 25 27
    childType = {};
    % 27 29
    if iscell(t.data)
        oldData = t.data;
    else
        oldData = cellhorzcat(t.data);
    end
    % 33 35
    for i=length(oldData):-1.0:1.0
        if isa(oldData{i}, 'sgmltag')
            childType{i} = oldData{i}.tag;
        else
            childType{i} = 'PCDATA';
        end
    end % for
    % 41 43
    validChildren = ismember(upper(childType), upper(okChildren));
    newWrapper = logical(1);
    newData = {};
    for i=1.0:length(validChildren)
        if validChildren(i)
            newData{plus(end, 1.0)} = oldData{i};
            newWrapper = logical(1);
        else
            if newWrapper
                newData{plus(end, 1.0)} = vertcat(wrapperTag, horzcat(oldData{i}));
                newWrapper = logical(0);
            else
                newData{end} = vertcat(horzcat(newData{end}), horzcat(oldData{i}));
            end
        end
    end % for
    % 58 60
    t.data = newData;
end
