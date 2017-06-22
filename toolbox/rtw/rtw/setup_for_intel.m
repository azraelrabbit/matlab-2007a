function makeCmdOut = setup_for_intel(args)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    makeCmd = args.makeCmd;
    modelName = args.modelName;
    verbose = args.verbose;
    % 18 21
    % 19 21
    % 20 21
    [ic_info, specified_via_makeCmd] = LocGetIntelCompilerInfo(args);
    % 22 23
    if not(isempty(ic_info.root_dir))
        if isempty(dir(horzcat(ic_info.Bin)))
            DAStudio.error('RTW:compilerConfig:compilerNotFound', 'Intel compiler', ic_info.root_dir, 'Intel Compiler');
            % 26 27
        end % if
        % 28 32
        % 29 32
        % 30 32
        % 31 32
        if eq(exist(args.modelName, 'file'), 4.0)
            makeRTWObj = get_param(args.modelName, 'MakeRTWSettingsObject');
            makeRTWObj.InstallDirmexopts = '$(MATLAB_BIN)\win32\mexopts\intelc71opts.bat';
            % 35 38
            % 36 38
            % 37 38
            if isempty(makeRTWObj.BuildInfo.InstallDirmexopts)
                makeRTWObj.BuildInfo.InstallDirmexopts = makeRTWObj.InstallDirmexopts;
                % 40 41
            end % if
            if not(specified_via_makeCmd)
                makeRTWObj.CompilerName = '_intel.tmf';
            else
                makeRTWObj.CompilerName = 'MAKECMD_intel.tmf';
            end % if
        end % if
        cmdFile = horzcat('.\', modelName, '.bat');
        cmdFileFid = fopen(cmdFile, 'wt');
        if not(verbose)
            fprintf(cmdFileFid, '@echo off\n');
        end % if
        fprintf(cmdFileFid, 'set MATLAB=%s\n', matlabroot);
        fprintf(cmdFileFid, 'set INTEL=%s\n', ic_info.root_dir);
        fprintf(cmdFileFid, 'set MSVCDir=%s\n', ic_info.msvc.VCRelLoc);
        % 56 61
        % 57 61
        % 58 61
        % 59 61
        % 60 61
        if rtwprivate('rtwinbat')
            fprintf(cmdFileFid, 'set LM_LICENSE_FILE=\n');
        end % if
        % 64 65
        endl = sprintf('\n\n');
        % 66 68
        % 67 68
        LocEnvCheck(cmdFileFid, 'PATH', ic_info.Bin);
        LocEnvCheck(cmdFileFid, 'PATH', ic_info.msvc.IDERelLoc);
        LocEnvCheck(cmdFileFid, 'PATH', ic_info.msvc.BinLoc);
        % 71 72
        LocEnvCheck(cmdFileFid, 'INCLUDE', ic_info.Inc);
        LocEnvCheck(cmdFileFid, 'INCLUDE', ic_info.msvc.IncLoc);
        % 74 75
        LocEnvCheck(cmdFileFid, 'LIB', ic_info.Lib);
        LocEnvCheck(cmdFileFid, 'LIB', ic_info.msvc.LibLoc);
        % 77 80
        % 78 80
        % 79 80
        fprintf(cmdFileFid, '\ngoto make\n');
        fprintf(cmdFileFid, '\n:setuppath\n');
        % 82 83
        fprintf(cmdFileFid, '%s', horzcat('set PATH=', ic_info.Bin, ';', ic_info.msvc.IDERelLoc, ';', ic_info.msvc.BinLoc, ';%PATH%', endl, 'set INCLUDE=', ic_info.Inc, ';', ic_info.msvc.IncLoc, ';%INCLUDE%', endl, 'set LIB=', ic_info.Lib, ';', ic_info.msvc.LibLoc, ';%LIB%', endl));
        % 84 95
        % 85 95
        % 86 95
        % 87 95
        % 88 95
        % 89 95
        % 90 95
        % 91 95
        % 92 95
        % 93 95
        % 94 95
        fprintf(cmdFileFid, '\n:make\ncd .\n');
        fprintf(cmdFileFid, '%s\n', makeCmd);
        fprintf(cmdFileFid, '@if errorlevel 1 goto error_exit\n');
        fprintf(cmdFileFid, 'exit /B 0\n');
        % 99 102
        % 100 102
        % 101 102
        fprintf(cmdFileFid, '\n:error_exit\n');
        fprintf(cmdFileFid, '%s\n', 'echo The make command returned an error of %errorlevel%');
        % 104 105
        fprintf(cmdFileFid, 'An_error_occurred_during_the_call_to_make\n');
        % 106 108
        % 107 108
        fclose(cmdFileFid);
        makeCmdOut = cmdFile;
    else
        if isempty(ic_info.root_dir)
            DAStudio.error('RTW:compilerConfig:compilerNotFound', 'Intel compiler', ic_info.root_dir, 'Intel Compiler');
            % 113 114
        end % if
        makeCmdOut = makeCmd;
    end % if
end % function
function LocEnvCheck(cmdFileFid, var, val)
    % 119 123
    % 120 123
    % 121 123
    % 122 123
    fprintf(cmdFileFid, '%s\n', horzcat('"', matlabroot, '\rtw\bin\win32\envcheck" ', var, ' "', val, '"'));
    % 124 125
    fprintf(cmdFileFid, '%s\n', 'if errorlevel 1 goto setuppath');
end % function
function [ic_info, specified_via_makeCmd] = LocGetIntelCompilerInfo(args)
    % 128 133
    % 129 133
    % 130 133
    % 131 133
    % 132 133
    specified_via_makeCmd = false;
    % 134 136
    % 135 136
    if isempty(args.mexOpts)
        [intel_root_dir, suffix, mexOpts] = parse_mexopts_for_envval('');
    else
        mexOpts = args.mexOpts;
    end % if
    % 141 143
    % 142 143
    intel_dir = parsestrforvar(args.makeCmd, 'INTEL_LOC');
    if not(exist(intel_dir, 'dir'))
        intel_dir = '';
    end % if
    % 147 149
    % 148 149
    if isempty(intel_dir)
        intel_dir = args.compilerEnvVal;
    else
        specified_via_makeCmd = true;
    end % if
    % 154 156
    % 155 156
    if isempty(intel_dir)
        intel_dir = intel_root_dir;
    end % if
    % 159 161
    % 160 161
    ic_info.msvc = LocGetMSVC(args.makeCmd, mexOpts);
    % 162 164
    % 163 164
    ic_info.Vers = '7.1';
    ic_info.root_dir = intel_dir;
    ic_info.Bin = horzcat(ic_info.root_dir, '\Bin');
    ic_info.Inc = horzcat(ic_info.root_dir, '\Include');
    ic_info.Lib = horzcat(ic_info.root_dir, '\Lib');
end % function
function msdt = LocGetMSDTable
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    % 176 177
    msdt{1.0}.Vers = '6.0';
    msdt{2.0}.Vers = '7.1';
    % 179 180
    msdt{1.0}.IDERelLoc = '\common\msdev98\bin';
    msdt{2.0}.IDERelLoc = '\common7\ide';
    % 182 183
    msdt{1.0}.VCRelLoc = '\vc98';
    msdt{2.0}.VCRelLoc = '\vc7';
    % 185 186
    msdt{1.0}.IncLoc = '\include';
    msdt{2.0}.IncLoc = '\include';
    % 188 189
    msdt{1.0}.BinLoc = '\bin';
    msdt{2.0}.BinLoc = '\bin';
    % 191 192
    msdt{1.0}.LibLoc = '\lib';
    msdt{2.0}.LibLoc = '\lib';
end % function
function msvc = LocGetMSVC(makeCmd, mexOpts)
    % 196 199
    % 197 199
    % 198 199
    msdTable = LocGetMSDTable;
    % 200 201
    msvcRoot = parsestrforvar(makeCmd, 'DEVSTUDIO_LOC');
    % 202 203
    msvc = LocGetMSVCFromRootDir(msdTable, msvcRoot, 'DEVSTUDIO_LOC');
    % 204 205
    if isempty(msvc)
        msvcRoot = LocRemUpDir(horzcat(mexOpts.msvcdir, '\..'));
        msvc = LocGetMSVCFromRootDir(msdTable, msvcRoot, 'mexopts');
    end % if
end % function
function msvc = LocGetMSVCFromRootDir(msdTable, msvcRoot, iSrcVar)
    % 211 215
    % 212 215
    % 213 215
    % 214 215
    msvc = [];
    if not(isempty(msvcRoot))
        for i=1.0:length(msdTable)
            VCRelLoc = horzcat(msvcRoot, msdTable{i}.VCRelLoc);
            if exist(VCRelLoc, 'dir')
                msvc.VCRelLoc = VCRelLoc;
                msvc.IDERelLoc = horzcat(msvcRoot, msdTable{i}.IDERelLoc);
                msvc.IncLoc = horzcat(msvc.VCRelLoc, msdTable{i}.IncLoc);
                msvc.BinLoc = horzcat(msvc.VCRelLoc, msdTable{i}.BinLoc);
                msvc.LibLoc = horzcat(msvc.VCRelLoc, msdTable{i}.LibLoc);
            end % if
        end % for
        % 227 228
        if isempty(msvc)
            % 229 230
            aba = '(angle brackets added):';
            inst = 'an installation of Microsoft Developer Studio';
            action = horzcat('to find ', inst);
            % 233 234
            if strcmp(iSrcVar, 'mexopts')
                VarErrStr = 'MSVCDir variable defined in mexopts.bat';
            else
                VarErrStr = horzcat('environment variable ', aba, sprintf('\n\n    '), '<', iSrcVar, '>.');
                % 238 240
                % 239 240
            end % if
            DAStudio.error('RTW:compilerConfig:incompatibleVersion', action, aba, msvcRoot, action, VarErrStr, inst, inst, inst);
            % 242 244
            % 243 244
        end % if
    end % if
end % function
function y = LocRemUpDir(x)
    % 248 254
    % 249 254
    % 250 254
    % 251 254
    % 252 254
    % 253 254
    slash = '[\\/]';
    word = '\w+';
    dot = '\.';
    % 257 258
    y = regexprep(x, horzcat(slash, word, slash, dot, dot), '');
end % function
