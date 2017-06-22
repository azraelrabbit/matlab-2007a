function [oVal1, oVal2] = modelrefutil(modelName, info, detail)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    oVal1 = '';
    oVal2 = '';
    binExt = '_msf';
    % 11 13
    switch info
    case 'getBinExt'
        oVal1 = binExt;
    case 'getSimTargetName'
        % 16 18
        oVal1 = horzcat(modelName, binExt, '.', mexext);
    case 'getRTWTargetFullName'
        % 19 22
        % 20 22
        cache = rtwinfomatman(pwd, 'load', 'minfo', modelName, 'RTW');
        if detail
            % 23 25
            tgtLang = 'C';
            savedLastErr = lasterr;
            try
                tgtLang = get_param(modelName, 'TargetLang');
            catch
                load_system(modelName);
                tgtLang = get_param(modelName, 'TargetLang');
                close_system(modelName);
                lasterr(savedLastErr);
            end % try
            % 34 36
            if strcmp(tgtLang, 'C') && not(feature('ForceRTWCPP'))
                oVal1 = fullfile(pwd, cache.srcDir, horzcat(modelName, '.c'));
            else
                oVal1 = fullfile(pwd, cache.srcDir, horzcat(modelName, '.cpp'));
            end
        else
            % 41 43
            oVal1 = fullfile(pwd, cache.modelLibFullName);
            if isempty(oVal1)
                DAStudio.error('RTW:utility:emptyValue', 'Model reference target file name');
                % 45 47
            end
        end
    case 'rtw_checkslprjdir'
        % 49 52
        % 50 52
        loc_rtw_check_slprj_dir(detail);
    case 'getLatestSlprjVersion'
        % 53 55
        oVal1 = loc_latest_slprj_version_str;
    case 'createSlprjMarkerFile'
        % 56 58
        loc_create_marker_file(detail)
    case 'featureName'
        % 59 61
        oVal1 = 'ModelReference';
    case 'createSlprjSimInternalDir'
        % 62 65
        % 63 65
        oVal1 = rtw_create_directory_path(pwd, 'slprj', 'sim', modelName, 'tmwinternal');
        % 65 68
        % 66 68
        modelrefutil('', 'createSlprjMarkerFile', pwd);
    case 'getHeadFileList'
        % 69 74
        % 70 74
        % 71 74
        % 72 74
        allFileList = dir(detail);
        headFileList = [];
        latestTimeStamp = '';
        latestID = 0.0;
        for fileIdx=1.0:length(allFileList)
            if strfind(allFileList(fileIdx).name, '.h')
                headFileList{plus(end, 1.0)} = allFileList(fileIdx).name;
                if isempty(latestTimeStamp) || ge(datenum(allFileList(fileIdx).date), latestTimeStamp)
                    latestTimeStamp = datenum(allFileList(fileIdx).date);
                    latestID = length(headFileList);
                end
            end
        end % for
        % 86 88
        if ne(latestID, 0.0)
            if ne(latestID, 1.0)
                % 89 91
                tmpName = headFileList{1.0};
                headFileList{1.0} = headFileList{latestID};
                headFileList{latestID} = tmpName;
            end
        end
        oVal1 = headFileList;
    case 'getSubmodelTargetType'
        % 97 102
        % 98 102
        % 99 102
        % 100 102
        if strcmpi(detail, 'accel')
            oVal1 = 'SIM';
        else
            oVal1 = 'RTW';
        end
    otherwise
        % 107 109
        DAStudio.error('RTW:buildProcess:modelrefutilUnknownInput', info);
    end
end
function slprjVersion = loc_latest_slprj_version_str
    % 112 122
    % 113 122
    % 114 122
    % 115 122
    % 116 122
    % 117 122
    % 118 122
    % 119 122
    % 120 122
    SLVer = ver('Simulink');
    localOffset = '_4';
    slprjVersion = horzcat(SLVer.Version, localOffset);
end
function loc_create_marker_file(anchorDir)
    % 126 132
    % 127 132
    % 128 132
    % 129 132
    % 130 132
    markerFile = fullfile(anchorDir, 'slprj', 'sl_proj.tmw');
    if not(exist(markerFile))
        rtw_create_directory_path(anchorDir, 'slprj');
        fid = fopen(markerFile, 'w');
        % 135 137
        lastestSlprjVersion = loc_latest_slprj_version_str;
        markerFileContents = sprintf(horzcat('Real-Time Workshop project marker file.', ' Please don''t change it. \n', 'slprjVersion: ', lastestSlprjVersion));
        % 138 141
        % 139 141
        fprintf(fid, markerFileContents);
        fclose(fid);
    end
end
function loc_rtw_check_slprj_dir(anchorDir)
    % 145 152
    % 146 152
    % 147 152
    % 148 152
    % 149 152
    % 150 152
    markerFile = fullfile(anchorDir, 'slprj', 'sl_proj.tmw');
    if exist(markerFile)
        fid = fopen(markerFile, 'r');
        if eq(fid, -1.0)
            DAStudio.error('RTW:utility:fileIOError', makerFile, 'open');
        end
        line1 = fgetl(fid);
        line2 = fgetl(fid);
        fclose(fid);
        % 160 162
        if isequal(line2, -1.0)
            % 162 165
            % 163 165
            currSlprjVer = '1';
        else
            currSlprjVer = deblank(strrep(line2, 'slprjVersion: ', ''));
        end
        % 168 170
        latestSlprjVer = loc_latest_slprj_version_str;
        % 170 172
        if not(strcmp(latestSlprjVer, currSlprjVer))
            errMsg = DAStudio.message('RTW:buildProcess:slprjVerIncompatible');
            if rtwprivate('rtwinbat')
                DAStudio.error('RTW:buildProcess:slprjVerIncompatible');
            else
                response = questdlg(errMsg, 'Attention:', 'Remove slprj and continue', 'Abort', 'Remove slprj and continue');
                % 177 182
                % 178 182
                % 179 182
                % 180 182
                if isempty(response) || strcmp(response, 'Abort')
                    DAStudio.error('RTW:buildProcess:codeGenAborted', errMsg);
                else
                    if strcmp(response, 'Remove slprj and continue')
                        [s, w] = rmdir('slprj', 's');
                        if not(s)
                            DAStudio.error('RTW:utility:removeError', w);
                        end
                        % 189 192
                        % 190 192
                        delete(horzcat('*_msf.', mexext));
                        % 192 194
                    end
                end
            end
        end
    end
end
