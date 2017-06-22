function sl_customization(cm)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if hdlcoderui.isslhdlcinstalled
        cm.addCustomMenuFcn('Simulink:ToolsMenu', @getHDLMenuItems);
        % 9 14
        % 10 14
        % 11 14
        % 12 14
        attachhdlcconfig(0.0)
    end % if
    % 15 17
function schemaFcns = getHDLMenuItems(callbackInfo)
    % 17 21
    % 18 21
    % 19 21
    schemaFcns = cellhorzcat(@hdlitem);
function schema = item_options(callbackInfo)
    % 22 25
    % 23 25
    schema = sl_action_schema;
    schema.label = '&Options...';
    schema.callback = @callback_options;
    % 27 29
    hdlcc = getHDLCoder(callbackInfo);
    if isempty(hdlcc)
        schema.state = 'Disabled';
    else
        schema.state = 'Enabled';
    end % if
function schema = item_mkhdl(callbackInfo)
    % 35 38
    % 36 38
    schema = sl_action_schema;
    schema.label = '&Generate HDL';
    schema.callback = @callback_mkhdl;
    % 40 48
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
function schema = item_mktb(callbackInfo)
    % 48 51
    % 49 51
    schema = sl_action_schema;
    schema.label = 'Generate &Test Bench';
    schema.callback = @callback_mktb;
    % 53 55
    hdlcc = getHDLCoder(callbackInfo);
    % 55 58
    % 56 58
    if isempty(hdlcc) || isequal(hdlcc.HDLCoder.StartNodeName, bdroot)
        schema.state = 'Disabled';
    else
        schema.state = 'Enabled';
    end % if
function callback_mkhdl(callbackInfo)
    % 63 66
    % 64 66
    hdlcc = getHDLCoder(callbackInfo);
    if not(isempty(hdlcc))
        try
            hdlcc.HDLCoder.makehdl;
        catch
            err = lasterr;
            errordlg(err);
        end % try
    end % if
function callback_mktb(callbackInfo)
    % 75 78
    % 76 78
    hdlcc = getHDLCoder(callbackInfo);
    if not(isempty(hdlcc))
        try
            hdlcc.HDLCoder.makehdltb;
        catch
            err = lasterr;
            errordlg(err);
        end % try
    end % if
function callback_options(callbackInfo)
    % 87 90
    % 88 90
    slCfgPrmDlg(bdroot, 'Open');
    slCfgPrmDlg(bdroot, 'TurnToPage', 'HDL Coder');
function schema = hdlitem(callbackInfo)
    % 92 95
    % 93 95
    schema = sl_container_schema;
    schema.label = '&HDL Coder';
    schema.childrenFcns = cellhorzcat(@item_options, @item_mkhdl, @item_mktb);
    % 97 99
    hdlcc = getHDLCoder(callbackInfo);
    if not(isempty(hdlcc))
        schema.state = 'Enabled';
    else
        schema.state = 'Disabled';
    end % if
function hdlcc = getHDLCoder(callbackInfo)
    % 105 109
    % 106 109
    % 107 109
    if not(hdlcoderui.isslhdlcinstalled)
        hdlcc = [];
        return;
    end % if
    % 112 114
    obj = get(callbackInfo);
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    configSet = getActiveConfigSet(obj.model);
    hdlcc = gethdlcconfigset(configSet);
    if isempty(hdlcc)
        return;
    end % if
    % 123 125
    if isempty(hdlcc.HDLCoder.StartNodeName)
        hdlcc.HDLCoder.updateStartNodeName(bdroot);
    end % if
