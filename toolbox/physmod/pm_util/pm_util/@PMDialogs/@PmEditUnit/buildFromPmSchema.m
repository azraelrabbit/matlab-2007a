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
    if not(strcmpi(pmSchema.ClassName, 'PMDialogs.PmEditUnit'))
        error('PmEditUnit:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 17 19
    if not(isfield(pmSchema, 'Parameters'))
        error('PmEditUnit:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 23 25
    retStatus = l_CheckForParam(pmSchema, 'Label') && l_CheckForParam(pmSchema, 'LabelAttrb');
    % 25 28
    % 26 28
    hThis.Label = pmSchema.Parameters.Label;
    hThis.LabelAttrb = pmSchema.Parameters.LabelAttrb;
    % 29 31
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
    % 31 33
end
function retVal = l_CheckForParam(schema, paramName)
    % 34 36
    retVal = isfield(schema.Parameters, paramName);
    if eq(retVal, false)
        error('PmEditUnit:buildFromPmSchema:InvalidSchema', sprintf(xlate('Missing parameter: %s.'), paramName));
        retStatus = false;
    end
end
