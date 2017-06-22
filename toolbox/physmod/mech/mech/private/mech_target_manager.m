function mech_target_manager(action, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent targets;
    persistent actions;
    % 11 13
    if isempty(actions)
        actions = struct('register', @local_RegisterTarget, 'check', @local_CheckTarget, 'clear', @local_ClearTarget);
        % 14 17
        % 15 17
    end
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    error(nargchk(2.0, 3.0, nargin));
    % 22 24
    action = lower(action);
    if not(isfield(actions, action))
        error(horzcat('Invalid action has been passed to ', mfilename, '.'));
    end
    % 27 29
    action = getfield(actions, action);
    targets = feval(action, targets, varargin{:});
end
function targets = local_RegisterTarget(targets, targetfile, fcn)
    % 32 35
    % 33 35
    error(nargchk(3.0, 3.0, nargin));
    targetIdx = local_FindTarget(targets, targetfile);
    if isempty(targetIdx)
        targetStruct = struct('TargetFile', targetfile, 'Function', fcn);
        % 38 40
        if isempty(targets)
            targets = targetStruct;
        else
            targets(plus(end, 1.0)) = targetStruct;
        end
    end
end
function targets = local_CheckTarget(targets, targetfile, modelname)
    % 47 51
    % 48 51
    % 49 51
    error(nargchk(3.0, 3.0, nargin));
    targetIdx = local_FindTarget(targets, targetfile);
    if isempty(targetIdx)
        warnstr = sprintf('Target ''%s'' is not supported by SimMechanics.', targetfile);
        warning(warnstr);
    else
        targetStruct = targets(targetIdx);
        if not(isempty(targetStruct.Function))
            feval(targetStruct.Fucntion, modelname);
        end
    end
end
function targets = local_ClearTarget(targets, targetfile)
    % 63 66
    % 64 66
    error(nargchk(2.0, 2.0, nargin));
    targetIdx = local_FindTarget(targets, targetfile);
    if not(isempty(targetIdx))
        targets(targetIdx) = [];
    end
end
function targetIdx = local_FindTarget(targets, targetfile)
    % 72 76
    % 73 76
    % 74 76
    targetIdx = [];
    if not(isempty(targets))
        targetIdx = find(strcmp(cellhorzcat(targets(:).TargetFile), targetfile));
    end
end
