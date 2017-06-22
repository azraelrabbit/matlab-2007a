function packNGo(buildInfo, varargin)
    % 1 48
    % 2 48
    % 3 48
    % 4 48
    % 5 48
    % 6 48
    % 7 48
    % 8 48
    % 9 48
    % 10 48
    % 11 48
    % 12 48
    % 13 48
    % 14 48
    % 15 48
    % 16 48
    % 17 48
    % 18 48
    % 19 48
    % 20 48
    % 21 48
    % 22 48
    % 23 48
    % 24 48
    % 25 48
    % 26 48
    % 27 48
    % 28 48
    % 29 48
    % 30 48
    % 31 48
    % 32 48
    % 33 48
    % 34 48
    % 35 48
    % 36 48
    % 37 48
    % 38 48
    % 39 48
    % 40 48
    % 41 48
    % 42 48
    % 43 48
    % 44 48
    % 45 48
    % 46 48
    [packType, fileName] = locCheckArgs(buildInfo, varargin{:});
    % 48 51
    % 49 51
    buildInfo.updateFilePathsAndExtensions();
    % 51 54
    % 52 54
    buildInfo.findIncludeFiles();
    % 54 57
    % 55 57
    save('buildInfo.mat', 'buildInfo');
    % 57 59
    switch packType
    case 'flat'
        locPackFlat(buildInfo, fileName);
    case 'hierarchical'
        locPackHierarchical(buildInfo, fileName);
    end
end
function locPackFlat(h, fileName)
    % 66 85
    % 67 85
    % 68 85
    % 69 85
    % 70 85
    % 71 85
    % 72 85
    % 73 85
    % 74 85
    % 75 85
    % 76 85
    % 77 85
    % 78 85
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    [fPathNames, names] = locGetAllFiles(h);
    % 85 88
    % 86 88
    locCheckForDups(fPathNames, names);
    % 88 92
    % 89 92
    % 90 92
    sDir = h.getSourcePaths(true, {'StartDir'});
    if isempty(sDir)
        sDir = cellhorzcat(pwd);
    end
    bDir = h.getSourcePaths(true, {'BuildDir'});
    if isempty(bDir)
        bDir = cellhorzcat(pwd);
    end
    % 99 102
    % 100 102
    allFiles = horzcat(fPathNames, fullfile(bDir{1.0}, 'buildInfo.mat'));
    % 102 105
    % 103 105
    zip(fullfile(sDir{1.0}, fileName), allFiles);
end
function locPackHierarchical(h, fileName)
    % 107 127
    % 108 127
    % 109 127
    % 110 127
    % 111 127
    % 112 127
    % 113 127
    % 114 127
    % 115 127
    % 116 127
    % 117 127
    % 118 127
    % 119 127
    % 120 127
    % 121 127
    % 122 127
    % 123 127
    % 124 127
    % 125 127
    [fPathNames, names] = locGetAllFiles(h);
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    sDir = strcat(h.getSourcePaths(true, {'StartDir'}), h.Settings.FileSep);
    % 132 134
    bDir = strcat(h.getSourcePaths(true, {'BuildDir'}), h.Settings.FileSep);
    % 134 136
    sDirRegexpID = regexptranslate('escape', sDir{1.0});
    % 136 138
    sDirFilesIdx = ~(cellfun(@isempty, regexp(fPathNames, sDirRegexpID)));
    sDirFiles = fPathNames(sDirFilesIdx);
    % 139 142
    % 140 142
    sDirFiles = horzcat(sDirFiles, fullfile(bDir{1.0}, 'buildInfo.mat'));
    % 142 145
    % 143 145
    sDirFiles = regexprep(sDirFiles, horzcat(sDirRegexpID, '(.*)'), '$1');
    % 145 148
    % 146 148
    fPathNames = fPathNames(~(sDirFilesIdx));
    names = names(~(sDirFilesIdx));
    % 149 153
    % 150 153
    % 151 153
    mlrID = horzcat(h.Settings.Matlabroot, h.Settings.FileSep);
    mlrRegexpID = regexptranslate('escape', mlrID);
    mlrFileIdx = ~(cellfun(@isempty, regexp(fPathNames, mlrRegexpID)));
    mlrFiles = fPathNames(mlrFileIdx);
    % 156 159
    % 157 159
    mlrFiles = regexprep(mlrFiles, horzcat(mlrRegexpID, '(.*)'), '$1');
    % 159 161
    [mlrParent, mlRootDir] = fileparts(h.Settings.Matlabroot);
    % 161 166
    % 162 166
    % 163 166
    % 164 166
    mlrFiles = strcat(horzcat(mlRootDir, h.Settings.FileSep), mlrFiles);
    % 166 169
    % 167 169
    fPathNames = fPathNames(~(mlrFileIdx));
    names = names(~(mlrFileIdx));
    % 170 175
    % 171 175
    % 172 175
    % 173 175
    if ~(isempty(fPathNames))
        % 175 177
        locCheckForDups(fPathNames, names);
    end
    % 178 181
    % 179 181
    zFile = fullfile(tempdir, 'mlrFiles.zip');
    zip(zFile, mlrFiles, mlrParent);
    zipFiles = cellhorzcat(zFile);
    % 183 185
    zFile = fullfile(tempdir, 'sDirFiles.zip');
    zip(zFile, sDirFiles, sDir{1.0});
    zipFiles = horzcat(zipFiles, zFile);
    % 187 189
    if ~(isempty(fPathNames))
        zFile = fullfile(tempdir, 'otherFiles.zip');
        zip(zFile, fPathNames);
        zipFiles = horzcat(zipFiles, zFile);
    end
    % 193 195
    zip(fullfile(sDir{1.0}, fileName), zipFiles);
end
function [fPathNames, names] = locGetAllFiles(h)
    % 197 221
    % 198 221
    % 199 221
    % 200 221
    % 201 221
    % 202 221
    % 203 221
    % 204 221
    % 205 221
    % 206 221
    % 207 221
    % 208 221
    % 209 221
    % 210 221
    % 211 221
    % 212 221
    % 213 221
    % 214 221
    % 215 221
    % 216 221
    % 217 221
    % 218 221
    % 219 221
    fPathNames = h.getSourceFiles(true, true);
    fPathNames = horzcat(fPathNames, h.getIncludeFiles(true, true));
    names = h.getSourceFiles(false, false);
    names = horzcat(names, h.getIncludeFiles(false, false));
    % 224 228
    % 225 228
    % 226 228
    for i=1.0:length(h.LinkObj)
        % 228 230
        if h.LinkObj(i).LinkOnly
            % 230 233
            % 231 233
            fPathNames = horzcat(fPathNames, fullfile(h.LinkObj(i).Path, h.LinkObj(i).Name));
            % 233 235
            names = horzcat(names, h.LinkObj(i).Name);
        else
            fPathNames = horzcat(fPathNames, h.LinkObj(i).getSourceFiles(true, true));
            fPathNames = horzcat(fPathNames, h.LinkObj(i).getIncludeFiles(true, true));
            names = horzcat(names, h.LinkObj(i).getSourceFiles(false, false));
            names = horzcat(names, h.LinkObj(i).getIncludeFiles(false, false));
        end
    end % for
    % 242 247
    % 243 247
    % 244 247
    % 245 247
    [fPathNames, idx] = RTW.unique(fPathNames);
    names = names(idx);
end
function locCheckForDups(fPathNames, names)
    % 250 270
    % 251 270
    % 252 270
    % 253 270
    % 254 270
    % 255 270
    % 256 270
    % 257 270
    % 258 270
    % 259 270
    % 260 270
    % 261 270
    % 262 270
    % 263 270
    % 264 270
    % 265 270
    % 266 270
    % 267 270
    % 268 270
    [uniqueNames, idx] = RTW.unique(names);
    % 270 272
    if ne(length(uniqueNames), length(names))
        tmp = names(idx);
        dupNames = {};
        for i=1.0:length(tmp)
            dup = fPathNames(strcmp(names, tmp{i}));
            % 276 278
            if gt(length(dup), 1.0)
                dupNames = horzcat(dupNames, dup);
            end
        end % for
        nameList = sprintf('%s\n', dupNames{:});
        DAStudio.error('RTW:buildInfo:duplicateFilesForPackNGo', nameList);
    end
end
function [packType, fileName] = locCheckArgs(h, varargin)
    % 286 308
    % 287 308
    % 288 308
    % 289 308
    % 290 308
    % 291 308
    % 292 308
    % 293 308
    % 294 308
    % 295 308
    % 296 308
    % 297 308
    % 298 308
    % 299 308
    % 300 308
    % 301 308
    % 302 308
    % 303 308
    % 304 308
    % 305 308
    % 306 308
    packType = 'flat';
    fileName = h.ModelName;
    % 309 313
    % 310 313
    % 311 313
    if lt(nargin, 2.0)
        return
    end
    % 315 318
    % 316 318
    if gt(nargin, 3.0)
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfo.packNGo');
        % 319 321
    end
    % 321 325
    % 322 325
    % 323 325
    propVals = varargin{1.0};
    if ~(iscellstr(propVals)) || ne(mrdivide(length(propVals), 2.0), floor(mrdivide(length(propVals), 2.0)))
        % 326 328
        DAStudio.error('RTW:buildInfo:badMethodArguments', 'RTW.BuildInfo.packNGo');
        % 328 330
    end
    % 330 332
    validPackVals = {'flat','hierarchical'};
    for i=1.0:2.0:minus(length(propVals), 1.0)
        switch propVals{i}
        case 'packType'
            if ~(ismember(propVals{plus(i, 1.0)}, validPackVals))
                DAStudio.error('RTW:buildInfo:invalidStringPropVal', 'packType', propVals{plus(i, 1.0)});
                % 337 339
            end
            packType = propVals{plus(i, 1.0)};
        case 'fileName'
            % 341 344
            % 342 344
            if ~(isempty(propVals{plus(i, 1.0)}))
                % 344 349
                % 345 349
                % 346 349
                % 347 349
                fileName = propVals{plus(i, 1.0)};
            end
        otherwise
            DAStudio.error('RTW:buildInfo:unknownProperty', propVals{i});
        end
    end % for
end
