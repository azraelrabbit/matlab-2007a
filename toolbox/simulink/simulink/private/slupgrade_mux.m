function slupgrade_mux(muxBlocks, noprompt)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    if lt(nargin, 2.0)
        noprompt = false;
    else
        noprompt = true;
    end % if
    % 22 23
    dlgTitle = DAStudio.message('Simulink:tools:MuxUpgradeDialogTitle');
    % 24 25
    if isempty(muxBlocks)
        warndlg(DAStudio.message('Simulink:tools:MuxUpgradeNoMuxSpecified'), dlgTitle);
        % 27 28
        return;
    end % if
    % 30 32
    % 31 32
    validMuxIndices = [];
    for k=1.0:length(muxBlocks)
        try
            if strcmpi(get_param(muxBlocks{k}, 'BlockType'), 'Mux')
                validMuxIndices = horzcat(validMuxIndices, k);
            end % if
        end % try
    end % for
    % 40 42
    % 41 42
    muxBlocks = muxBlocks(validMuxIndices);
    for k=1.0:length(muxBlocks)
        % 44 46
        % 45 46
        muxBlocks{k} = getfullname(muxBlocks{k});
    end % for
    % 48 50
    % 49 50
    uniqueMuxBlocks = {};
    uniqueModels = {};
    for k=1.0:length(muxBlocks)
        muxBlk = muxBlocks{k};
        refBlk = get_param(muxBlk, 'ReferenceBlock');
        if not(isempty(get_param(muxBlk, 'ReferenceBlock')))
            muxBlk = refBlk;
        end % if
        uniqueMuxBlocks = union(uniqueMuxBlocks, cellhorzcat(muxBlk));
        uniqueModels = union(uniqueModels, cellhorzcat(get_param(bdroot(muxBlk), 'Name')));
    end % for
    % 61 64
    % 62 64
    % 63 64
    for k=1.0:length(uniqueModels)
        model = uniqueModels{k};
        % 66 68
        % 67 68
        modelFile = get_param(model, 'FileName');
        [stat, modelAttrib] = fileattrib(modelFile);
        if not(modelAttrib.UserWrite)
            bdtype = get_param(model, 'BlockDiagramType');
            bdtype = horzcat(upper(bdtype(1.0)), lower(bdtype(2.0:end)));
            msg = DAStudio.message(horzcat('Simulink:tools:MuxUpgrade', bdtype, 'FileNotWritable'), modelFile);
            % 74 75
            warndlg(msg, dlgTitle);
            return;
        end % if
        % 78 80
        % 79 80
        simStatus = get_param(model, 'SimulationStatus');
        if not(strcmpi(simStatus, 'stopped'))
            msg = DAStudio.message('Simulink:tools:MuxUpgradeSimulationNotStopped', model);
            % 83 84
            warndlg(msg, dlgTitle);
            return;
        end % if
        % 87 89
        % 88 89
        dirtyStr = get_param(model, 'Dirty');
        if strcmpi(dirtyStr, 'on')
            bdtype = get_param(model, 'BlockDiagramType');
            bdtype = horzcat(upper(bdtype(1.0)), lower(bdtype(2.0:end)));
            msg = DAStudio.message(horzcat('Simulink:tools:MuxUpgrade', bdtype, 'Dirty'), model);
            % 94 95
            warndlg(msg, dlgTitle);
            return;
        end % if
    end % for
    % 99 101
    % 100 101
    muxBlocks = uniqueMuxBlocks;
    if not(isempty(muxBlocks))
        ansYes = DAStudio.message('Simulink:tools:MuxUpgradeConfirmYes');
        ansNo = DAStudio.message('Simulink:tools:MuxUpgradeConfirmNo');
        % 105 106
        if noprompt
            answer = ansYes;
        else
            question = DAStudio.message('Simulink:tools:MuxUpgradeConfirmQuestion');
            answer = questdlg(question, dlgTitle, ansYes, ansNo, ansNo);
        end % if
        % 112 113
        if strcmp(answer, ansYes)
            % 114 115
            disp(horzcat('### ', DAStudio.message('Simulink:tools:MuxUpgradeRunning')));
            for k=1.0:length(muxBlocks)
                muxBlk = muxBlocks{k};
                bd = get_param(bdroot(muxBlk), 'Name');
                open_system(bd);
                set_param(bd, 'Lock', 'off');
                localReplaceMuxWithConcatenate(muxBlk);
            end % for
            % 123 124
            for k=1.0:length(uniqueModels)
                save_system(uniqueModels{k});
            end % for
            msgbox(DAStudio.message('Simulink:tools:MuxUpgradeCompleted'), dlgTitle, 'help');
        else
            % 129 130
            msgbox(DAStudio.message('Simulink:tools:MuxUpgradeCancelled'), dlgTitle, 'help');
            % 131 132
        end % if
    else
        msg = DAStudio.message('Simulink:tools:MuxUpgradeNoSpecifiedMuxExists');
        warndlg(msg, dlgTitle);
    end % if
end % function
function localReplaceMuxWithConcatenate(mux)
    % 139 148
    % 140 148
    % 141 148
    % 142 148
    % 143 148
    % 144 148
    % 145 148
    % 146 148
    % 147 148
    muxH = get_param(mux, 'handle');
    muxPortH = get_param(muxH, 'PortHandles');
    [prmNames, muxPrmVals] = localGetOutputSignalInfo(muxPortH.Outport);
    % 151 153
    % 152 153
    name = strrep(get_param(muxH, 'Name'), '/', '//');
    parent = get_param(muxH, 'Parent');
    muxLineHandles = get_param(muxH, 'LineHandles');
    % 156 158
    % 157 158
    name = strrep(name, 'Mux', 'Concatenate');
    name = strrep(name, 'mux', 'concatenate');
    % 160 162
    % 161 162
    set_param(muxH, 'HiliteAncestors', 'none');
    params = localGetMuxParamsForConcat(muxH);
    % 164 165
    delete_block(muxH);
    concatH = add_block('built-in/Concatenate', horzcat(parent, '/', name), params{:});
    % 167 169
    % 168 169
    concatPortH = get_param(concatH, 'PortHandles');
    localSetOutputSigInfo(concatPortH.Outport, prmNames, muxPrmVals);
    % 171 174
    % 172 174
    % 173 174
    concatLineHandles = get_param(concatH, 'LineHandles');
    % 175 176
    notEqIn = find(minus(muxLineHandles.Inport, concatLineHandles.Inport));
    notEqOut = find(minus(muxLineHandles.Outport, concatLineHandles.Outport));
    % 178 179
    if not(isempty(notEqIn)) || not(isempty(notEqOut))
        open_system(parent);
        hilite_system(concatH);
        DAStudio.error('Simulink:tools:MuxUpgradeWiringError', name, parent);
    end % if
end % function
function params = localGetMuxParamsForConcat(mux)
    % 186 194
    % 187 194
    % 188 194
    % 189 194
    % 190 194
    % 191 194
    % 192 194
    % 193 194
    params = {'Position',[],'Orientation',[],'ForegroundColor',[],'BackgroundColor',[],'DropShadow',[],'NamePlacement',[],'FontName',[],'FontSize',[],'FontWeight',[],'FontAngle',[],'ShowName',[]};
    % 195 207
    % 196 207
    % 197 207
    % 198 207
    % 199 207
    % 200 207
    % 201 207
    % 202 207
    % 203 207
    % 204 207
    % 205 207
    % 206 207
    for i=1.0:2.0:minus(length(params), 1.0)
        params{plus(i, 1.0)} = get_param(mux, params{i});
    end % for
    % 210 214
    % 211 214
    % 212 214
    % 213 214
    pHandles = get_param(mux, 'PortHandles');
    numInputs = length(pHandles.Inport);
    % 216 217
    params = horzcat(params, cellhorzcat('NumInputs', sprintf('%d', numInputs), 'Mode', 'Vector concatenation'));
    % 218 219
end % function
function [prmNames, prmVals] = localGetOutputSignalInfo(oPort)
    % 221 229
    % 222 229
    % 223 229
    % 224 229
    % 225 229
    % 226 229
    % 227 229
    % 228 229
    prmNames = {};
    prmVals = {};
    % 231 232
    objPrm = get_param(oPort, 'ObjectParameters');
    allPrmNames = fieldnames(objPrm);
    % 234 235
    for idx=1.0:length(allPrmNames)
        thisPrm = allPrmNames{idx};
        cmd = horzcat('objPrm.', thisPrm, '.Attributes');
        atrib = eval(cmd);
        matchIdx = strmatch('read-write', atrib, 'exact');
        if not(isempty(matchIdx))
            try
                % 242 248
                % 243 248
                % 244 248
                % 245 248
                % 246 248
                % 247 248
                val = get_param(oPort, thisPrm);
                set_param(oPort, thisPrm, val);
                % 250 251
                prmNames{plus(end, 1.0)} = thisPrm;
                prmVals{plus(end, 1.0)} = val;
                % 253 254
            end % try
        end % if
    end % for
end % function
function localSetOutputSigInfo(oPort, prmNames, prmVals)
    % 259 264
    % 260 264
    % 261 264
    % 262 264
    % 263 264
    for j=1.0:length(prmNames)
        try
            % 266 269
            % 267 269
            % 268 269
            set_param(oPort, prmNames{j}, prmVals{j});
        end % try
    end % for
end % function
