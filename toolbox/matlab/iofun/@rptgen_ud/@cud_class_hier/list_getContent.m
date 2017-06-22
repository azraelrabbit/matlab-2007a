function out = list_getContent(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    adUD = rptgen_ud.appdata_ud;
    % 9 11
    out = [];
    % 11 13
    currContext = c.TreeType;
    if strcmp(currContext, 'auto')
        currContext = adUD.Context;
    end
    % 16 18
    switch lower(adUD.Context)
    case 'package'
        if not(isempty(adUD.CurrentPackage))
            out = makePackageHierarchy(c, d, adUD.CurrentPackage);
        else
            c.status(sprintf('No current %s', adUD.Context), 2.0);
        end
    case {'class','object'}
        currClass = adUD.getContextObject;
        if not(isempty(currClass))
            if not(isa(currClass, 'schema.class'))
                currClass = classhandle(currClass);
            end
            % 30 32
            if isempty(currClass.Superclasses)
                c.status(sprintf('Current %s has no superclasses', adUD.Context), 4.0);
            else
                out = makeClassHierarchy(c, currClass, rptgen_ud.propsrc_ud_class, d);
                % 35 39
                % 36 39
                % 37 39
            end
        else
            c.status(sprintf('No current %s', adUD.Context), 2.0);
        end
    otherwise
        % 43 45
        c.status(sprintf('%s not valid in %s context', c.getName, adUD.Context), 2.0);
    end
end
function out = makeClassHierarchy(c, currClass, psUD, d, lowerNode)
    % 48 52
    % 49 52
    % 50 52
    objName = psUD.getObjectName(currClass, 'class');
    linkID = psUD.getObjectID(currClass, 'class');
    out = d.makeLink(linkID, objName, 'link');
    % 54 56
    if gt(nargin, 4.0)
        out = cellhorzcat(out, lowerNode);
    else
        out = cellhorzcat(out);
    end
    % 60 62
    if not(isempty(currClass.Superclasses))
        out = makeClassHierarchy(c, currClass.Superclasses(1.0), psUD, d, out);
    end
end
function out = makePackageHierarchy(c, d, currPkg)
    % 66 70
    % 67 70
    % 68 70
    clsPointer = rptgen_ud.ClassNode(currPkg);
    % 70 72
    if not(isempty(clsPointer.down))
        oHier = rptgen_ud.cud_obj_hier('TreeType', 'relative', 'RuntimeDocument', d, 'RuntimePropSrc', rptgen_ud.propsrc_ud_class_pointer, 'EmphasizeCurrent', false, 'ParentDepth', 0.0, 'ShowSiblings', logical(1), 'ChildDepth', 64.0);
        % 73 81
        % 74 81
        % 75 81
        % 76 81
        % 77 81
        % 78 81
        % 79 81
        out = hierGetContent(oHier, clsPointer.down);
        % 81 83
        delete(oHier);
        % 83 88
        % 84 88
        % 85 88
        % 86 88
    end
end
