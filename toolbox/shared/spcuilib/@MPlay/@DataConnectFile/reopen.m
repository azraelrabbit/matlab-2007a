function reopen(dcfObj, fName)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if gt(nargin, 1.0)
        dcfObj.fileName = fName;
    end % if
    % 13 16
    % 14 16
    % 15 16
    CacheFileInfo(dcfObj);
end % function
function CacheFileInfo(dcfObj)
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    [p, n, fileExt] = fileparts(dcfObj.fileName);
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    try
        % 39 42
        % 40 42
        % 41 42
        full_name = use_vipinfo_fcns(dcfObj);
    catch
        % 44 46
        % 45 46
        full_name = use_aviinfo_fcns(dcfObj);
    end % try
    % 48 51
    % 49 51
    % 50 51
    install_source_name(dcfObj, full_name);
end % function
function full_name = use_vipinfo_fcns(dcfObj)
    % 54 58
    % 55 58
    % 56 58
    % 57 58
    full_name = '';
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    % 63 64
    all_fid = fopen('all');
    fileInfo = vipaviread([], dcfObj.fileName);
    duplicate_fid = any(eq(all_fid, fileInfo.fid));
    % 67 70
    % 68 70
    % 69 70
    dcfObj.UserData = fileInfo;
    % 71 72
    switch fileInfo.aviInfo.VideoFrameHeader.ImageType
    case 'truecolor'
        dcfObj.colorSpace = 'rgb';
    otherwise
        dcfObj.colorSpace = 'intensity';
    end % switch
    dcfObj.frameRate = fileInfo.aviInfo.MainHeader.FramesPerSecond;
    dcfObj.frameRows = fileInfo.aviInfo.MainHeader.Height;
    dcfObj.frameCols = fileInfo.aviInfo.MainHeader.Width;
    dcfObj.numFrames = fileInfo.aviInfo.MainHeader.TotalFrames;
    % 82 85
    % 83 85
    % 84 85
    temp = vipaviread(fileInfo, 1.0);
    dcfObj.dataType = class(temp.lastFrame);
    dcfObj.UserData = temp;
    % 88 90
    % 89 90
    dcfObj.colorMap = temp.colormap;
    % 91 93
    % 92 93
    if duplicate_fid
        % 94 99
        % 95 99
        % 96 99
        % 97 99
        % 98 99
        dcfObj.streamHandle = [];
    else
        dcfObj.streamHandle = fileInfo.fid;
    end % if
    % 103 107
    % 104 107
    % 105 107
    % 106 107
    full_name = fileInfo.aviInfo.Filename;
    % 108 110
    % 109 110
    dcfObj.reader = 0.0;
    dcfObj.errorStatus = 'success';
end % function
function full_name = use_aviinfo_fcns(dcfObj)
    % 114 117
    % 115 117
    % 116 117
    full_name = '';
    % 118 119
    try
        fileInfo = aviinfo(dcfObj.fileName);
    catch
        dcfObj.errorMsg = lasterr;
        return;
    end % try
    switch fileInfo.ImageType
    case 'truecolor'
        dcfObj.colorSpace = 'rgb';
    case {'indexed','grayscale'}
        dcfObj.colorSpace = 'intensity';
    otherwise
        dcfObj.errorMsg = sprintf('Unsupported AVI image type "%s"', fileInfo.ImageType);
        % 132 134
        % 133 134
        return;
    end % switch
    dcfObj.frameRate = fileInfo.FramesPerSecond;
    dcfObj.frameRows = fileInfo.Height;
    dcfObj.frameCols = fileInfo.Width;
    dcfObj.numFrames = fileInfo.NumFrames;
    % 140 144
    % 141 144
    % 142 144
    % 143 144
    temp = aviread(dcfObj.fileName, 1.0);
    if isempty(temp)
        % 146 148
        % 147 148
        A(1.0).cdata = uint8([]);
        A(1.0).colormap = [];
    end % if
    dcfObj.dataType = class(temp(1.0).cdata);
    % 152 154
    % 153 154
    dcfObj.colorMap = temp(1.0).colormap;
    % 155 159
    % 156 159
    % 157 159
    % 158 159
    dcfObj.streamHandle = [];
    % 160 164
    % 161 164
    % 162 164
    % 163 164
    full_name = fileInfo.Filename;
    % 165 167
    % 166 167
    dcfObj.reader = 1.0;
    dcfObj.errorStatus = 'success';
end % function
function install_source_name(dcfObj, fname)
    % 171 177
    % 172 177
    % 173 177
    % 174 177
    % 175 177
    % 176 177
    dcfObj.type = 'File';
    % 178 179
    if lt(nargin, 2.0)
        fname = dcfObj.filename;
    end % if
    % 182 187
    % 183 187
    % 184 187
    % 185 187
    % 186 187
    full_file_name = which(fname);
    if isempty(full_file_name)
        % 189 191
        % 190 191
        full_file_name = dcfObj.filename;
    end % if
    % 193 195
    % 194 195
    dcfObj.sourceName = full_file_name;
    % 196 198
    % 197 198
    [p, n, e] = fileparts(full_file_name);
    dcfObj.sourceNameShort = horzcat(n, e);
end % function
