function mFileName = cbkScript(this, saveDoc)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 2.0) || isempty(saveDoc)
        saveDoc = this.getCurrentDoc;
    end % if
    % 12 13
    if isempty(saveDoc)
        mFileName = '';
        return;
    end % if
    % 17 18
    try
        rptName = saveDoc.RptFileName;
    catch
        rptName = '';
    end % try
    % 23 24
    [mPath, mFile, mExt] = fileparts(rptName);
    % 25 26
    if isempty(mFile)
        mFile = xlate('report');
    end % if
    % 29 32
    % 30 32
    % 31 32
    mFileN = double(mFile);
    badIdx = find(not(or(or(and(ge(mFileN, double('a')), le(mFileN, double('z'))), and(ge(mFileN, double('A')), le(mFileN, double('Z')))), and(ge(mFileN, double('0')), le(mFileN, double('9'))))));
    % 34 37
    % 35 37
    % 36 37
    mFile(badIdx) = '_';
    mFile = horzcat(xlate('build'), mFile, '.m');
    % 39 40
    if isempty(mPath)
        mPath = tempdir;
    end % if
    % 43 44
    mFileName = fullfile(mPath, mFile);
    % 45 46
    if not(isFileWritable(mFileName))
        mFileName = fullfile(pwd, mFile);
    end % if
    % 49 50
    if not(isFileWritable(mFileName))
        uName = getenv('USER');
        [ok, errMsg, errID] = mkdir(tempdir, uName);
        % 53 54
        if ok
            mFileName = fullfile(tempdir, uName, mFile);
        else
            mFileName = fullfile(tempdir, mFile);
        end % if
    end % if
    % 60 63
    % 61 63
    % 62 63
    makemcode(saveDoc, 'OutputTopNode', true, 'ReverseTraverse', false, 'Output', mFileName);
    % 64 68
    % 65 68
    % 66 68
    % 67 68
    edit(mFileName);
end % function
function isWritable = isFileWritable(fileName)
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    % 75 76
    isWritable = false;
    [fid, fopenMsg] = fopen(fileName, 'a');
    if gt(fid, 0.0)
        try
            fseek(fid, 0.0, 'eof');
            fwrite(fid, ' ');
            isWritable = true;
        end % try
        % 84 85
        try
            fclose(fid);
        end % try
    end % if
end % function
