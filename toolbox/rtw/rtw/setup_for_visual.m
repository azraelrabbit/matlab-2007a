function oString = setup_for_visual(args)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    if isfield(args, 'EnvVarSuggestions')
        % 21 23
        [dummy, oString] = LocGetEnvVarSuggestions(LocGetMSD);
        % 23 25
        return;
    else
        % 26 28
        [oString, bat_struct] = LocNormalSetup(args);
        % 28 30
    end % if
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if eq(exist(args.modelName, 'file'), 4.0)
        % 35 37
        makeRTWObj = get_param(args.modelName, 'MakeRTWSettingsObject');
        makeRTWObj.InstallDirmexopts = horzcat('"$(MATLAB_BIN)\$(ML_ARCH)\mexopts\', bat_struct.originalmexOpts, '.bat"');
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        if isempty(makeRTWObj.BuildInfo.InstallDirmexopts)
            makeRTWObj.BuildInfo.InstallDirmexopts = makeRTWObj.InstallDirmexopts;
            % 44 46
        end % if
        if not(bat_struct.specified_via_makeCmd)
            makeRTWObj.CompilerName = '_vc.tmf';
        else
            makeRTWObj.CompilerName = 'MAKECMD_vc.tmf';
        end % if
    end % if
function [oMakeCmd, bat_struct] = LocNormalSetup(args)
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    msd = LocGetMSD;
    [bat_struct.msDevDir, additionalInfo] = LocGetMSDevDir(args.makeCmd, args.compilerEnvVal, msd);
    bat_struct.specified_via_makeCmd = additionalInfo.specified_via_makeCmd;
    % 61 63
    bat_struct.platformSDKdir = '';
    bat_struct.msVcDir = '';
    bat_struct.vcvars32 = '';
    bat_struct.vcverOnes = '';
    bat_struct.vcverHundreds = '';
    bat_struct.originalmexOpts = '';
    % 68 70
    if not(isempty(bat_struct.msDevDir))
        switch additionalInfo.msvcver
        case {'710'}
            bat_struct.devstudio = RTW.reduceRelativePath(fullfile(bat_struct.msDevDir, '..', '..'));
            bat_struct.msVcDir = fullfile(bat_struct.devstudio, msd{1.0}.VCRelLoc);
            bat_struct.vcvars32 = horzcat(matlabroot, '\toolbox\rtw\rtw\private\vcvars32_', msd{1.0}.HundredsVers, '.bat');
            % 75 77
            bat_struct.vcverOnes = msd{1.0}.OnesVers;
            bat_struct.vcverHundreds = msd{1.0}.HundredsVers;
            bat_struct.originalmexOpts = msd{1.0}.originalmexOpts;
        case {'600'}
            % 80 82
            bat_struct.devstudio = RTW.reduceRelativePath(fullfile(bat_struct.msDevDir, '..', '..'));
            bat_struct.msVcDir = fullfile(bat_struct.devstudio, msd{2.0}.VCRelLoc);
            bat_struct.vcvars32 = horzcat(matlabroot, '\toolbox\rtw\rtw\private\vcvars32_', msd{2.0}.HundredsVers, '.bat');
            % 84 86
            bat_struct.vcverOnes = msd{2.0}.OnesVers;
            bat_struct.vcverHundreds = msd{2.0}.HundredsVers;
            bat_struct.originalmexOpts = msd{2.0}.originalmexOpts;
        case {'800'}
            % 89 91
            bat_struct.devstudio = RTW.reduceRelativePath(fullfile(bat_struct.msDevDir, '..', '..'));
            bat_struct.msVcDir = fullfile(bat_struct.devstudio, msd{3.0}.VCRelLoc);
            bat_struct.vcvars32 = horzcat(matlabroot, '\toolbox\rtw\rtw\private\vcvars32_', msd{3.0}.HundredsVers, '.bat');
            % 93 95
            bat_struct.vcverOnes = msd{3.0}.OnesVers;
            bat_struct.vcverHundreds = msd{3.0}.HundredsVers;
            bat_struct.originalmexOpts = msd{3.0}.originalmexOpts;
        case {'800free'}
            % 98 100
            bat_struct.devstudio = RTW.reduceRelativePath(fullfile(bat_struct.msDevDir, '..', '..'));
            bat_struct.msVcDir = fullfile(bat_struct.devstudio, msd{4.0}.VCRelLoc);
            bat_struct.vcvars32 = horzcat(matlabroot, '\toolbox\rtw\rtw\private\vcvars32_', msd{4.0}.HundredsVers, '.bat');
            % 102 104
            bat_struct.vcverOnes = msd{4.0}.OnesVers;
            bat_struct.vcverHundreds = msd{4.0}.HundredsVers;
            bat_struct.originalmexOpts = msd{4.0}.originalmexOpts;
        otherwise
            % 107 111
            % 108 111
            % 109 111
            for i=1.0:length(msd)
                % 111 117
                % 112 117
                % 113 117
                % 114 117
                % 115 117
                bat_struct.devstudio = LocPrefix(bat_struct.msDevDir, msd{i}.IDERelLoc);
                % 117 124
                % 118 124
                % 119 124
                % 120 124
                % 121 124
                % 122 124
                if not(isempty(dir(horzcat(bat_struct.msDevDir, msd{i}.uniqueFileRel)))) && not(isempty(bat_struct.devstudio))
                    % 124 126
                    bat_struct.msVcDir = horzcat(bat_struct.devstudio, msd{i}.VCRelLoc);
                    % 126 133
                    % 127 133
                    % 128 133
                    % 129 133
                    % 130 133
                    % 131 133
                    bat_struct.vcvars32 = horzcat(matlabroot, '\toolbox\rtw\rtw\private\vcvars32_', msd{i}.HundredsVers, '.bat');
                    % 133 135
                    bat_struct.vcverOnes = msd{i}.OnesVers;
                    bat_struct.vcverHundreds = msd{i}.HundredsVers;
                    bat_struct.originalmexOpts = msd{i}.originalmexOpts;
                    break
                end % if
            end % for
        end % switch
        % 141 144
        % 142 144
        if strcmp(bat_struct.vcverHundreds, '800free')
            % 144 146
            bat_struct.platformSDKdir = parsestrforvar(args.makeCmd, 'MSSDK_LOC');
            % 146 149
            % 147 149
            if isempty(bat_struct.platformSDKdir)
                bat_struct.platformSDKdir = additionalInfo.platformSDKdir;
            end % if
            % 151 154
            % 152 154
            if isempty(bat_struct.platformSDKdir)
                bat_struct.platformSDKdir = getenv('MSSdk');
            end % if
            % 156 159
            % 157 159
            if isempty(bat_struct.platformSDKdir)
                bat_struct.platformSDKdir = '%MSSdk%';
            end % if
        end % if
    end % if
    % 163 165
    if not(isempty(bat_struct.msVcDir))
        oMakeCmd = LocWriteBatFile(args.makeCmd, args.modelName, args.verbose, bat_struct);
    else
        LocIssueMSDevError(bat_struct.msDevDir, msd);
    end % if
function makeCmdOut = LocWriteBatFile(makeCmd, modelName, verbose, bat_struct)
    % 170 176
    % 171 176
    % 172 176
    % 173 176
    % 174 176
    endl = sprintf('\n');
    % 176 178
    cmdFile = horzcat('.\', modelName, '.bat');
    cmdFileFid = fopen(cmdFile, 'wt');
    if not(verbose)
        fprintf(cmdFileFid, '@echo off\n');
    end % if
    fprintf(cmdFileFid, 'set MATLAB=%s\n', matlabroot);
    fprintf(cmdFileFid, 'set MSVCDir=%s\n', bat_struct.msVcDir);
    if strcmp(bat_struct.vcverHundreds, '800free')
        fprintf(cmdFileFid, '%s', horzcat('set MSSdk=', bat_struct.platformSDKdir, endl));
        fprintf(cmdFileFid, '%s', horzcat('@if "%MSSdk%"=="" goto Usage1', endl));
    end % if
    % 188 190
    fprintf(cmdFileFid, '%s', endl);
    % 190 193
    % 191 193
    switch bat_struct.vcverHundreds
    case {'600'}
        % 194 196
        fprintf(cmdFileFid, 'set MSDevDir=%s\n', bat_struct.msDevDir);
    case {'710'}
        % 197 200
        % 198 200
        LocEnvCheck(cmdFileFid, 'INCLUDE', horzcat(bat_struct.msVcDir, '\platformsdk\include'));
    case {'800'}
        LocEnvCheck(cmdFileFid, 'INCLUDE', horzcat(bat_struct.msVcDir, '\platformsdk\include'));
    case {'800free'}
        LocEnvCheck(cmdFileFid, 'INCLUDE', horzcat(bat_struct.platformSDKdir, '\include'));
        LocEnvCheck(cmdFileFid, 'PATH', horzcat(bat_struct.platformSDKdir, '\bin'));
        LocEnvCheck(cmdFileFid, 'LIB', horzcat(bat_struct.platformSDKdir, '\lib'));
        LocEnvCheck(cmdFileFid, 'LIBPATH', horzcat(bat_struct.platformSDKdir, '\lib'));
    end % switch
    LocEnvCheck(cmdFileFid, 'INCLUDE', horzcat(bat_struct.msVcDir, '\include'));
    LocEnvCheck(cmdFileFid, 'PATH', horzcat(bat_struct.msVcDir, '\bin'));
    fprintf(cmdFileFid, 'goto make\n');
    % 211 215
    % 212 215
    % 213 215
    fprintf(cmdFileFid, '\n:vcvars32\n');
    switch bat_struct.vcverHundreds
    case {'600'}
        fprintf(cmdFileFid, 'set VSCommonDir=%s\n', horzcat(bat_struct.devstudio, '\common'));
    case {'710'}
        % 219 232
        % 220 232
        % 221 232
        % 222 232
        % 223 232
        % 224 232
        % 225 232
        % 226 232
        % 227 232
        % 228 232
        % 229 232
        % 230 232
        fprintf(cmdFileFid, '%s', horzcat('set VSINSTALLDIR=', bat_struct.msDevDir, endl, 'set VCINSTALLDIR=', bat_struct.devstudio, endl, 'set FrameworkSDKDir=', bat_struct.devstudio, '\FrameworkSDK', endl, 'set FrameworkDir=', bat_struct.devstudio, '\Framework', endl));
        % 233 238
        % 234 238
        % 235 238
        % 236 238
    case {'800','800free'}
        % 237 239
        fprintf(cmdFileFid, '%s', horzcat('set VSINSTALLDIR=', bat_struct.devstudio, endl, 'set VCINSTALLDIR=', bat_struct.msVcDir, endl, 'set FrameworkSDKDir=', bat_struct.devstudio, '\SDK\v2.0', endl, 'set FrameworkDir=', bat_struct.devstudio, '\Framework', endl));
        % 239 245
        % 240 245
        % 241 245
        % 242 245
        % 243 245
    end % switch
    % 245 247
    fprintf(cmdFileFid, '%s\n', horzcat('call "', bat_struct.vcvars32, '"'));
    % 247 251
    % 248 251
    % 249 251
    fprintf(cmdFileFid, '\n:make\ncd .\n');
    fprintf(cmdFileFid, '%s\n', horzcat(makeCmd, ' VISUAL_VER=', bat_struct.vcverOnes));
    % 252 268
    % 253 268
    % 254 268
    % 255 268
    % 256 268
    % 257 268
    % 258 268
    % 259 268
    % 260 268
    % 261 268
    % 262 268
    % 263 268
    % 264 268
    % 265 268
    % 266 268
    fprintf(cmdFileFid, '@if errorlevel 1 goto error_exit\n');
    fprintf(cmdFileFid, 'exit /B 0\n');
    % 269 271
    if strcmp(bat_struct.vcverHundreds, '800free')
        fprintf(cmdFileFid, '\n:Usage1\n');
        fprintf(cmdFileFid, '%s\n', '@echo Error: Build with MSVC 8.0 express edition requires MSSdk being defined as the location of Microsoft platformSDK installation.');
        % 273 275
        fprintf(cmdFileFid, '@goto error_exit\n');
    end % if
    % 276 280
    % 277 280
    % 278 280
    fprintf(cmdFileFid, '\n:error_exit\n');
    fprintf(cmdFileFid, '%s\n', 'echo The make command returned an error of %errorlevel%');
    % 281 283
    fprintf(cmdFileFid, 'An_error_occurred_during_the_call_to_make\n');
    % 283 285
    fclose(cmdFileFid);
    makeCmdOut = cmdFile;
function LocEnvCheck(cmdFileFid, var, val)
    % 287 294
    % 288 294
    % 289 294
    % 290 294
    % 291 294
    % 292 294
    fprintf(cmdFileFid, '%s\n', horzcat('"', matlabroot, '\rtw\bin\win32\envcheck" ', var, ' "', val, '"'));
    % 294 296
    fprintf(cmdFileFid, '%s\n', 'if errorlevel 1 goto vcvars32');
function LocIssueMSDevError(msDevDir, msd)
    % 297 303
    % 298 303
    % 299 303
    % 300 303
    % 301 303
    [checkEnvVal, correctSetting] = LocGetEnvVarSuggestions(msd);
    % 303 305
    issue_inv_comp_env_val_error('MSDevDir or DevEnvDir', msDevDir, checkEnvVal, correctSetting);
function [oVCVarsBats, oMSDevDirs] = LocGetEnvVarSuggestions(msd)
    % 306 314
    % 307 314
    % 308 314
    % 309 314
    % 310 314
    % 311 314
    % 312 314
    oVCVarsBats = '';
    oMSDevDirs = '';
    for i=1.0:length(msd)
        % 316 318
        endStr = horzcat('(for Visual C/C++ ', msd{i}.OnesVers, ')', sprintf('\n'));
        % 318 320
        ideLocVar = horzcat('%', msd{i}.IDELocVar, '%');
        % 320 322
        varsBatLoc = horzcat('  ', ideLocVar, msd{i}.VarsBatRel);
        % 322 324
        setCmd = horzcat('  set ', ideLocVar, '=<VisualRoot>', msd{i}.IDERelLoc);
        % 324 326
        oVCVarsBats = horzcat(oVCVarsBats, sprintf('%-45s', varsBatLoc), endStr);
        % 326 328
        oMSDevDirs = horzcat(oMSDevDirs, sprintf('%-45s', setCmd), endStr);
    end % for
function [msDevDir, additionalInfo] = LocGetMSDevDir(makeCmd, compilerEnvVal, msd)
    % 330 337
    % 331 337
    % 332 337
    % 333 337
    % 334 337
    % 335 337
    additionalInfo.specified_via_makeCmd = false;
    additionalInfo.platformSDKdir = '';
    additionalInfo.msvcver = '';
    % 339 341
    m = LocGetMSDevDirFromRootFromCmd(msd, makeCmd, 'DEVSTUDIO_LOC');
    % 341 343
    if isempty(m)
        % 343 345
        m = parsestrforvar(makeCmd, 'MSDevDir_LOC');
    end % if
    % 346 349
    % 347 349
    if not(isempty(m))
        additionalInfo.specified_via_makeCmd = true;
    end % if
    % 351 353
    if isempty(m)
        % 353 355
        m = LocGetMSDevDirFromRoot(msd, compilerEnvVal, [], true);
        % 355 357
    end % if
    % 357 359
    if isempty(m)
        % 359 361
        [m, dummy, otherOpts] = parse_mexopts_for_envval('_vc.tmf');
        additionalInfo.msvcver = otherOpts.msvcver;
        additionalInfo.platformSDKdir = otherOpts.platformSDKdir;
        % 363 365
    end % if
    % 365 370
    % 366 370
    % 367 370
    % 368 370
    if isempty(m)
        % 370 372
        vstooldir = getenv('VS71COMNTOOLS');
        if not(isempty(vstooldir))
            m = LocGetMSDevDirFromRoot(msd, fullfile(vstooldir, '..', '..'), 'VS71COMNTOOLS');
        end % if
    end % if
    % 376 378
    if isempty(m)
        % 378 380
        vstooldir = getenv('VS80COMNTOOLS');
        if not(isempty(vstooldir))
            m = LocGetMSDevDirFromRoot(msd, fullfile(vstooldir, '..', '..'), 'VS80COMNTOOLS');
        end % if
    end % if
    % 384 386
    if isempty(m)
        % 386 388
        m = LocGetMSDevDirFromRootFromEnv(msd, 'VISUAL_STUDIO');
        % 388 390
    end % if
    if isempty(m)
        % 391 393
        m = getenv('MSDevDir');
        % 393 395
    end % if
    if isempty(m)
        % 396 398
        m = getenv('DevEnvDir');
        % 398 400
    end % if
    % 400 402
    msDevDir = RTW.reduceRelativePath(lower(m));
function msd = LocGetMSD
    % 403 410
    % 404 410
    % 405 410
    % 406 410
    % 407 410
    % 408 410
    msd{1.0}.IDERelLoc = '\common7\ide';
    msd{2.0}.IDERelLoc = '\common\msdev98';
    msd{3.0}.IDERelLoc = '\common7\ide';
    msd{4.0}.IDERelLoc = '\common7\ide';
    % 413 415
    msd{1.0}.IDELocVar = 'DevEnvDir';
    msd{2.0}.IDELocVar = 'MSDevDir';
    msd{3.0}.IDELocVar = 'DevEnvDir';
    msd{4.0}.IDELocVar = 'DevEnvDir';
    % 418 420
    msd{1.0}.VarsBatRel = '\..\tools\vsvars32.bat';
    msd{2.0}.VarsBatRel = '\..\..\vc98\bin\vcvars32.bat';
    msd{3.0}.VarsBatRel = '\..\tools\vsvars32.bat';
    msd{4.0}.VarsBatRel = '\..\tools\vsvars32.bat';
    % 423 425
    msd{1.0}.uniqueFileRel = '\..\..\Vc7';
    msd{2.0}.uniqueFileRel = '\..\..\vc98\bin\vcvars32.bat';
    msd{3.0}.uniqueFileRel = '\..\..\VC\platformSDK';
    msd{4.0}.uniqueFileRel = '\..\..\VC\vcvarsall.bat';
    % 428 430
    msd{1.0}.VCRelLoc = '\vc7';
    msd{2.0}.VCRelLoc = '\vc98';
    msd{3.0}.VCRelLoc = '\VC';
    msd{4.0}.VCRelLoc = '\VC';
    % 433 437
    % 434 437
    % 435 437
    msd{1.0}.HundredsVers = '710';
    msd{2.0}.HundredsVers = '600';
    msd{3.0}.HundredsVers = '800';
    msd{4.0}.HundredsVers = '800free';
    % 440 443
    % 441 443
    msd{1.0}.OnesVers = '7.1';
    msd{2.0}.OnesVers = '6.0';
    msd{3.0}.OnesVers = '8.0';
    msd{4.0}.OnesVers = '8.0';
    % 446 449
    % 447 449
    msd{1.0}.originalmexOpts = 'msvc71opts';
    msd{2.0}.originalmexOpts = 'msvc60opts';
    msd{3.0}.originalmexOpts = 'msvc80opts';
    msd{4.0}.originalmexOpts = 'msvc80freeopts';
function m = LocGetMSDevDirFromRootFromCmd(msd, iCmd, iSrcVar)
    % 453 457
    % 454 457
    % 455 457
    m = LocGetMSDevDirFromRoot(msd, parsestrforvar(iCmd, iSrcVar), iSrcVar);
function m = LocGetMSDevDirFromRootFromEnv(msd, iSrcVar)
    % 458 464
    % 459 464
    % 460 464
    % 461 464
    % 462 464
    m = LocGetMSDevDirFromRoot(msd, getenv(iSrcVar), iSrcVar);
function oMSDevDir = LocGetMSDevDirFromRoot(msd, iRoot, iSrcVar, silent)
    % 465 473
    % 466 473
    % 467 473
    % 468 473
    % 469 473
    % 470 473
    % 471 473
    if lt(nargin, 4.0)
        silent = false;
    end % if
    oMSDevDir = '';
    % 476 478
    if not(isempty(iRoot))
        % 478 480
        iRoot = lower(iRoot);
        % 480 482
        for i=1.0:length(msd)
            IDEAbsLoc = horzcat(iRoot, msd{i}.IDERelLoc);
            if exist(IDEAbsLoc, 'dir')
                oMSDevDir = IDEAbsLoc;
            end % if
        end % for
        % 487 489
        if isempty(oMSDevDir)
            if silent
                oMSDevDir = iRoot;
                return;
            end % if
            % 493 495
            aba = '(angle brackets added):';
            inst = 'an installation of Microsoft Developer Studio';
            action = horzcat('to find ', inst);
            VarErrStr = horzcat('variable: ', iSrcVar);
            DAStudio.error('RTW:compilerConfig:incompatibleVersion', action, aba, iRoot, action, VarErrStr, inst, inst, inst);
            % 499 501
        end % if
    end % if
function r = LocPrefix(str, suffix)
    % 503 510
    % 504 510
    % 505 510
    % 506 510
    % 507 510
    % 508 510
    r = '';
    startLocs = strfind(str, suffix);
    st = length(str);
    su = length(suffix);
    % 513 515
    if not(isempty(startLocs)) && eq(plus(minus(st, su), 1.0), startLocs(end))
        r = str(1.0:minus(startLocs(end), 1.0));
    end % if
