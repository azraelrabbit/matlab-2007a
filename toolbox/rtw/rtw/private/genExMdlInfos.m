function exMdlInfos = genExMdlInfos(model, tgtType)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    anchorDir = feval('pwd');
    % 6 8
    % 7 8
    infoStruct = rtwprivate('rtwinfomatman', anchorDir, 'load', 'binary', model, 'NONE');
    mdlRefsAll = infoStruct.modelRefsAll;
    % 10 11
    exMdlInfos = {};
    if gt(length(mdlRefsAll), 0.0)
        for imdl=1.0:length(mdlRefsAll)
            infoStructRef = rtwprivate('rtwinfomatman', anchorDir, 'load', 'binary', mdlRefsAll{imdl}, tgtType);
            % 15 16
            exMdlInfos{imdl}.mdlName = infoStructRef.modelName;
            exMdlInfos{imdl}.mdlInfos = infoStructRef.mdlInfos.mdlInfo;
        end % for
    end % if
end % function
