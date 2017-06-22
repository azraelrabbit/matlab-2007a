function schema = getSlMenuCustomization(callbackInfo)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    editingMode = getEditingModeConfig;
    % 10 12
    schema = sl_container_schema;
    schema.label = pm_message(editingMode.Label_msgid);
    schema.childrenFcns = cellhorzcat(@getEditingMode_Authoring_Schema, @getEditingMode_Using_Schema);
    schema.tag = editingMode.MenuTag;
    schema.statustip = pm_message(editingMode.MenuStatusTip_msgid);
end % function
function schema = getEditingMode_Authoring_Schema(callbackInfo)
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    schema = createSchema(EDITMODE_AUTHORING, callbackInfo.model);
end % function
function schema = getEditingMode_Using_Schema(callbackInfo)
    % 26 28
    schema = createSchema(EDITMODE_USING, callbackInfo.model);
end % function
function schema = createSchema(whichMode, model)
    % 30 33
    % 31 33
    editingMode = getEditingModeConfig;
    schema = sl_toggle_schema;
    schema.userdata = whichMode;
    schema.label = pm_message(horzcat(editingMode.ValueLabel_msgidprfx, schema.userdata));
    schema.tag = horzcat(editingMode.MenuOptionTag_prfx, schema.userdata);
    schema.callback = @selectModelEditingMode;
    schema.checked = isCheckedModelEditingMode(schema.userdata, model);
    schema.statustip = pm_message(editingMode.MenuOptionStatusTip_templ_msgid, pm_message(horzcat(editingMode.MenuOptionStatusTip_param_msgidprfx, whichMode)));
end % function
function isChecked = isCheckedModelEditingMode(value, mdl)
    % 42 46
    % 43 46
    % 44 46
    h = SSC.RunTimeModule;
    theMode = h.getModelEditingMode(mdl);
    if strcmp(theMode, value)
        isChecked = 'Checked';
    else
        isChecked = 'Unchecked';
    end % if
end % function
function isChecked = selectModelEditingMode(callbackInfo)
    % 54 56
    h = SSC.RunTimeModule;
    mdl = callbackInfo.model;
    h.canPerformOperation(mdl, 'SLM_SELECTMODE', callbackInfo.userdata);
end % function
function editingMode = getEditingModeConfig
    % 60 62
    configData = RunTimeModule_config;
    editingMode = configData.EditingMode;
end % function
