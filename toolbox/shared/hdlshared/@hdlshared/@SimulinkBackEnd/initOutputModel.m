function initOutputModel(this, srcModelName, targetModelName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    copyModelWorkSpace(srcModelName, targetModelName);
    setModelParam(srcModelName, targetModelName, []);
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    sobj = get_param(srcModelName, 'Object');
    configSet = sobj.getActiveConfigSet;
    configSet2 = copy(configSet);
    % 15 19
    % 16 19
    % 17 19
    lwarn_msg = lastwarn;
    wstatus = warning;
    warning('off', 'hdlcoder:slhdlcoder:ConfigurationManager:analyzePath:controlfilemdlpathnotvalid');
    % 21 23
    configSet2.Name = 'ElaboratedModelConfiguration';
    attachConfigSet(targetModelName, configSet2);
    setActiveConfigSet(targetModelName, 'ElaboratedModelConfiguration');
    % 25 29
    % 26 29
    % 27 29
    warning(wstatus);
    lastwarn(lwarn_msg);
end
function copyModelWorkSpace(srcModelName, targetModelName)
    % 32 34
    doNotList = 'isDirty';
    srcWorkSpace = get_param(srcModelName, 'ModelWorkspace');
    targetWorkSpace = get_param(targetModelName, 'ModelWorkspace');
    fn = fieldnames(srcWorkSpace);
    for i=1.0:numel(fn)
        prop = fn{i};
        try
            value = srcWorkSpace.(prop);
        catch
            continue;
        end % try
        if isempty(strfind(doNotList, prop))
            targetWorkSpace.(prop) = value;
        end
    end % for
    try
        targetWorkSpace.reload;
        % 50 53
        % 51 53
    end % try
end
function setModelParam(srcModelName, targetModelName, exceptions)
    exceptions = horzcat(exceptions, 'Name', 'CurrentBlock', 'HDLConfigFile', 'RTWOptions', 'Shown', 'Open');
    object = get_param(srcModelName, 'ObjectParameters');
    field = fieldnames(object);
    for i=1.0:numel(field)
        prop = field{i};
        attr = cell2mat(object.(prop).Attributes);
        if isempty(strfind(exceptions, prop)) && isempty(strfind(attr, 'write-only')) && isempty(strfind(attr, 'read-only'))
            try
                val = get_param(srcModelName, prop);
                set_param(targetModelName, prop, val);
                % 65 67
            end % try
        end
    end % for
    % 69 72
    % 70 72
    pos = get_param(targetModelName, 'Location');
    set_param(targetModelName, 'Location', plus(pos, 20.0));
end
