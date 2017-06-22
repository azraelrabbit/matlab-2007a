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
        % 23 29
        % 24 29
        % 25 29
        % 26 29
        % 27 29
        des_cbStats(block, 'StatAverageIntergenerationTime', 'w', subaction);
        des_cbStats(block, 'StatNumberDeparted', '#d', subaction);
        des_cbStats(block, 'StatPendingEntity', 'pe', subaction);
        cbEntGenType(block, subaction);
    case 'default'
        blockObj.des_ddg_def_mask(block, mfilename);
        % 34 36
        des_cbStats(block, 'StatAverageIntergenerationTime', 'w', subaction);
        des_cbStats(block, 'StatNumberDeparted', '#d', subaction);
        des_cbStats(block, 'StatPendingEntity', 'pe', subaction);
        cbEntGenType(block, subaction);
    end % switch
function cbEntGenType(block, subaction)
    % 41 55
    % 42 55
    % 43 55
    % 44 55
    % 45 55
    % 46 55
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    Vals = get_param(block, 'maskvalues');
    Vis = get_param(block, 'maskvisibilities');
    Prompt = get_param(block, 'maskprompts');
    % 57 60
    % 58 60
    des_setfieldindexnumbers(block);
    priority = Vals{idxPriorityEntityGeneration};
    % 61 65
    % 62 65
    % 63 65
    GenerateEntitiesUponType = Vals{idxGenerateEntitiesUpon};
    switch GenerateEntitiesUponType
    case 'Intergeneration time from dialog'
        % 67 69
        des_enableport(block, subaction, 'in', 'SL', 't', 'no');
        return;
    case 'Intergeneration time from port t'
        des_enableport(block, subaction, 'in', 'SL', 't', 'yes');
    otherwise
        error('Illegal value for event generation type');
    end % switch
    return;
