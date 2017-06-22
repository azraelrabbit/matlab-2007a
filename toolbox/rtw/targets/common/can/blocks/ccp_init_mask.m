function varargout = ccp_init_mask(action, block, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch action
    case 'show_commands_mask_callback'
        show_commands = get_param(block, 'show_commands');
        var_names = {'GET_CCP_VERSIONenabled','EXCHANGE_IDenabled','SET_MTAenabled','DNLOADenabled','UPLOADenabled','SHORT_UPenabled','GET_DAQ_SIZEenabled','SET_DAQ_PTRenabled','WRITE_DAQenabled','START_STOPenabled','SET_S_STATUSenabled','GET_S_STATUSenabled','START_STOP_ALLenabled','DNLOAD_6enabled'};
        % 13 16
        % 14 16
        % 15 16
        switch show_commands
        case 'on'
            internal_show_commands(block, var_names);
        case 'off'
            internal_hide_commands(block, var_names);
        end % switch
    otherwise
        disp('Unknown action');
    end % switch
end % function
function internal_show_commands(block, var_names)
    for i=1.0:length(var_names)
        simUtil_maskParam('show', block, var_names{i});
    end % for
end % function
function internal_hide_commands(block, var_names)
    for i=1.0:length(var_names)
        simUtil_maskParam('hide', block, var_names{i});
    end % for
end % function
