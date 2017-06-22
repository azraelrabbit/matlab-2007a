function varargout = maskCallback(blockObj, block, action)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    subaction = 'apply';
    switch action
    case 'init'
        % 10 20
        % 11 20
        % 12 20
        % 13 20
        % 14 20
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        b_ud = get_param(block, 'userdata');
        if b_ud.in_blockupdate
            return;
        end % if
        % 23 25
        des_reinit_mask(block, b_ud);
        % 25 31
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        des_cbStats(block, 'avgGenTimeOpt', 'w', subaction);
        des_cbStats(block, 'statCountOpt', '#c', subaction);
        des_cbStats(block, 'outPortStatus', 'blkd', subaction);
        cbEntGenType(block, subaction);
    case 'default'
        blockObj.des_ddg_def_mask(block, mfilename);
        % 36 38
        des_cbStats(block, 'avgGenTimeOpt', 'w', subaction);
        des_cbStats(block, 'statCountOpt', '#c', subaction);
        des_cbStats(block, 'outPortStatus', 'blkd', subaction);
        cbEntGenType(block, subaction);
    end % switch
function cbEntGenType(block, subaction)
    % 43 57
    % 44 57
    % 45 57
    % 46 57
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    Vals = get_param(block, 'maskvalues');
    Vis = get_param(block, 'maskvisibilities');
    Prompt = get_param(block, 'maskprompts');
    % 59 62
    % 60 62
    des_setfieldindexnumbers(block);
    priority = Vals{idxPriorityEntityGeneration};
    % 63 67
    % 64 67
    % 65 67
    InterGenTimeType = Vals{idxInterGenTime};
    switch InterGenTimeType
    case 'With inter-generation time from dialog'
        % 69 71
        des_enableport(block, subaction, 'in', 'SL', 't', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'fcn', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'no');
        return;
    case 'With inter-generation time from port'
        des_enableport(block, subaction, 'in', 'SL', 't', 'yes');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'fcn', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'no');
    case 'At Simulink sample times'
        des_enableport(block, subaction, 'in', 'SL', 't', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'fcn', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'yes', 'timingcontrol', 'Simulink', 'execIndex', priority);
    case 'Upon trigger'
        % 86 88
        des_enableport(block, subaction, 'in', 'SL', 't', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'yes', 'timingcontrol', 'Simulink', 'execIndex', priority);
        % 89 91
        des_enableport(block, subaction, 'in', 'SL', 'fcn', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'no');
    case 'Upon function call'
        des_enableport(block, subaction, 'in', 'SL', 't', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'no');
        des_enableport(block, subaction, 'in', 'FC', 'fcn', 'yes', 'timingcontrol', 'Simulink', 'execIndex', priority);
        % 96 98
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'no');
    otherwise
        error('Illegal value for event generation type');
    end % switch
    return;
