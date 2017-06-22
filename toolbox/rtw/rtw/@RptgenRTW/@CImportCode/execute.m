function out = execute(thisComp, parentDoc, varargin)
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
    out = [];
    adSL = rptgen_sl.appdata_sl;
    switch lower(adSL.Context)
    case {'','model','none'}
        currObj = adSL.CurrentModel;
    otherwise
        % 26 28
        return
    end
    % 29 31
    srcsys = RptgenRTW.getSourceSubsystem;
    if ~(isempty(srcsys))
        currObj = srcsys;
    end
    % 34 36
    if isempty(currObj)
        thisComp.status(xlate('Model not found'), 1.0);
        return
    end
    % 39 43
    % 40 43
    % 41 43
    currModel = adSL.CurrentModel;
    % 43 45
    adRG = rptgen.appdata_rg;
    % 45 47
    html_dir = adRG.ImageDirectory;
    % 47 49
    src_dir = RptgenRTW.getBuildDir;
    % 49 51
    if ~(exist(src_dir, 'dir'))
        thisComp.status(xlate('Build directory not found'), 1.0);
        return
    end
    % 54 56
    if ~(exist(html_dir, 'dir'))
        try
            [success, msg, msgid] = mkdir(html_dir);
            if ~(success)
                error(msgid, msg);
            end
        catch
            [lastmsg, lastid] = lasterr;
            error(lastid, lastmsg);
        end % try
    end
    % 66 68
    out = parentDoc.createDocumentFragment;
    % 68 70
    src_files = {};
    % 70 72
    [mdlfilesC, rtwfilesC] = RptgenRTW.getGeneratedCodeList(currObj, src_dir, {'c','cpp'});
    % 72 75
    % 73 75
    [mdlfilesH, rtwfilesH] = RptgenRTW.getGeneratedCodeList(currObj, src_dir, {'h','hpp'});
    % 75 78
    % 76 78
    if thisComp.Source_files__auto_generated
        src_files = vertcat(src_files, mdlfilesC);
        if thisComp.include_rtw_c
            src_files = vertcat(src_files, rtwfilesC);
        end
    end
    % 83 86
    % 84 86
    if thisComp.Header_files__auto_generated
        src_files = vertcat(src_files, mdlfilesH);
        if thisComp.include_rtw_h
            src_files = vertcat(src_files, rtwfilesH);
        end
    end
    % 91 93
    if thisComp.Custom_files
        try
            cust_files = RptgenRTW.getCustomCodeList(currModel);
        catch
            thisComp.status(xlate('Custom code not found'), 1.0);
        end % try
        src_files = vertcat(src_files, cust_files);
    end
    % 100 102
    filtered = RptgenRTW.getSourceFileNames(src_files);
    excluded = setxor(filtered, src_files);
    if ~(isempty(excluded))
        thisComp.status(xlate('Only .c, .cpp, .h, or .hpp files are imported'), 2.0);
    end
    src_files = filtered;
    % 107 109
    html_files = {};
    htm_files = {};
    for i=1.0:length(src_files)
        [p, fileName, ext] = fileparts(src_files{i});
        ext(1.0) = '_';
        html_files = vertcat(html_files, fullfile(html_dir, horzcat(fileName, ext, '.html')));
        htm_files = vertcat(htm_files, fullfile(html_dir, horzcat(fileName, ext, '.htm')));
    end % for
    % 116 119
    % 117 119
    convert2HTML = false;
    if strcmp(adRG.RootComponent.Format, 'html')
        convert2HTML = true;
    end
    if convert2HTML
        try
            opt = 'ru';
            rtwprivate('rtwctags', src_files, false, true, html_files, false, opt);
        catch
            convert2HTML = false;
        end % try
    end
    % 130 132
    if convert2HTML
        importType = 'external';
    else
        importType = 'fixedwidth';
    end
    % 136 138
    for i=1.0:length(src_files)
        if convert2HTML
            if eq(exist(htm_files{i}, 'file'), 2.0)
                fileName = htm_files{i};
                builtin('delete', html_files{i});
            else
                fileName = html_files{i};
            end
        else
            fileName = src_files{i};
        end
        try
            srccode = javaMethod('importFile', 'com.mathworks.toolbox.rptgencore.docbook.FileImporter', importType, fileName, java(parentDoc));
            % 150 155
            % 151 155
            % 152 155
            % 153 155
            if strcmpi(importType, 'external')
                adRG = rptgen.appdata_rg;
                adRG.PostConvertImport = true;
            end
            % 158 161
            % 159 161
            section = makeCodeGenSection(thisComp, parentDoc, src_files{i}, srccode);
            out.appendChild(section);
        catch
            errMsg = horzcat(xlate('Could not import file'), ' ', fileName);
            out = parentDoc.createComment(errMsg);
            thisComp.status(errMsg, 1.0);
        end % try
    end % for
end
function section = makeCodeGenSection(thisComp, parentDoc, fileName, contents)
    % 170 172
    thisComp.makeSection(parentDoc);
    % 172 174
    [p, fName, fExt] = fileparts(fileName);
    titleContent = parentDoc.createDocumentFragment(xlate('Generated Code Listing'), ' - ', horzcat(fName, fExt));
    % 175 177
    thisComp.addTitle(parentDoc, titleContent);
    % 177 179
    tableSrc = vertcat(cellhorzcat(xlate('File name'), horzcat(fName, fExt)), cellhorzcat(xlate('Path'), p));
    % 179 181
    tm = makeNodeTable(parentDoc, tableSrc, 0.0, true);
    % 181 185
    % 182 185
    % 183 185
    tm.setColWidths([1.0 4.0]);
    tm.setNumHeadRows(0.0);
    tbl = tm.createTable;
    % 187 189
    thisComp.RunTimeSerializer.write(tbl);
    thisComp.RunTimeSerializer.write(contents);
    section = thisComp.closeSection;
end
