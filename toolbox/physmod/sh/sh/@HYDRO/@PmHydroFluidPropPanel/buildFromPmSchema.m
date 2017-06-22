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
    if not(strcmpi(pmSchema.ClassName, 'HYDRO.PmHydroFluidPropPanel'))
        error('PmHydroFluidPropPanel:buildFromPmSchema:InvalidSchema', xlate('Incorrect schema passed to BuildFromSchema.'));
        retStatus = false;
        return;
    end % if
    % 18 19
    retStatus = hThis.buildChildrenFromPmSchema(pmSchema);
    % 20 21
end % function
function retVal = l_CheckForParam(schema, paramName)
    % 23 24
    retVal = isfield(schema.Parameters, paramName);
    if eq(retVal, false)
        error('PmHydroFluidPropPanel:buildFromPmSchema:InvalidSchema', sprintf(xlate('Missing parameter: %s.'), paramName));
        retStatus = false;
    end % if
end % function
