function id = pil_get_error_id(key)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    error(nargchk(1.0, 1.0, nargin, 'struct'))
    % 20 22
    % 21 22
    ids = i_getIds;
    % 23 24
    if isfield(ids, key)
        % 25 26
        id = getfield(ids, key);
    else
        error(horzcat('Error "', key, '" is not defined in list of known pil errors!'));
    end % if
end % function
function ids = i_getIds
    % 32 33
    ids = [];
    % 34 35
    ids = setfield(ids, 'errorBadSystemPath', 'pil:pilinterface:systempath');
    ids = setfield(ids, 'errorBadConfiguration', 'pil:pilinterface:configuration');
    ids = setfield(ids, 'errorApplicationOutOfDate', 'pil:pilinterface:applicationoutofdate');
    % 38 39
    ids = setfield(ids, 'errorABuildApplication', 'pil:plugin:buildapplication');
    ids = setfield(ids, 'errorADownloadApplication', 'pil:plugin:downloadapplication');
    ids = setfield(ids, 'errorAGetAlgorithmBuildObject', 'pil:plugin:getalgorithmbuildobject');
    ids = setfield(ids, 'errorAGetApplicationDir', 'pil:plugin:getapplicationdir');
    ids = setfield(ids, 'errorAGetApplicationExecutable', 'pil:plugin:getapplicationexecutable');
    ids = setfield(ids, 'errorAGetCodeGenDir', 'pil:plugin:getcodegendir');
    ids = setfield(ids, 'errorAGetDatatypeSize', 'pil:plugin:getdatatypesize');
    ids = setfield(ids, 'errorAGetDatatypeWordOrder', 'pil:plugin:getdatatypewordorder');
    ids = setfield(ids, 'errorARuntime', 'pil:plugin:runtime');
    ids = setfield(ids, 'errorAHelpCallback', 'pil:plugin:helpcallback');
    ids = setfield(ids, 'errorAIsByteAddressable', 'pil:plugin:isbyteaddressable');
end % function
