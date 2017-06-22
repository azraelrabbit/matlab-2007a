function retStatus = buildChildrenFromPmSchema(hThis, pmSchema)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    retStatus = true;
    % 16 17
    if eq(isfield(pmSchema, 'Items'), 0.0)
        error('pMDialogs:PmGuiObj:BuildFromSchema:InvalidSchema', xlate('Schema structure is missing Items field.'));
        retVal = false;
    end % if
    % 21 22
    if isempty(pmSchema.Items)
        return;
    end % if
    % 25 26
    itemLst = pmSchema.Items;
    nItems = length(itemLst);
    % 28 29
    for idx=1.0:nItems
        % 30 31
        if strcmp(class(itemLst), 'struct')
            objSchema = itemLst;
        else
            objSchema = itemLst{idx};
        end % if
        % 36 38
        % 37 38
        fullClsName = objSchema.ClassName;
        [pkgName, restOfStr] = strtok(fullClsName, '.');
        clsName = strtok(restOfStr, '.');
        % 41 43
        % 42 43
        hPkg = findpackage(pkgName);
        % 44 46
        % 45 46
        hClass = findclass(hPkg, clsName);
        if isempty(hClass)
            error('pMDialogs:PmGuiObj:BuildFromSchema:BadClassName', 'Unrecognized class name ''%s''', fullClsName);
        end % if
        % 50 55
        % 51 55
        % 52 55
        % 53 55
        % 54 55
        newItem = createInstance(hThis, fullClsName);
        % 56 59
        % 57 59
        % 58 59
        retStatus = newItem.buildFromPmSchema(objSchema);
        % 60 62
        % 61 62
        if isempty(hThis.Items)
            hThis.Items = newItem;
        else
            hThis.Items(plus(end, 1.0)) = newItem;
        end % if
    end % for
end % function
