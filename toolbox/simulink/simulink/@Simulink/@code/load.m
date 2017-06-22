function load(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    while not(isempty(this.down))
        this.down.disconnect;
    end % while
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    if strcmp(this.NodeType, 'TopModel')
        % 16 18
        if gt(nargin, 1.0)
            this.BuildDirRoot = varargin{1.0};
        else
            this.BuildDirRoot = rtwprivate('get_build_dir_root', this.ModelName);
        end
        % 22 25
        % 23 25
        try
            [notUsed, gensettings] = rtwprivate('getSTFInfo', this.ModelName, 'noTLCSettings', true, 'doNotCache', true, 'forceRead', true);
            % 26 30
            % 27 30
            % 28 30
            this.BuildDir = fullfile(this.BuildDirRoot, gensettings.RelativeBuildDir);
        catch
            % 31 34
            % 32 34
            lasterr('');
            this.BuildDir = '';
            return
        end % try
    end
    % 38 41
    % 39 41
    rtwProjFile = fullfile(this.BuildDir, 'rtw_proj.tmw');
    if not(exist(rtwProjFile))
        if strcmp(this.NodeType, 'TopModel')
            loc_loadsubsys(this);
        end
        return
    end
    fid = fopen(rtwProjFile, 'r');
    if eq(fid, -1.0)
        disp(horzcat('RTW Code Browser: Unable to open RTW project marker file: ', rtwProjFile));
        return
    end
    line1 = fgetl(fid);
    line2 = fgetl(fid);
    line2 = fgetl(fid);
    line3 = fgetl(fid);
    fclose(fid);
    if isstr(line3)
        rtwinfomatfile = deblank(strrep(line3, 'The rtwinfomat located at: ', ''));
        rtwinfomatfile = fullfile(this.BuildDir, rtwinfomatfile);
    else
        disp(horzcat('RTW Code Browser: Incorrect RTW project marker file: ', rtwProjFile));
        return
    end
    if ne(exist(rtwinfomatfile), 2.0)
        if strcmp(this.NodeType, 'TopModel')
            loc_loadsubsys(this);
        end
        return
    end
    % 70 73
    % 71 73
    load(rtwinfomatfile);
    if strcmp(this.NodeType, 'TopModel')
        if not(strcmp(this.ModelName, infoStruct.modelName))
            disp(horzcat('RTW Code Browser: Model name doesn''t match: ', infoStruct.modelName, ' vs. ', this.ModelName));
            % 76 78
            return
        end
    end
    dirInfo = dir(rtwinfomatfile);
    this.BuildTime = dirInfo.date;
    if strcmp(this.NodeType, 'TopModel')
        modelFullName = get_param(this.ModelName, 'FileName');
        if isempty(modelFullName)
            this.isOutofDate = logical(0);
        else
            if ne(rtwprivate('cmpTimeFlag', rtwinfomatfile, modelFullName), -1.0)
                this.isOutofDate = logical(1);
            else
                this.isOutofDate = logical(0);
            end
        end
    end
    this.ModelName = infoStruct.modelName;
    this.SharedDir = fullfile(this.BuildDirRoot, infoStruct.sharedSourcesDir);
    this.modelRefsAll = infoStruct.modelRefsAll;
    this.modelRefs = infoStruct.modelRefs;
    if isfield(infoStruct, 'SourceSubsystemName')
        this.SourceSubsystemName = infoStruct.SourceSubsystemName;
    else
        this.SourceSubsystemName = '';
    end
    if isfield(infoStruct, 'SystemMap')
        this.SystemMap = infoStruct.SystemMap;
    else
        this.SystemMap = {};
    end
    generateBacklink = logical(0);
    if strcmp(this.NodeType, 'TopModel') || strcmp(this.NodeType, 'Subsystem')
        if strcmp(get_param(infoStructConfigSet, 'IncludeHyperlinkInReport'), 'on')
            generateBacklink = logical(1);
        end
    end
    % 114 116
    if strcmp(this.NodeType, 'TopModel')
        % 116 119
        % 117 119
        if strcmp(get_param(infoStructConfigSet, 'UtilityFuncGeneration'), 'Shared location') || not(isempty(infoStruct.modelRefsAll))
            % 119 121
            this.SharedDirObj = Simulink.directory(this.SharedDir, 'Shared Code', generateBacklink);
            this.SharedDirObj.connect(this, 'Up');
        end
    end
    if strcmp(this.NodeType, 'TopModel')
        this.BuildDirSrcObj = Simulink.directory(this.BuildDir, 'This Model', generateBacklink);
        this.BuildDirSrcObj.connect(this, 'Up');
    else
        this.BuildDirSrcObj = Simulink.directory(this.BuildDir, this.ModelName, generateBacklink);
        this.BuildDirSrcObj.connect(this, 'Up');
    end
    % 131 134
    % 132 134
    if isa(infoStructConfigSet, 'Simulink.ConfigSet')
        this.ConfigSetObj = infoStructConfigSet;
        this.ConfigSetObj.readonly = 'on';
    end
    % 137 139
    mainhtmlreport = fullfile(this.BuildDir, 'html', horzcat(this.ModelName, '_codegen_rpt.html'));
    % 139 141
    if exist(mainhtmlreport)
        this.htmlreport = mainhtmlreport;
    end
    % 143 145
    dasRoot = DAStudio.Root;
    % 145 147
    if dasRoot.hasWebBrowser
        % 147 149
        if exist(mainhtmlreport)
            curDocObj = Simulink.document(mainhtmlreport, 'HTML Report');
            this.htmlReportObj = curDocObj;
            this.htmlReportObj.connect(this, 'Up');
        end
    else
        surveyhtmlPage = fullfile(this.BuildDir, 'html', horzcat(this.ModelName, '_survey.html'));
        % 155 157
        if exist(surveyhtmlPage)
            curDocObj = Simulink.document(surveyhtmlPage, 'Report Summary');
            curDocObj.connect(this, 'Up');
            this.htmlReportObj = vertcat(horzcat(this.htmlReportObj), curDocObj);
        end
        subsyshtmlPage = fullfile(this.BuildDir, 'html', horzcat(this.ModelName, '_subsystems.html'));
        % 162 164
        if exist(subsyshtmlPage)
            curDocObj = Simulink.document(subsyshtmlPage, 'Report for Subsystem');
            curDocObj.connect(this, 'Up');
            this.htmlReportObj = vertcat(horzcat(this.htmlReportObj), curDocObj);
        end
    end
    % 169 173
    % 170 173
    % 171 173
    if strcmp(this.NodeType, 'TopModel')
        subrebuildCommandPath = infoStruct.includePaths;
        for idxrebuildCommandFile=1.0:length(subrebuildCommandPath)
            curSubModel = Simulink.code;
            curSubModel.connect(this, 'Up');
            curSubModel.NodeType = 'ReferencedModel';
            curSubModel.BuildDir = fullfile(this.BuildDirRoot, subrebuildCommandPath{idxrebuildCommandFile});
            curSubModel.BuildDirRoot = this.BuildDirRoot;
            curSubModel.load;
            % 181 187
            % 182 187
            % 183 187
            % 184 187
            % 185 187
            this.submodels = horzcat(ctranspose(this.submodels), curSubModel);
            % 187 189
        end % for
    end
    % 190 192
    if strcmp(this.NodeType, 'TopModel')
        loc_loadsubsys(this);
    end
end
function loc_loadsubsys(this)
    % 196 199
    % 197 199
    [nu, genSet] = rtwprivate('getSTFInfo', this.ModelName);
    matFileDir = fullfile(this.BuildDirRoot, 'slprj', genSet.mdlRefTgtDir, this.ModelName, 'tmwinternal');
    % 200 202
    matFileName = fullfile(matFileDir, 'sinfo.mat');
    % 202 204
    if exist(matFileName, 'file')
        infoStruct = load(matFileName);
        infoStruct = infoStruct.infoStruct;
        if not(isempty(infoStruct)) && isfield(infoStruct, 'Subsystems') && not(isempty(infoStruct.Subsystems))
            % 207 209
            subsystems = infoStruct.Subsystems;
            newsubsystems = [];
            for i=1.0:length(subsystems)
                subsystemName = subsystems(i).TmpMdlName;
                % 212 217
                % 213 217
                % 214 217
                % 215 217
                sys = find_system(this.ModelName, 'BlockType', 'SubSystem');
                outofdate = true;
                for j=1.0:length(sys)
                    if strcmp(sys{j}, subsystems(i).BlockPath)
                        outofdate = false;
                        break
                    end
                end % for
                if outofdate
                    continue;
                end
                % 227 230
                % 228 230
                buildDir = subsystems(i).buildDir;
                outofdate = le(exist(buildDir, 'dir'), 0.0);
                if outofdate
                    continue;
                end
                % 234 237
                % 235 237
                try
                    timestamp1 = subsystems(i).TimeStamp;
                    timestamp2 = rtwprivate('getFileTimeStamp', buildDir);
                    date1 = datevec(timestamp1);
                    date2 = datevec(timestamp2);
                    outofdate = not(isequal(date1, date2));
                catch
                    outofdate = true;
                end % try
                if outofdate
                    continue;
                end
                % 248 250
                subsystem = Simulink.code;
                subsystem.connect(this, 'Up');
                subsystem.NodeType = 'Subsystem';
                subsystem.DisplayName = subsystems(i).BlockPath;
                subsystem.NodeType = 'Subsystem';
                subsystem.BuildDirRoot = this.BuildDirRoot;
                subsystem.BuildDir = buildDir;
                subsystem.load;
                this.subsystems = horzcat(ctranspose(this.subsystems), subsystem);
                newsubsystems = vertcat(newsubsystems(:), subsystems(i));
            end % for
            % 260 263
            % 261 263
            if not(isequal(subsystems, newsubsystems))
                try
                    infoStruct.Subsystems = newsubsystems;
                    save(matFileName, 'infoStruct');
                end % try
            end
        end
    end
end
