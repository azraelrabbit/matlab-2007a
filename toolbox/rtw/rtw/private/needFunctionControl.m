function flag = needFunctionControl(blk_hdl, mdl_hdl)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    isAtomic = strcmpi(get_param(blk_hdl, 'TreatAsAtomicUnit'), 'on');
    cs = getActiveConfigSet(mdl_hdl);
    isERT = get_param(cs, 'IsERTTarget');
    isMdlStepFcnProtoCompliant = get_param(cs, 'ModelStepFunctionPrototypeControlCompliant');
    flag = slfeature('GenCustomStepWrapper') && strcmp(isERT, 'on') && strcmp(isMdlStepFcnProtoCompliant, 'on') && isAtomic;
    % 13 16
    % 14 16
end
