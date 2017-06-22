function targetsExternalModeSwitch(varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    sigs{1.0} = {'modelName'};
    sigs{2.0} = {'modelName','action'};
    % 12 15
    % 13 15
    args = targets_parse_argument_pairs(sigs{end}, varargin);
    % 15 17
    n = targets_find_signature(sigs, args);
    % 17 19
    switch n
    case 1.0
        % 20 22
        modelName = args.modelName;
        % 22 25
        % 23 25
        selections = {'Building an executable','External mode'};
        promptString = {'This block allows you to configure your model','for building an executable or using external mode.','Please select a configuration:'};
        % 26 29
        % 27 29
        [selection, ok] = listdlg('Name', 'External mode configuration', 'PromptString', promptString, 'SelectionMode', 'single', 'ListString', selections, 'ListSize', [250.0 100.0]);
        % 29 33
        % 30 33
        % 31 33
        if ok
            i_setupModel(modelName, selections{selection});
        else
            return;
        end % if
    case 2.0
        % 38 40
        modelName = args.modelName;
        action = args.action;
        i_setupModel(modelName, action);
    otherwise
        % 43 45
        % 44 46
        error('Unknown parameters, a recognised function signature was not found');
        % 46 48
    end % switch
function i_setupModel(modelName, action)
    % 49 53
    % 50 53
    % 51 53
    action = lower(action);
    % 53 55
    switch action
    case 'building an executable'
        disp(' ')
        disp('1- Setting up the model to build an executable.');
        set_param(modelName, 'ExtMode', 'off');
        disp('2- Turning on optimization inline parameters required for ASAP2 generation.');
        set_param(modelName, 'InlineParams', 'on');
        disp('3- Selecting "normal" simulation mode.')
        set_param(modelName, 'SimulationMode', 'normal');
        disp('4- Selecting ASAP2 as the data exchange interface.');
        set_param(modelName, 'GenerateASAP2', 'on');
    case 'external mode'
        % 66 68
        disp(' ')
        disp('1- Setting up the model for External Mode.');
        % 69 71
        disp('2- Turning on optimization inline parameters required for External mode.');
        set_param(modelName, 'InlineParams', 'on');
        disp('3- Selecting "external" simulation mode.');
        set_param(modelName, 'SimulationMode', 'external');
        disp('4- Selecting External mode as the data exchange interface.')
        set_param(modelName, 'ExtMode', 'on');
    otherwise
        % 77 79
        error('Unknown action unable to setup the model');
        % 79 81
    end % switch
