function retStatus = buildFromPmSchema(hThis, pmSchema)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if not(strcmpi(pmSchema.ClassName, 'MECH.PmMechVectorCoordSys'))
        error('PmEditUnit:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 10 12
    if not(isfield(pmSchema, 'Parameters'))
        error('PmEditUnit:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return
    end
    % 16 18
    retStatus = l_CheckForParam(pmSchema, 'Label') && l_CheckForParam(pmSchema, 'LabelAttrb');
    % 18 21
    % 19 21
    hThis.Label = pmSchema.Parameters.Label;
    hThis.LabelAttrb = pmSchema.Parameters.LabelAttrb;
    % 22 24
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
    % 24 26
end
function retVal = l_CheckForParam(schema, paramName)
    % 27 29
    retVal = isfield(schema.Parameters, paramName);
    if eq(retVal, false)
        error('PmEditUnit:buildFromPmSchema:InvalidSchema', sprintf(xlate('Missing parameter: %s.'), paramName));
        retStatus = false;
    end
end
