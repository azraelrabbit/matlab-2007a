function retStatus = buildFromPmSchema(hThis, pmSchema)
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
    if not(strcmpi(pmSchema.ClassName, 'PMDialogs.PmGroupPanel'))
        error('PmEditBox:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 17 19
    if not(isfield(pmSchema, 'Parameters'))
        error('PmEditBox:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 23 25
    retStatus = l_CheckForParam(pmSchema, 'Label') && l_CheckForParam(pmSchema, 'Style');
    % 25 28
    % 26 28
    hThis.Label = pmSchema.Parameters.Label;
    hThis.Style = pmSchema.Parameters.Style;
    hThis.StdLayoutCfg = pmSchema.Parameters.StdLayoutCfg;
    % 30 32
    retStatus = true;
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
    % 33 35
end
function retVal = l_CheckForParam(schema, paramName)
    % 36 38
    retVal = isfield(schema.Parameters, paramName);
    if eq(retVal, false)
        error('PmEditBox:buildFromPmSchema:InvalidSchema', sprintf(xlate('Missing parameter: %s.'), paramName));
        retStatus = false;
    end
end
