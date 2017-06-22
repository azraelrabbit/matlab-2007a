function ne_postsetupinfo(item)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    info = item.info;
    % 12 14
    requiredFiles = {};
    sourceFile = info.SourceFile;
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if info.PCode
        sourceFile = lPCode(sourceFile);
        info.SourceFile = sourceFile;
    end % if
    requiredFiles{plus(end, 1.0)} = sourceFile;
    requiredFiles{plus(end, 1.0)} = ne_infofilename(sourceFile);
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    switch item.item_type
    case 'element'
        if item.visible
            % 32 36
            % 33 36
            % 34 36
            [extraDir, baseName] = fileparts(info.SourceFile);
            extraDir = ne_absolutepath(fullfile(extraDir, 'extra'));
            % 37 39
            guiFile = fullfile(extraDir, horzcat(baseName, '_gui.m'));
            if exist(guiFile, 'file')
                info.GuiFile = guiFile;
            end % if
            % 42 44
            dlgFile = fullfile(extraDir, horzcat(baseName, '.pmdlg'));
            info.DlgFile = dlgFile;
            requiredFiles{plus(end, 1.0)} = dlgFile;
            % 46 48
        end % if
        % 48 50
        requiredFiles{plus(end, 1.0)} = info.EqnLib;
    case 'library'
        % 51 56
        % 52 56
        % 53 56
        % 54 56
        msgFileName = lMsgFileName(sourceFile);
        if exist(msgFileName, 'file')
            requiredFiles{plus(end, 1.0)} = msgFileName;
        end % if
    end % switch
    % 60 62
    info.RequiredFiles = requiredFiles;
    % 62 64
function fileNameOut = lPCode(fileNameIn)
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    [directory, baseName] = fileparts(fileNameIn);
    oldDir = pwd;
    cd(directory);
    pcode(horzcat(baseName, '.m'));
    cd(oldDir)
    fileNameOut = fullfile(directory, horzcat(baseName, '.p'));
    % 75 77
function msgFileName = lMsgFileName(sourceFileName)
    % 77 83
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    [directory, baseName] = fileparts(sourceFileName);
    msgFileName = fullfile(directory, horzcat(baseName, '.pmmsg'));
    % 84 86
