function varargout = maskCallback(blockObj, block, action)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    subaction = 'apply';
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    switch action
    case 'init'
        % 17 26
        % 18 26
        % 19 26
        % 20 26
        % 21 26
        % 22 26
        % 23 26
        % 24 26
        blockPosition = get_param(block, 'position');
        % 26 35
        % 27 35
        % 28 35
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        b_ud = get_param(block, 'userdata');
        if b_ud.in_blockupdate
            return;
        end % if
        % 38 44
        % 39 44
        % 40 44
        % 41 44
        % 42 44
        des_cbStats(block, 'StatAverageIntergenerationTime', 'w', subaction);
        des_cbStats(block, 'StatNumberDeparted', '#d', subaction);
        des_cbStats(block, 'StatPendingEntity', 'pe', subaction);
        cbEntGenType(block, subaction);
        % 47 49
        set_param(block, 'position', blockPosition);
    case 'default'
        blockObj.des_ddg_def_mask(block, mfilename);
        % 51 53
        des_cbStats(block, 'StatAverageIntergenerationTime', 'w', subaction);
        des_cbStats(block, 'StatNumberDeparted', '#d', subaction);
        des_cbStats(block, 'StatPendingEntity', 'pe', subaction);
        cbEntGenType(block, subaction);
    end % switch
function cbEntGenType(block, subaction)
    % 58 72
    % 59 72
    % 60 72
    % 61 72
    % 62 72
    % 63 72
    % 64 72
    % 65 72
    % 66 72
    % 67 72
    % 68 72
    % 69 72
    % 70 72
    Vals = get_param(block, 'maskvalues');
    % 72 75
    % 73 75
    des_setfieldindexnumbers(block);
    priority = Vals{idxPriorityEntityGeneration};
    % 76 80
    % 77 80
    % 78 80
    InterGenTimeType = Vals{idxGenerateEntitiesUpon};
    switch InterGenTimeType
    case 'Sample time hit from port ts'
        % 82 84
        des_enableport(block, subaction, 'in', 'SL', 'vc', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'no');
        des_enableport(block, subaction, 'in', 'FC', 'fcn', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'yes', 'timingcontrol', 'Simulink', 'execIndex', priority);
    case 'Trigger from port tr'
        % 88 90
        des_enableport(block, subaction, 'in', 'SL', 'vc', 'no');
        des_enableport(block, subaction, 'in', 'FC', 'fcn', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'yes', 'timingcontrol', 'Simulink', 'execIndex', priority);
    case 'Change in signal from port vc'
        % 94 96
        des_enableport(block, subaction, 'in', 'FC', 'fcn', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'vc', 'yes', 'timingcontrol', 'Simulink', 'execIndex', priority);
    case 'Function call from port fcn'
        % 100 102
        des_enableport(block, subaction, 'in', 'SL', 'vc', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'tr', 'no');
        des_enableport(block, subaction, 'in', 'SL', 'ts', 'no');
        des_enableport(block, subaction, 'in', 'FC', 'fcn', 'yes', 'timingcontrol', 'Simulink', 'execIndex', priority);
    otherwise
        % 106 108
        error('Illegal value for event generation type');
    end % switch
    return;
