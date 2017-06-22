function retStatus = buildFromPmSchema(hThis, pmSchema)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if not(strcmpi(pmSchema.ClassName, 'MECH.PmMechBodyCSPanel'))
        error('PmMechBodyCSPanel:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 11 12
    if not(isfield(pmSchema, 'Parameters'))
        error('PmMechBodyCSPanel:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 17 18
    retStatus = l_CheckForParam(pmSchema, 'ParamName');
    % 19 20
    hThis.ParamName = pmSchema.Parameters.ParamName;
    % 21 22
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
    % 23 24
end % function
function retVal = l_CheckForParam(schema, paramName)
    % 26 27
    retVal = isfield(schema.Parameters, paramName);
    if eq(retVal, false)
        error('PmEditUnit:buildFromPmSchema:InvalidSchema', sprintf(xlate('Missing parameter: %s.'), paramName));
        retStatus = false;
    end % if
end % function
