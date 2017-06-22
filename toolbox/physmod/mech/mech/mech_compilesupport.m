function mech_compilesupport(action, handle)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent actions;
    % 8 10
    if isempty(actions)
        actions = struct('rtm_callback_model', @local_RtmCallbackModel, 'rtm_callback_block', @local_RtmCallbackBlock);
        % 11 13
    end
    % 13 15
    action = lower(action);
    if isfield(actions, action)
        action = getfield(actions, action);
        feval(action, handle);
    else
        % 19 21
        error('unrecognized action');
    end
end
function local_RtmCallbackModel(sys)
    % 24 28
    % 25 28
    % 26 28
    mech_rtmsupport('ModelCompile', sys);
end
function local_RtmCallbackBlock(blk)
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    mech_rtmsupport('BlockCompile', get_param(blk, 'Object'));
end
