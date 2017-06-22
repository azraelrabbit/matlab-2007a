function addStandardInfo(h, BuildOpts)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    standardGroup = 'Standard';
    legacyGroup = 'Legacy';
    % 8 10
    srcFiles = {};
    srcFilePaths = {};
    srcFileGroups = 'Legacy';
    % 12 14
    noMdlRefFiles = {};
    noMdlRefFilePaths = {};
    noMdlRefFileGroups = {};
    % 16 19
    % 17 19
    incPaths = cellhorzcat(fullfile(matlabroot, 'extern', 'include'), fullfile(matlabroot, 'simulink', 'include'), fullfile(matlabroot, 'rtw', 'c', 'src'), fullfile(matlabroot, 'rtw', 'c', 'libsrc'));
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    incGroups = cellhorzcat(standardGroup, standardGroup, standardGroup, 'libsrc');
    % 27 29
    srcPaths = cellhorzcat(fullfile(matlabroot, 'rtw', 'c', 'src'));
    srcGroups = cellhorzcat(standardGroup);
    % 30 34
    % 31 34
    % 32 34
    ppdef = cellhorzcat(horzcat('MODEL=', get_param(h.ModelHandle, 'Name')), horzcat('NUMST=', BuildOpts.numst), horzcat('NCSTATES=', BuildOpts.ncstates), 'HAVESTDIO');
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    cs = getActiveConfigSet(h.ModelHandle);
    % 41 43
    rootCType = RTW.getRootConfigsetType(cs);
    % 43 46
    % 44 46
    switch rootCType
    case 'ERT'
        incPaths = horzcat(incPaths, fullfile(matlabroot, 'rtw', 'c', 'src', 'ext_mode', 'common'));
        % 48 50
        incGroups = horzcat(incGroups, standardGroup);
        incPaths = horzcat(incPaths, horzcat(matlabroot, '/rtw/c/ert'));
        incGroups = horzcat(incGroups, standardGroup);
        % 52 56
        % 53 56
        % 54 56
        if strcmp(cs.get_param('GenerateSampleERTMain'), 'on')
            if strcmpi(cs.get_param('TargetLang'), 'c')
                ext = '.c';
            else
                ext = '.cpp';
            end % if
            noMdlRefFiles = cellhorzcat(horzcat('ert_main', ext));
            % 62 65
            % 63 65
            noMdlRefFilePaths = h.getSourcePaths(false, {'BuildDir'});
            noMdlRefFileGroups = {'BuildDir'};
        else
            noMdlRefFiles = {'ert_main.c'};
            noMdlRefFilePaths = cellhorzcat(fullfile(matlabroot, 'rtw', 'c', 'ert'));
            noMdlRefFileGroups = cellhorzcat(legacyGroup);
        end % if
    case 'GRT'
        ppdef = horzcat(ppdef, 'RT');
        ppdef = horzcat(ppdef, 'USE_RTMODEL');
        incPaths = horzcat(incPaths, fullfile(matlabroot, 'rtw', 'c', 'src', 'ext_mode', 'common'));
        % 75 77
        incGroups = horzcat(incGroups, standardGroup);
        % 77 80
        % 78 80
        if strcmp(BuildOpts.codeFormat, 'RealTime')
            noMdlRefFiles = {'grt_main.c','rt_sim.c'};
            noMdlRefFilePaths = cellhorzcat(fullfile(matlabroot, 'rtw', 'c', 'grt'), '');
            noMdlRefFileGroups = cellhorzcat(legacyGroup, legacyGroup);
        else
            noMdlRefFiles = {'grt_malloc_main.c','rt_sim.c'};
            noMdlRefFilePaths = cellhorzcat(fullfile(matlabroot, 'rtw', 'c', 'grt_malloc'), '');
            noMdlRefFileGroups = cellhorzcat(legacyGroup, legacyGroup);
        end % if
    case 'RSim'
        ppdef = horzcat(ppdef, 'RT');
        incPaths = horzcat(incPaths, fullfile(matlabroot, 'rtw', 'c', 'src', 'ext_mode', 'common'));
        % 91 93
        incGroups = horzcat(incGroups, standardGroup);
        noMdlRefFiles = {'rsim_main.c','rt_sim.c'};
        noMdlRefFilePaths = cellhorzcat(fullfile(matlabroot, 'rtw', 'c', 'rsim'), '');
        noMdlRefFileGroups = cellhorzcat(legacyGroup, legacyGroup);
    case 'Tornado'
        ppdef = horzcat(ppdef, 'RT');
        ppdef = horzcat(ppdef, 'USE_RTMODEL');
        incPaths = horzcat(incPaths, fullfile(matlabroot, 'rtw', 'c', 'src', 'ext_mode', 'common'));
        % 100 102
        incGroups = horzcat(incGroups, standardGroup);
        % 102 104
        srcFiles = {'rt_main.c','rt_sim.c','rt_nonfinite.c'};
        srcFilePaths = horzcat(srcFilePaths, fullfile(matlabroot, 'rtw', 'c', 'tornado'), fullfile(matlabroot, 'rtw', 'c', 'src'), {''});
        % 106 109
        % 107 109
    case 'STFCustom'
    otherwise
        % 109 114
        % 110 114
        % 111 114
        % 112 114
        % 113 116
        % 114 116
    end % switch
    % 116 120
    % 117 120
    % 118 120
    if strcmp(BuildOpts.mem_alloc, 'RT_MALLOC')
        ppdef = horzcat(ppdef, 'RT_MALLOC');
    end % if
    % 122 124
    if isunix
        ppdef = horzcat(ppdef, 'UNIX');
    end % if
    % 126 128
    h.addDefines(ppdef, standardGroup);
    h.addIncludePaths(incPaths, incGroups);
    h.addSourcePaths(srcPaths, srcGroups);
    h.addSourceFiles(srcFiles, srcFilePaths, srcFileGroups);
    % 131 134
    % 132 134
    if strcmp(get_param(h.ModelHandle, 'ModelReferenceTargetType'), 'NONE')
        % 134 136
        h.addSourceFiles(noMdlRefFiles, noMdlRefFilePaths, noMdlRefFileGroups);
    end % if
    % 137 140
    % 138 140
    locAddExtMode(h);
function locAddExtMode(h)
    % 141 160
    % 142 160
    % 143 160
    % 144 160
    % 145 160
    % 146 160
    % 147 160
    % 148 160
    % 149 160
    % 150 160
    % 151 160
    % 152 160
    % 153 160
    % 154 160
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    try
        % 160 162
        if strcmp('off', get_param(h.ModelHandle, 'ExtMode'))
            return;
        end % if
    catch
        % 165 168
        % 166 168
        lasterr('');
        sllasterror('');
        return;
    end % try
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    extModeSources{3.0} = 'ext_work.c';
    extModeSources{2.0} = 'updown.c';
    extModeSources{1.0} = 'ext_svr.c';
    extModePaths(1.0:length(extModeSources)) = cellhorzcat(horzcat(matlabroot, '/rtw/c/src/ext_mode/common'));
    % 179 181
    try
        % 181 185
        % 182 185
        % 183 185
        extModeTrans = get_param(h.ModelHandle, 'ExtModeTransport');
        switch extModeTrans
        case 0.0
            extModeSources{plus(end, 1.0)} = 'ext_svr_tcpip_transport.c';
            extModePaths{plus(end, 1.0)} = horzcat(matlabroot, '/rtw/c/src/ext_mode/tcpip');
            % 189 191
            h.addSourceFiles(extModeSources, extModePaths, 'EXT_MODE');
        case 1.0
            extModeSources{plus(end, 1.0)} = 'ext_svr_tcpip_transport.c';
            extModePaths{plus(end, 1.0)} = horzcat(matlabroot, '/rtw/c/src/ext_mode/tcpip');
            % 194 196
            h.addSourceFiles(extModeSources, extModePaths, 'EXT_MODE');
        end % switch
        % 197 200
        % 198 200
        if strcmp('on', get_param(h.ModelHandle, 'ExtModeTesting'))
            h.addSourceFiles('ext_test.c', horzcat(matlabroot, '/test/toolbox/simulink/extmode'), 'EXT_MODE');
            % 201 204
            % 202 204
        end % if
        % 204 207
        % 205 207
        if strcmp('on', get_param(h.ModelHandle, 'ExtModeStaticAlloc'))
            h.addSourceFiles('mem_mgr.c', horzcat(matlabroot, '/rtw/c/src/ext_mode/common'), 'EXT_MODE');
            % 208 211
            % 209 211
        end % if
    catch
        % 212 215
        % 213 215
        lasterr('');
        sllasterror('');
    end % try
