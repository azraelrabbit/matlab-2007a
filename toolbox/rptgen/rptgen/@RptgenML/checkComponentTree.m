function errMsg = checkComponentTree(this, thisChild)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    errMsg = '';
    % 13 15
    thisContentType = this.getContentType;
    if isempty(thisContentType)
        thisParent = this.up;
        if isa(thisParent, 'rptgen.rptcomponent')
            errMsg = checkComponentTree(thisParent, thisChild);
        end % if
        return;
    end % if
    % 22 24
    childContentType = thisChild.getContentType;
    % 24 26
    contentTypes = {'set';'book';'section';'titlepage';'paragraph';'table';'text';''};
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    thisContentIdx = find(strcmp(contentTypes, thisContentType));
    if isempty(thisContentIdx)
        thisContentIdx = length(contentTypes);
    else
        thisContentIdx = thisContentIdx(1.0);
    end % if
    % 42 44
    childContentIdx = find(strcmp(contentTypes, childContentType));
    if isempty(childContentIdx)
        childContentIdx = length(contentTypes);
    else
        childContentIdx = childContentIdx(1.0);
    end % if
    % 49 51
    canContain = [1.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 ;  0.0 0.0 1.0 1.0 0.0 0.0 0.0 1.0 ;  0.0 0.0 1.0 1.0 1.0 1.0 0.0 1.0 ;  0.0 0.0 0.0 0.0 0.0 0.0 0.0 1.0 ;  0.0 0.0 0.0 0.0 0.0 1.0 1.0 1.0 ;  0.0 0.0 0.0 0.0 1.0 1.0 1.0 1.0 ;  0.0 0.0 0.0 0.0 0.0 0.0 1.0 1.0 ;  1.0 1.0 1.0 1.0 1.0 1.0 1.0 1.0];
    % 51 67
    % 52 67
    % 53 67
    % 54 67
    % 55 67
    % 56 67
    % 57 67
    % 58 67
    % 59 67
    % 60 67
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    if not(canContain(thisContentIdx, childContentIdx))
        childName = getShortDisplayLabel(thisChild);
        okParents = contentTypes(find(canContain(1.0:minus(end, 1.0), childContentIdx)));
        okParentsCount = length(okParents);
        if eq(okParentsCount, 0.0)
            okParentsString = '';
        else
            if eq(okParentsCount, 1.0)
                okParentsString = okParents{1.0};
            else
                if eq(okParentsCount, 2.0)
                    okParentsString = sprintf('%s or %s', okParents{1.0}, okParents{2.0});
                else
                    okParentsString = '';
                    for i=1.0:minus(okParentsCount, 1.0)
                        okParentsString = sprintf('%s%s, ', okParentsString, okParents{i});
                    end % for
                    okParentsString = sprintf('%s or %s', okParentsString, okParents{end});
                end % if
            end % if
        end % if
        okParents = rptgen.makeSingleLineText(okParents, ' | ');
        errMsg = sprintf('Component "%s" (%s) may not contain "%s" (%s).\nMove "%s" inside components of type %s.', getShortDisplayLabel(this), thisContentType, childName, childContentType, childName, okParentsString);
        % 89 91
    end % if
end % function
function dLabel = getShortDisplayLabel(c)
    % 93 96
    % 94 96
    try
        dLabel = getDisplayLabel(c);
        dashIdx = findstr(dLabel, ' -');
        if not(isempty(dashIdx))
            dLabel = dLabel(1.0:minus(dashIdx, 1.0));
        end % if
    catch
        try
            dLabel = getName(c);
        catch
            dLabel = class(c);
        end % try
    end % try
end % function
