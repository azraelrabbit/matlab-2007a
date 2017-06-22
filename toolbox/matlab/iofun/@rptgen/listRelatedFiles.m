function relatedFiles = listRelatedFiles(fileName)
    % 1 27
    % 2 27
    % 3 27
    % 4 27
    % 5 27
    % 6 27
    % 7 27
    % 8 27
    % 9 27
    % 10 27
    % 11 27
    % 12 27
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    if lt(nargin, 1.0)
        error('File name not specified');
        return;
    end % if
    % 30 32
    newFileName = rptgen.findFile(fileName, false, 'rpt', 'xml', 'db', 'html', 'rtf', 'mif', 'sgml');
    % 32 35
    % 33 35
    if isempty(newFileName)
        error(sprintf('File "%s" not found', fileName));
    end % if
    % 37 39
    relatedFiles = LocRelated(newFileName);
function relFiles = LocRelated(fileName)
    % 40 44
    % 41 44
    % 42 44
    [fDir, fFile, fExt] = fileparts(fileName);
    % 44 46
    switch fExt
    case '.rpt'
        cRoot = rptgen.loadRpt(fileName);
        if isempty(cRoot)
            relFiles = {};
            return;
        end % if
        relFiles = cellhorzcat(fileName);
        c.getrptname;
        if exist(c.Output.DstFileName, 'file')
            relFiles{plus(end, 1.0), 1.0} = c.Output.DstFileName;
        end % if
        if exist(c.Output.SrcFileName, 'file')
            relFiles = vertcat(relFiles, LocRelated(c.Output.SrcFileName));
            % 59 61
        end % if
    case {'.xml','.db','.sgml'}
        sameName = dir(fullfile(fDir, horzcat(fFile, '.*')));
        relFiles = cellhorzcat(fileName);
        % 64 66
        for i=1.0:length(sameName)
            switch locExtension(sameName(i).name)
            case {'.xml','.db','.sgml','.rpt'}
            otherwise
                % 69 71
                relFiles = vertcat(relFiles, LocRelated(fullfile(fDir, sameName(i).name)));
            end % switch
        end % for
    case {'.m','.mat','.mdl','.p','.dll','.c','.h','.java','.class','.zip'}
        % 74 76
        relFiles = {};
    otherwise
        if gt(length(fExt), 1.0)
            dotlessExtension = lower(fExt(2.0:end));
        else
            dotlessExtension = '';
        end % if
        % 82 84
        extraFileDir = fullfile(fDir, horzcat(fFile, '_', dotlessExtension, '_files'));
        % 84 87
        % 85 87
        extraFiles = dir(fullfile(extraFileDir, '*.*'));
        % 87 89
        extraFileNames = cellhorzcat(extraFiles.name);
        extraFileNames = extraFileNames(not(horzcat(extraFiles.isdir)));
        if not(isempty(extraFileNames))
            extraFileNames = strcat(horzcat(extraFileDir, filesep), extraFileNames);
            % 92 94
            relFiles = vertcat(cellhorzcat(fileName), extraFileNames(:));
        else
            relFiles = cellhorzcat(fileName);
        end % if
    end % switch
function fileExt = locExtension(fileName)
    % 99 103
    % 100 103
    % 101 103
    dotLoc = strfind(fileName, '.');
    if not(isempty(dotLoc))
        fileExt = fileName(dotLoc(end):end);
    end % if
