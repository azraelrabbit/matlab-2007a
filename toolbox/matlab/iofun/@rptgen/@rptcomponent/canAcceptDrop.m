function tf = canAcceptDrop(this, dropObjects)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    tf = true;
    for i=1.0:length(dropObjects)
        if isa(dropObjects(i), 'rptgen.rptcomponent')
            if isa(dropObjects(i), 'rptgen.coutline')
                tf = false;
            else
                % 15 17
                tf = not(isParent(this, dropObjects(i)));
            end
        else
            if isa(dropObjects(i), 'RptgenML.LibraryComponent') || isa(dropObjects(i), 'RptgenML.LibraryRpt')
            else
                if isa(dropObjects(i), 'RptgenML.ComponentMaker')
                    tf = isComponentBuilt(dropObjects(i));
                end
            end
        end
        if not(tf)
            return
        end
    end % for
end
function tf = isParent(childObj, parentObj)
    childParent = up(childObj);
    if isempty(childParent)
        tf = false;
    else
        if eq(childParent, parentObj)
            tf = true;
        else
            tf = isParent(childParent, parentObj);
        end
    end
end
