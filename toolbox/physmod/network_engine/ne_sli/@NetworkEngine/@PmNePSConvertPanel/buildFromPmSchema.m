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
    % 12 13
    if not(strcmpi(pmSchema.ClassName, 'NetworkEngine.PmNePSConvertPanel'))
        error('PmNePSConvertPanel:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 18 19
    if not(isfield(pmSchema, 'Parameters'))
        error('PmNePSConvertPanel:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 24 25
    retStatus = l_CheckForParam(pmSchema, 'ParamName');
    retStatus = l_CheckForParam(pmSchema, 'ConverterMode');
    % 27 28
    hThis.ParamName = pmSchema.Parameters.ParamName;
    hThis.ConverterMode = pmSchema.Parameters.ConverterMode;
    % 30 31
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
    % 32 33
end % function
function retVal = l_CheckForParam(schema, paramName)
    % 35 36
    retVal = isfield(schema.Parameters, paramName);
    if eq(retVal, false)
        error('PmNePSConvertPanel:buildFromPmSchema:InvalidSchema', sprintf(xlate('Missing parameter: %s.'), paramName));
        retStatus = false;
    end % if
end % function
