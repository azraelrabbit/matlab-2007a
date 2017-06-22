function ssgenpilsfunpost(rootSFunName, origBlk, tmpSSBlk)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    ertSFunMexFile = horzcat(cd, filesep, rootSFunName, '_sf');
    pilSFunMexFile = horzcat(cd, filesep, rootSFunName, '_pil_sf');
    % 10 11
    ertSFunMexFileInfo = dir(which(ertSFunMexFile));
    pilSFunMexFileInfo = dir(which(pilSFunMexFile));
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    if not(eq(exist(ertSFunMexFile), 3.0)) || not(eq(exist(pilSFunMexFile), 3.0)) || gt(datenum(ertSFunMexFileInfo.date), datenum(pilSFunMexFileInfo.date))
        % 20 22
        % 21 22
        return;
    end % if
    % 24 26
    % 25 26
    spacing = 50.0;
    % 27 29
    % 28 29
    SLLib = 'simulink3';
    load_system(SLLib);
    % 31 33
    % 32 33
    origBlkName = strrep(get_param(origBlk, 'Name'), '/', '//');
    origBlkPos = get_param(origBlk, 'Position');
    widthBlk = minus(origBlkPos(3.0), origBlkPos(1.0));
    heightBlk = minus(origBlkPos(4.0), origBlkPos(2.0));
    parentOrigBlk = get_param(origBlk, 'Parent');
    % 38 40
    % 39 40
    libName = local_GetUniqueLibraryName(rootSFunName);
    hLib = new_system(libName, 'Library');
    save_system(hLib);
    % 43 45
    % 44 45
    [yPos, titleWidth, titleHeight] = local_AddTitleText(horzcat(parentOrigBlk, '/', origBlkName), libName, spacing, widthBlk);
    % 46 48
    % 47 48
    xPos = plus(spacing, plus(spacing, widthBlk));
    srcBlk = sprintf(horzcat(SLLib, '/Subsystems/Configurable\nSubsystem'));
    newConfigSSName = horzcat(origBlkName, sprintf('\n(Configurable Subsystem)'));
    % 51 52
    configSSOpenFcn = 'if strcmp(get_param(bdroot(gcbh), ''BlockDiagramType''), ''model''),  open_system(gcbh, ''force''); end';
    % 53 56
    % 54 56
    % 55 56
    hNewConfigSS = add_block(srcBlk, horzcat(libName, '/', newConfigSSName), 'Position', horzcat(xPos, yPos, plus(xPos, widthBlk), plus(yPos, heightBlk)), 'Orientation', get_param(origBlk, 'Orientation'), 'NamePlacement', get_param(origBlk, 'NamePlacement'), 'OpenFcn', configSSOpenFcn);
    % 57 63
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    yPos = plus(plus(yPos, heightBlk), mtimes(.75, spacing));
    % 64 65
    [yPos, buttonSize] = local_AddButtonBlocks(origBlk, parentOrigBlk, hNewConfigSS, yPos, spacing);
    % 66 68
    % 67 68
    xPos = spacing;
    newSSName = origBlkName;
    add_block(origBlk, horzcat(libName, '/', newSSName), 'Position', horzcat(xPos, yPos, plus(xPos, widthBlk), plus(yPos, heightBlk)));
    % 71 74
    % 72 74
    % 73 74
    xPos = plus(xPos, plus(spacing, widthBlk));
    newERTSSName = horzcat(origBlkName, sprintf('\n(SIL)'));
    % 76 77
    [stubbed, reasonStubbed] = local_isSILStubbedOut(rootSFunName);
    if not(stubbed)
        % 79 80
        add_block(tmpSSBlk, horzcat(libName, '/', newERTSSName), 'Position', horzcat(xPos, yPos, plus(xPos, widthBlk), plus(yPos, heightBlk)), 'MaskDisplay', 'disp(''SIL'')');
    else
        % 82 83
        % 83 85
        % 84 85
        hNewERTSS = add_block('built-in/Subsystem', horzcat(libName, '/', newERTSSName), 'Position', horzcat(xPos, yPos, plus(xPos, widthBlk), plus(yPos, heightBlk)), 'MaskDisplay', 'disp(''SIL'')', 'ForegroundColor', 'gray');
        % 86 90
        % 87 90
        % 88 90
        % 89 90
        reasonFormatted = strrep(reasonStubbed, char(10.0), '\n');
        set_param(hNewERTSS, 'MaskInitialization', horzcat('error(sprintf(''\n', reasonFormatted, '''));'));
        % 92 93
        add_block('built-in/Note', horzcat(libName, '/', newERTSSName, '/', reasonStubbed), 'Position', [100.0 100.0 100.0 20.0], 'HorizontalAlignment', 'left', 'DropShadow', 'on');
        % 94 98
        % 95 98
        % 96 98
        % 97 98
    end % if
    % 99 101
    % 100 101
    xPos = plus(xPos, plus(spacing, widthBlk));
    newPILSSName = horzcat(origBlkName, sprintf('\n(PIL)'));
    hNewPILSS = add_block(tmpSSBlk, horzcat(libName, '/', newPILSSName), 'Position', horzcat(xPos, yPos, plus(xPos, widthBlk), plus(yPos, heightBlk)), 'MaskDisplay', 'disp(''PIL'')');
    % 104 106
    % 105 106
    hNewPILSFcn = find_system(hNewPILSS, 'LookUnderMasks', 'all', 'SearchDepth', 1.0, 'BlockType', 'S-Function');
    % 107 108
    set_param(hNewPILSFcn, 'rtw_sf_name', horzcat(rootSFunName, '_pil_sf'));
    % 109 111
    % 110 111
    set_param(hNewConfigSS, 'MemberBlocks', strrep(horzcat(strrep(newSSName, '//', '/'), ',', strrep(newERTSSName, '//', '/'), ',', strrep(newPILSSName, '//', '/')), sprintf('\n'), ' '), 'BlockChoice', strrep(strrep(newSSName, '//', '/'), sprintf('\n'), ' '), 'AttributesFormatString', '%<BlockChoice>', 'ShowName', 'off');
    % 112 119
    % 113 119
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    % 118 119
    libWidth = max(plus(mtimes(3.0, widthBlk), mtimes(4.0, spacing)), plus(titleWidth, spacing));
    libHeight = plus(plus(plus(titleHeight, mtimes(2.0, heightBlk)), mtimes(2.0, buttonSize)), mtimes(3.75, spacing));
    set_param(hLib, 'Location', plus(spacing, horzcat(0.0, 0.0, libWidth, libHeight)));
    % 122 123
    set_param(hLib, 'Lock', 'on');
    save_system(hLib);
    % 125 127
    % 126 127
    bdclose(bdroot(tmpSSBlk));
    open_system(hLib);
end % function
function fileName = local_GetUniqueLibraryName(baseName)
    % 131 136
    % 132 136
    % 133 136
    % 134 136
    % 135 136
    baseName = horzcat(baseName(1.0:max(find(gt(baseName, '9')))), '_lib');
    fileName = baseName;
    counter = 1.0;
    % 139 141
    % 140 141
        while eq(exist(fileName), 4.0)
        fileName = horzcat(baseName, num2str(counter));
        counter = plus(counter, 1.0);
    end % while
end % function
function [newYPos, titleWidth, titleHeight] = local_AddTitleText(fullOrigBlkName, libName, spacing, widthBlk)
    % 147 149
    % 148 149
    titleWidth = 270.0;
    % 150 151
    xPos = minus(plus(mtimes(2.0, spacing), mtimes(1.5, widthBlk)), mrdivide(titleWidth, 2.0));
    yPos = mrdivide(spacing, 3.0);
    % 153 155
    % 154 155
    rtwVer = ver('rtw');
    rtwVer = rtwVer.Version;
    fullOrigBlkName = strrep(fullOrigBlkName, sprintf('\n'), ' ');
    % 158 160
    % 159 160
    titleText = sprintf(horzcat(libName, '/\n', '  *** Generated Processor-in-the-Loop Simulink Library ***  \n', '\n', '    Real-Time Workshop %s\n', '    Generated on: %s\n', '\n', '    Original subsystem:\n', '      %s\n'), rtwVer, datestr(now, 31.0), strrep(fullOrigBlkName, '/', '//'));
    % 161 171
    % 162 171
    % 163 171
    % 164 171
    % 165 171
    % 166 171
    % 167 171
    % 168 171
    % 169 171
    % 170 171
    add_block('built-in/Note', titleText, 'Position', horzcat(xPos, yPos, xPos, yPos), 'HorizontalAlignment', 'left', 'DropShadow', 'on');
    % 172 176
    % 173 176
    % 174 176
    % 175 176
    titleHeight = 130.0;
    newYPos = plus(plus(yPos, titleHeight), mtimes(.75, spacing));
end % function
function [newYPos, buttonSize] = local_AddButtonBlocks(hOrigBlk, parentOrigBlk, hNewConfigSS, yPos, spacing)
    % 180 181
    buttonSize = 25.0;
    xPos = mrdivide(spacing, 2.0);
    % 183 185
    % 184 185
    libName = get_param(bdroot(hNewConfigSS), 'Name');
    fullInsertBlkName = horzcat(libName, sprintf('/Insert Configurable Subsystem'));
    fullRevertBlkName = horzcat(libName, sprintf('/Revert to Original Subsystem'));
    % 188 190
    % 189 190
    origBlkName = get_param(hOrigBlk, 'Name');
    configSSName = get_param(hNewConfigSS, 'Name');
    % 192 193
    fullOrigBlkName = horzcat(parentOrigBlk, '/', strrep(origBlkName, '/', '//'));
    fullConfigSSName = horzcat(parentOrigBlk, '/', strrep(configSSName, '/', '//'));
    % 195 197
    % 196 197
    fullButtonName = fullInsertBlkName;
    buttonMaskType = 'Insert Configurable Subsystem';
    buttonMaskDisplay = 'disp(''==>'');';
    buttonDescription = sprintf('Replace the original subsystem in the model\nwith the configurable subsystem from this library.');
    % 201 203
    % 202 203
    buttonMaskVariables = 'configSSName=@1;fullOrigBlkName=@2;';
    buttonMaskPrompts = {'Configurable subsystem:','Original subsystem:'};
    buttonMaskValues = cellhorzcat(configSSName, fullOrigBlkName);
    buttonOpenFcn = 'target_pil_replace_config_subsys(''insert'', bdroot, get_param(gcb, ''configSSName''), get_param(gcb, ''fullOrigBlkName''));';
    % 207 208
    buttonPos = horzcat(xPos, yPos, plus(xPos, buttonSize), plus(yPos, buttonSize));
    buttonText = horzcat(libName, '/', buttonDescription);
    buttonTextPos = horzcat(plus(buttonPos(3.0), 15.0), buttonPos(2.0), plus(buttonPos(3.0), 15.0), buttonPos(2.0));
    yPos = plus(plus(yPos, buttonSize), mrdivide(spacing, 5.0));
    % 212 213
    add_block('built-in/Subsystem', fullButtonName, 'Position', buttonPos, 'BackgroundColor', 'cyan', 'DropShadow', 'on', 'ShowName', 'off', 'MaskType', buttonMaskType, 'MaskDescription', buttonDescription, 'MaskDisplay', buttonMaskDisplay, 'MaskVariables', buttonMaskVariables, 'MaskPrompts', buttonMaskPrompts, 'MaskValues', buttonMaskValues, 'OpenFcn', buttonOpenFcn);
    % 214 225
    % 215 225
    % 216 225
    % 217 225
    % 218 225
    % 219 225
    % 220 225
    % 221 225
    % 222 225
    % 223 225
    % 224 225
    add_block('built-in/Note', buttonText, 'Position', buttonTextPos, 'HorizontalAlignment', 'left');
    % 226 230
    % 227 230
    % 228 230
    % 229 230
    fullButtonName = fullRevertBlkName;
    buttonMaskType = 'Revert to Original Subsystem';
    buttonMaskDisplay = 'disp(''<=='');';
    buttonDescription = sprintf('Replace the configurable subsystem in the model\nwith the copy of the original subsystem in this library.');
    % 234 236
    % 235 236
    buttonMaskVariables = 'origBlkName=@1;fullConfigSSName=@2;';
    buttonMaskPrompts = {'Original subsystem:','Configurable subsystem:'};
    buttonMaskValues = cellhorzcat(origBlkName, fullConfigSSName);
    buttonOpenFcn = 'target_pil_replace_config_subsys(''revert'', bdroot, get_param(gcb, ''origBlkName''), get_param(gcb, ''fullConfigSSName''));';
    % 240 241
    buttonPos = horzcat(xPos, yPos, plus(xPos, buttonSize), plus(yPos, buttonSize));
    buttonText = horzcat(libName, '/', buttonDescription);
    buttonTextPos = horzcat(plus(buttonPos(3.0), 15.0), buttonPos(2.0), plus(buttonPos(3.0), 15.0), buttonPos(2.0));
    yPos = plus(plus(yPos, buttonSize), mrdivide(spacing, 5.0));
    % 245 246
    add_block('built-in/Subsystem', fullButtonName, 'Position', buttonPos, 'BackgroundColor', 'cyan', 'DropShadow', 'on', 'ShowName', 'off', 'MaskType', buttonMaskType, 'MaskDescription', buttonDescription, 'MaskDisplay', buttonMaskDisplay, 'MaskVariables', buttonMaskVariables, 'MaskPrompts', buttonMaskPrompts, 'MaskValues', buttonMaskValues, 'OpenFcn', buttonOpenFcn);
    % 247 258
    % 248 258
    % 249 258
    % 250 258
    % 251 258
    % 252 258
    % 253 258
    % 254 258
    % 255 258
    % 256 258
    % 257 258
    add_block('built-in/Note', buttonText, 'Position', buttonTextPos, 'HorizontalAlignment', 'left');
    % 259 262
    % 260 262
    % 261 262
    newYPos = plus(yPos, mtimes(.75, spacing));
end % function
function [stubbed, reasonStubbed] = local_isSILStubbedOut(codeGenModelName)
    % 265 271
    % 266 271
    % 267 271
    % 268 271
    % 269 271
    % 270 271
    lerr = lasterror;
    try
        % 273 274
        gensilsfun = get_param(codeGenModelName, 'GenerateSilSFunction');
    catch
        % 276 277
        stubbed = false;
        reasonStubbed = '';
        % 279 281
        % 280 281
        lasterror(lerr);
        return;
    end % try
    if strcmp(gensilsfun, 'off')
        stubbed = true;
        reasonStubbed = sprintf('An SIL S-function was not built for this model. The SIL S-function\nbuild is not supported if either\n\n     a) ISO C is selected\n     b) The model contains referenced models\n\nTo enable the SIL S-function build, you must make sure ANSI C is\nselected and that the model does not contain any model reference\nblocks.');
    else
        % 288 296
        % 289 296
        % 290 296
        % 291 296
        % 292 296
        % 293 296
        % 294 296
        % 295 296
        % 296 297
        stubbed = false;
        reasonStubbed = '';
    end % if
end % function
