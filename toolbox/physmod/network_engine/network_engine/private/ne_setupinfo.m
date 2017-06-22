function ne_setupinfo(fileName, info, parentInfo)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    info.clear;
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    infoFileName = ne_infofilename(fileName);
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    needsUpdate = true;
    if exist(infoFileName, 'file')
        % 25 29
        % 26 29
        % 27 29
        ne_readinfofile(infoFileName, info);
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        if ne_comparefilenames(info.SourceFile, fileName, true)
            needsUpdate = false;
            % 35 40
            % 36 40
            % 37 40
            % 38 40
            info.SourceFile = fileName;
        end
        % 41 43
    end
    % 43 45
    if needsUpdate
        % 45 49
        % 46 49
        % 47 49
        info.clear;
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        info.SourceFile = fileName;
        % 54 59
        % 55 59
        % 56 59
        % 57 59
        info.Directory = fileparts(fileName);
        % 59 64
        % 60 64
        % 61 64
        % 62 64
        if isempty(fileName)
            toPCode = false;
            prodString = '';
        else
            toPCode = lGetPCodeStatus(fileName);
            if isempty(toPCode)
                if isempty(parentInfo)
                    toPCode = false;
                else
                    toPCode = parentInfo.PCode;
                end
            end
            % 75 88
            % 76 88
            % 77 88
            % 78 88
            % 79 88
            % 80 88
            % 81 88
            % 82 88
            % 83 88
            % 84 88
            % 85 88
            % 86 88
            prodString = lGetProduct(fileName);
            % 88 90
        end
        % 90 92
        if isempty(prodString)
            % 92 97
            % 93 97
            % 94 97
            % 95 97
            if not(isempty(parentInfo))
                prodString = parentInfo.Product;
            else
                % 99 103
                % 100 103
                % 101 103
                pmDefaultProduct = pm_private('pm_defaultproduct');
                prodString = pmDefaultProduct();
            end
        end
        % 106 108
        info.PCode = toPCode;
        info.Product = prodString;
        % 109 114
        % 110 114
        % 111 114
        % 112 114
        dependencies = cellhorzcat(fileName);
        if not(isempty(parentInfo)) && not(isempty(parentInfo.SourceFile))
            dependencies{plus(end, 1.0)} = strrep(parentInfo.SourceFile, '.p', '.m');
        end
        % 117 119
        info.Dependencies = dependencies;
    end
end
function toPCode = lGetPCodeStatus(fileName)
    % 122 125
    % 123 125
    [fid, msg] = fopen(fileName, 'r');
    if eq(fid, -1.0)
        error(msg);
    end
    % 128 130
    toPCode = [];
    while not(feof(fid))
        s = fgetl(fid);
        if not(isempty(regexp(s, 'NOPCODE')))
            toPCode = false;
        else
            if not(isempty(regexp(s, 'PCODE')))
                toPCode = true;
            end
        end
        if not(isempty(toPCode))
            break
        end
    end % while
    % 143 145
    fclose(fid);
end
function productSting = lGetProduct(fileName)
    % 147 150
    % 148 150
    [fid, msg] = fopen(fileName, 'r');
    if eq(fid, -1.0)
        error(msg);
    end
    % 153 155
    patternStr = '(?<keyWord>\.*PRODUCT\s*=\s*)\''\.*(?<prodStr>[\w\s]*)\''';
    productSting = [];
    while not(feof(fid))
        s = fgetl(fid);
        myMatch = regexp(s, patternStr, 'names');
        if not(isempty(myMatch))
            productSting = myMatch.prodStr;
            break
        end
    end % while
    % 164 166
    fclose(fid);
end
