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
    if not(strcmpi(pmSchema.ClassName, 'PMDialogs.PmCheckBox'))
        error('PmCheckBox:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 17 19
    if not(isfield(pmSchema, 'Parameters'))
        error('PmCheckBox:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 23 25
    retStatus = l_CheckForParam(pmSchema, 'Label') && l_CheckForParam(pmSchema, 'ValueBlkParam') && l_CheckForParam(pmSchema, 'LabelAttrb');
    % 25 29
    % 26 29
    % 27 29
    hThis.Label = pmSchema.Parameters.Label;
    hThis.ValueBlkParam = pmSchema.Parameters.ValueBlkParam;
    hThis.LabelAttrb = pmSchema.Parameters.LabelAttrb;
    % 31 33
    retStatus = true;
    % 33 35
end
function retVal = l_CheckForParam(schema, paramName)
    % 36 38
    retVal = isfield(schema.Parameters, paramName);
    if eq(retVal, false)
        error('PmCheckBox:buildFromPmSchema:InvalidSchema', sprintf(xlate('Missing parameter: %s.'), paramName));
        retStatus = false;
    end
end
