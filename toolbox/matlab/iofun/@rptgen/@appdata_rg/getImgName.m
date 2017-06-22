function out = getImgName(adRG, varargin)
    % 1 35
    % 2 35
    % 3 35
    % 4 35
    % 5 35
    % 6 35
    % 7 35
    % 8 35
    % 9 35
    % 10 35
    % 11 35
    % 12 35
    % 13 35
    % 14 35
    % 15 35
    % 16 35
    % 17 35
    % 18 35
    % 19 35
    % 20 35
    % 21 35
    % 22 35
    % 23 35
    % 24 35
    % 25 35
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if eq(length(varargin), 1.0)
        clearImageFiles(adRG.ImageDirectory, varargin{1.0});
        out = varargin{1.0};
    else
        [imgName, relName, isNew] = LocImageName(adRG, varargin{:});
        out.fullname = imgName;
        out.relname = relName;
        out.isnew = isNew;
    end % if
function [imageDescriptions, fileName] = loadImageList(dirName)
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    fileName = fullfile(dirName, 'image-filelist.mat');
    % 49 51
    if exist(fileName, 'file')
        try
            load(fileName, '-mat');
        end % try
    end % if
    % 55 57
    if not(exist('imageDescriptions', 'var'))
        imageDescriptions = struct('sourceID', {}, 'imgID', {}, 'fileName', {}, 'idx', {});
        % 58 62
        % 59 62
        % 60 62
    end % if
function saveImageList(listFileName, imageDescriptions, sourceID, ext, fileName, idx)
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    if isempty(imageDescriptions)
        % 68 70
        imageDescriptions(plus(end, 1.0)) = struct('sourceID', '-&report&generator&image&file&list&-', 'imgID', '-&none&-', 'fileName', listFileName, 'idx', -1.0);
        % 70 74
        % 71 74
        % 72 74
    end % if
    % 74 76
    imageDescriptions(plus(end, 1.0)) = struct('sourceID', sourceID, 'imgID', ext, 'fileName', fileName, 'idx', idx);
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    save(listFileName, 'imageDescriptions');
function [fullPathName, relPathName, isNew] = LocImageName(h, ext, descString, sourceID)
    % 82 89
    % 83 89
    % 84 89
    % 85 89
    % 86 89
    % 87 89
    if not(exist(h.ImageDirectory, 'dir'))
        [rootDir, newDir] = fileparts(h.ImageDirectory);
        status = mkdir(rootDir, newDir);
        if eq(status, 0.0)
            % 92 94
            if exist(rootDir, 'dir')
                h.ImageDirectory = rootDir;
                h.ImageDirectoryRelative = './';
            else
                h.ImageDirectory = tempdir;
                h.ImageDirectoryRelative = rptgen.file2urn(tempdir);
                if not(strcmp(h.ImageDirectoryRelative(end), '/'))
                    h.ImageDirectoryRelative(plus(end, 1.0)) = '/';
                end % if
            end % if
        else
            % 104 106
            h.ImageDirectoryRelative = horzcat('./', newDir, '/');
        end % if
    else
        % 108 110
    end % if
    % 110 112
    if lt(nargin, 4.0)
        isRecord = 0.0;
        if lt(nargin, 3.0)
            descString = 'etc';
        end % if
    else
        [oList, imlistFilename] = loadImageList(h.ImageDirectory);
        if gt(length(oList), 0.0) && not(get(h.RootComponent, 'isRegenerateImages'))
            sourceIndex = find(strcmp(cellhorzcat(oList.sourceID), sourceID));
            % 120 122
            if not(isempty(sourceIndex))
                % 122 124
                imgIndex = find(strcmp(cellhorzcat(oList(sourceIndex).imgID), ext));
                if not(isempty(imgIndex))
                    sourceIndex = sourceIndex(imgIndex(1.0));
                else
                    sourceIndex = [];
                end % if
            end % if
        else
            sourceIndex = [];
        end % if
        % 133 135
        if gt(length(sourceIndex), 0.0)
            % 135 137
            isRecord = sourceIndex(1.0);
        else
            isRecord = -1.0;
        end % if
    end % if
    % 141 146
    % 142 146
    % 143 146
    % 144 146
    if gt(isRecord, 0.0)
        imgName = oList(isRecord).fileName;
        fullPathName = fullfile(h.ImageDirectory, imgName);
        if exist(fullPathName, 'file')
            isNew = false;
        else
            % 151 153
            isRecord = -1.0;
            % 153 156
            % 154 156
        end % if
    end % if
    % 157 159
    if le(isRecord, 0.0)
        isNew = true;
        imgNum = max(length(dir(fullfile(h.ImageDirectory, 'image*.*'))), 1.0);
        okFile = false;
            while not(okFile)
            imgName = sprintf('image-%0.3i-%s.%s', imgNum, descString, ext);
            % 164 168
            % 165 168
            % 166 168
            fullPathName = fullfile(h.ImageDirectory, imgName);
            okFile = not(exist(fullPathName, 'file'));
            imgNum = plus(imgNum, 1.0);
        end % while
        imgNum = minus(imgNum, 1.0);
        % 172 174
        if lt(isRecord, 0.0)
            % 174 176
            saveImageList(imlistFilename, oList, sourceID, ext, imgName, imgNum);
        end % if
    end % if
    % 178 180
    relPathName = horzcat(h.ImageDirectoryRelative, imgName);
function clearImageFiles(imgDir, clearAll)
    % 181 185
    % 182 185
    % 183 185
    if exist(imgDir, 'dir')
        if clearAll
            oldRecycle = recycle('off');
            delete(fullfile(imgDir, 'image-*.*'));
            recycle(oldRecycle);
        else
            safeFileDesc = loadImageList(imgDir);
            safeFiles = cellhorzcat(safeFileDesc.fileName);
            % 192 194
            allFiles = dir(fullfile(imgDir, 'image-*.*'));
            if not(isempty(allFiles))
                allFiles = cellhorzcat(allFiles.name);
                % 196 198
                if not(isempty(safeFiles))
                    delFiles = setdiff(allFiles, safeFiles);
                else
                    delFiles = allFiles;
                end % if
                % 202 204
                for i=1.0:length(delFiles)
                    delete(fullfile(imgDir, delFiles{i}));
                    % 205 207
                end % for
            end % if
        end % if
    end % if
