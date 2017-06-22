function [reportName, errorMessages] = convertoutputfile(c)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    myFormat = LocFormatInfo(c);
    mySheet = LocSheetInfo(c, myFormat);
    % 14 16
    mySheet.sourcename = c.ref.SourceFileName;
    mySheet.reportname = c.ref.ReportFileName;
    mySheet.Language = c.rptcomponent.Language;
    % 18 20
    if isfield(c.ref, 'XML')
        mySheet.XML = c.ref.XML;
    else
        mySheet.XML = false;
    end
    % 24 27
    % 25 27
    switch lower(myFormat.Name)
    case 'pdf'
        pdfName = mySheet.reportname;
        mySheet.reportname = LocChangeExt(pdfName, 'rtf');
        % 30 32
        [rtfName, errorMessages] = LocRunJade(mySheet, myFormat, c.att.isDebug);
        % 32 37
        % 33 37
        % 34 37
        % 35 37
        if not(isempty(rtfName))
            [okConvert, pdfErrMsg] = docview(rtfName, 'UpdateFields', 'PrintPDF', 'CloseApp');
        else
            % 39 42
            % 40 42
            % 41 43
            okConvert = 0.0;
            pdfErrMsg = 'Error - RTF file not produced, can not convert to PDF';
        end
        % 45 47
        if not(isempty(pdfErrMsg))
            errorMessages{plus(end, 1.0)} = pdfErrMsg;
        end
        if okConvert
            reportName = pdfName;
        else
            reportName = rtfName;
        end
    case 'tex'
        [texName, errorMessages] = LocRunJade(mySheet, myFormat, c.att.isDebug);
        % 56 61
        % 57 61
        % 58 61
        % 59 61
        if not(isempty(texName))
            transformString = horzcat('tex "&jadetex" "', reportName, '"');
            [okConvert, texErrMsg] = LocSystemCall(transformString, '-echo');
        else
            okConvert = 0.0;
            texErrMsg = 'Error - TeX file not produced, can not convert to DVI.';
        end
        % 67 69
        if not(isempty(texErrMsg))
            errorMessages{plus(end, 1.0)} = texErrMsg;
        end
        % 71 73
        if okConvert
            reportName = LocChangeExt(texName, 'dvi');
        else
            reportName = texName;
        end
    otherwise
        [reportName, errorMessages] = LocRunJade(mySheet, myFormat, c.att.isDebug);
        % 79 83
        % 80 83
        % 81 83
    end
end
function [reportName, errorMessages] = LocRunJade(mySheet, myFormat, isDebug)
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    if isempty(mySheet.Filename)
        reportName = mySheet.sourcename;
        errorMessages = {'No target filename specified'};
        return
    end
    % 94 96
    if strcmp(myFormat.JadeBackend, 'sgml')
        chunkStr = ctranspose(mySheet.Variables);
        if isempty(findstr(horzcat(chunkStr{:}), 'nochunks#t'))
            % 98 101
            % 99 101
            isChunked = true;
            snFID = fopen(mySheet.sourcename, 'r');
            if gt(snFID, 0.0)
                headerString = ctranspose(char(fread(snFID, 32.0, 'char')));
                fclose(snFID);
                % 105 107
                if not(isempty(findstr(headerString, 'Sect1')))
                    isChunked = false;
                end
            end
            % 110 112
            if isChunked
                callForm = 3.0;
            else
                callForm = 2.0;
            end
        else
            callForm = 2.0;
        end
    else
        callForm = 1.0;
    end
    % 122 125
    % 123 125
    jadeExecutable = LocJadeDir;
    catalogFile = fullfile(matlabroot, 'sys', 'jade', 'docbook', 'dtd', 'docbook.cat');
    [rPath, rFile, rExt, rVer] = fileparts(mySheet.sourcename);
    % 127 130
    % 128 130
    driverFile = LocMakeDriverFile(mySheet);
    if isempty(driverFile)
        reportName = '';
        errorMessages = {'RPTGEN:E:Could not write driver file "rptdriver.dsl".';'RPTGEN:E:Check directory and file permissions.'};
        % 133 137
        % 134 137
        % 135 137
        return
    end
    % 138 140
    if mySheet.XML
        xmlFile = fullfile(matlabroot, 'sys', 'jade', 'docbook', 'dtds', 'decls', 'xml.dcl');
        xmlFile = horzcat(' "', xmlFile, '" ');
        validFlag = ' -wno-valid ';
    else
        % 144 146
        xmlFile = '';
        validFlag = '';
    end
    % 148 150
    JadeString = horzcat('"', jadeExecutable, '"', validFlag, ' -E 5000', ' -c "', catalogFile, '"', ' -t ', myFormat.JadeBackend, ' -d "', driverFile, '"');
    % 150 162
    % 151 162
    % 152 162
    % 153 162
    % 154 162
    % 155 162
    % 156 162
    % 157 162
    % 158 162
    % 159 162
    % 160 162
    reportName = mySheet.reportname;
    [rptDir, rptFile, rptExt, rptVer] = fileparts(mySheet.reportname);
    % 163 166
    % 164 166
    switch callForm
    case 1.0
        JadeString = horzcat(JadeString, ' -o "', mySheet.reportname, '"', xmlFile, ' "', mySheet.sourcename, '"');
        % 169 172
        % 170 172
    case 2.0
        % 171 173
        JadeString = horzcat(JadeString, xmlFile, ' "', mySheet.sourcename, '"', ' > "', mySheet.reportname, '"');
        % 174 177
        % 175 177
    case 3.0
        % 176 178
        JadeString = horzcat(JadeString, xmlFile, ' "', mySheet.sourcename, '"');
        % 178 184
        % 179 184
        % 180 184
        % 181 184
        % 182 184
    end
    % 184 191
    % 185 191
    % 186 191
    % 187 191
    % 188 191
    % 189 191
    oldDir = pwd;
    cd(rptDir);
    % 192 196
    % 193 196
    % 194 196
    if eq(exist(mySheet.reportname, 'file'), 2.0)
        try
            delete(mySheet.reportname);
        catch
            clobberErrorMessage = sprintf('RPTGEN:W:Could not delete file %s prior to conversion', mySheet.reportname);
        end % try
    end
    % 202 205
    % 203 205
    [error, result] = LocSystemCall(JadeString);
    % 205 207
    if ne(error, 0.0) || LocIsResultError(result)
        reportName = '';
    end
    % 209 211
    cd(oldDir);
    % 211 213
    if not(isDebug)
        try
            delete(driverFile);
        catch
            warning('rptgen:rptconvert', 'Could not delete driver file "rptdriver.dsl".');
        end % try
    else
        disp(JadeString);
    end
    % 221 223
    errorMessages = LocWashErrors(result);
end
function clean = LocWashErrors(messy)
    % 225 231
    % 226 231
    % 227 231
    % 228 231
    % 229 231
    eol = findstr(messy, sprintf('\n'));
    eol = horzcat(0.0, eol);
    % 232 234
    clean = {};
    if gt(length(eol), 1.0)
        for i=2.0:length(eol)
            line = messy(plus(eol(minus(i, 1.0)), 1.0):minus(eol(i), 1.0));
            fileseps = findstr(line, filesep);
            if not(isempty(fileseps))
                line = line(plus(fileseps(length(fileseps)), 1.0):end);
            end
            clean{plus(end, 1.0)} = line;
        end % for
    end
end
function myFormat = LocFormatInfo(c, formatName)
    % 246 249
    % 247 249
    if lt(nargin, 2.0)
        formatName = c.att.Format;
    end
    % 251 253
    prefs = preferences(c);
    % 253 255
    formatNames = cellhorzcat(prefs.format(:).Name);
    formatIndex = find(strcmpi(formatNames, formatName));
    if isempty(formatIndex)
        formatIndex = 1.0;
    else
        formatIndex = formatIndex(1.0);
    end
    myFormat = prefs.format(formatIndex);
end
function mySheet = LocSheetInfo(c, myFormat, styleName)
    % 264 268
    % 265 268
    % 266 268
    if lt(nargin, 3.0)
        styleName = c.att.Stylesheet;
    end
    % 270 273
    % 271 273
    if not(isempty(styleName))
        ssFile = which(horzcat(styleName, char(com.mathworks.toolbox.rptgencore.tools.StylesheetMaker.FILE_EXT_SS)));
    else
        ssFile = '';
    end
    if isempty(ssFile)
        sheets = stylesheets(c);
        sheetIndex = find(strcmpi(cellhorzcat(sheets(:).ID), styleName));
        if isempty(sheetIndex) || not(any(strcmpi(sheets(sheetIndex(1.0)).Formats, myFormat.Name)))
            % 281 283
            sheetIndex = [];
            i = 1.0;
            while le(i, length(sheets)) && isempty(sheetIndex)
                if any(strcmpi(sheets(i).Formats, myFormat.Name))
                    sheetIndex = i;
                else
                    i = plus(i, 1.0);
                end
            end % while
        end
    else
        sheets = stylesheets(c, ssFile);
        if isempty(sheets)
            sheetIndex = [];
        else
            sheetIndex = 1.0;
        end
    end
    % 300 302
    if not(isempty(sheetIndex))
        mySheet = sheets(sheetIndex(1.0));
    else
        mySheet = struct('Name', 'NoSheet', 'ID', '', 'Formats', {{}}, 'Description', '', 'Filename', '', 'Variables', {{}}, 'Overlays', {{}});
        % 305 312
        % 306 312
        % 307 312
        % 308 312
        % 309 312
        % 310 312
    end
end
function jd = LocJadeDir
    % 314 319
    % 315 319
    % 316 319
    % 317 319
    archDir = lower(computer);
    switch archDir(1.0:2.0)
    case 'pc'
        archDir = 'win32';
        % 322 324
        jadeFile = 'jade.exe';
    case {'ma','gl'}
        % 325 327
        jadeFile = 'openjade';
    otherwise
        jadeFile = 'jade';
    end
    % 330 333
    % 331 333
    jd = fullfile(pwd, jadeFile);
    if exist(jd, 'file')
        jd = LocCheckNetwork(jd);
        return
    end
    % 337 340
    % 338 340
    jd = fullfile(matlabroot, 'sys', 'jade', 'bin', jadeFile);
    if exist(jd, 'file')
        jd = LocCheckNetwork(jd);
        return
    end
    % 344 347
    % 345 347
    jd = fullfile(matlabroot, 'sys', 'jade', 'bin', archDir, jadeFile);
    if exist(jd, 'file')
        jd = LocCheckNetwork(jd);
        return
    end
    % 351 354
    % 352 354
    warning('Could not find document transform engine');
    jd = jadeFile;
end
function jd = LocCheckNetwork(jd)
    % 357 363
    % 358 363
    % 359 363
    % 360 363
    % 361 363
    if ispc
        [ok, result] = dos(sprintf('"%s" -ver', jd));
        if isempty(result)
            % 365 368
            % 366 368
            [jDir, jFile, jExt] = fileparts(jd);
            % 368 371
            % 369 371
            [mStatus, mMsg] = mkdir(tempdir, 'jade_temp');
            jdRoot = fullfile(tempdir, 'jade_temp');
            % 372 374
            jd = fullfile(jdRoot, horzcat(jFile, jExt));
            % 374 376
            persistent jadeCopiedYet;
            % 376 378
            if isempty(jadeCopiedYet) || not(exist(jd, 'file'))
                % 378 389
                % 379 389
                % 380 389
                % 381 389
                % 382 389
                % 383 389
                % 384 389
                % 385 389
                % 386 389
                % 387 389
                jadeCopiedYet = true;
                % 389 391
                copyfile(fullfile(jDir, 'grove.dll'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'groveoa.dll'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'jade.exe'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'msvcrt.dll'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'nsgmls.exe'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'sgmlnorm.exe'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'sp132.dll'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'spam.exe'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'spent.exe'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'spgrove.dll'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'style.dll'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'sx.exe'), jdRoot, 'f');
                copyfile(fullfile(jDir, 'sp133.dll'), jdRoot, 'f');
                % 403 405
            end
        end
    end
end
function driverName = LocMakeDriverFile(sheetStruct)
    % 409 412
    % 410 412
    [sourcePath, sourceFile, sourceExt, sourceVer] = fileparts(sheetStruct.sourcename);
    driverName = fullfile(sourcePath, 'rptdriver.dsl');
    myFid = fopen(driverName, 'w');
    if gt(myFid, 0.0)
        if not(isempty(sheetStruct.Language))
            [stylePath, styleFile, styleExt, styleVer] = fileparts(sheetStruct.Filename);
            locEntityString = horzcat('<!ENTITY l10n SYSTEM    "', fullfile(stylePath, horzcat('../common/dbl1', sheetStruct.Language, '.dsl')), '" CDATA DSSSL>$CR');
            % 418 421
            % 419 421
            locUseString = 'l10n ';
            locExternalSpecification = '<external-specification id="l10n" document="l10n">$CR';
            % 422 424
            sheetStruct.Variables(plus(end, 1.0), :) = cellhorzcat('%default-language%', horzcat('"', sheetStruct.Language, '"'));
        else
            % 425 427
            locEntityString = '';
            locUseString = '';
            locExternalSpecification = '';
        end
        % 430 432
        fileName = sheetStruct.Filename;
        entityImports = '';
        htmlString = horzcat('html', filesep, 'docbook.dsl');
        htmlStringLength = length(htmlString);
        if strcmp(htmlString, fileName(plus(minus(end, htmlStringLength), 1.0):end))
            fileName = horzcat(fileName(1.0:minus(minus(end, htmlStringLength), 1.0)), filesep, 'contrib', filesep, 'imagemap', filesep, 'imagemap.dsl');
            % 437 442
            % 438 442
            % 439 442
            % 440 442
            sheetStruct.Variables(plus(end, 1.0), :) = {'%callout-graphics%','#f'};
        else
            % 443 446
            % 444 446
            locEntityString = sprintf('%s<!ENTITY tmwlink SYSTEM "%s">', locEntityString, fullfile(matlabroot, 'sys', 'jade', 'docbook', 'contrib', 'textlink', 'textlink.dsl'));
            % 446 449
            % 447 449
            entityImports = '$CR&tmwlink;$CR';
            % 449 451
        end
        % 451 457
        % 452 457
        % 453 457
        % 454 457
        % 455 457
        styleOwner = 'James Clark';
        % 457 460
        % 458 460
        drvHeader = horzcat('<!DOCTYPE style-sheet PUBLIC ', '"-//', styleOwner, '//DTD DSSSL Style Sheet//EN" [$CR', '<!ENTITY dbstyle SYSTEM "', fileName, '" CDATA DSSSL>$CR', locEntityString, ']>$CR', '$CR', '<style-sheet>$CR', '<style-specification use="', locUseString, 'docbook">$CR', '<style-specification-body>$CR', entityImports, '$CR');
        % 460 472
        % 461 472
        % 462 472
        % 463 472
        % 464 472
        % 465 472
        % 466 472
        % 467 472
        % 468 472
        % 469 472
        % 470 472
        isJA = strncmpi(rpt_xml.getLanguage, 'ja', 2.0);
        if isJA && any(strncmpi(sheetStruct.Formats, 'rtf', 3.0))
            % 473 478
            % 474 478
            % 475 478
            % 476 478
            fontKey = '%mono-font-family%';
            isFontCustomized = any(strcmp(sheetStruct.Variables(:, 1.0), fontKey));
            if not(isFontCustomized)
                sheetStruct.Variables(plus(end, 1.0), :) = cellhorzcat(fontKey, '"MS Gothic"');
            end
        end
        % 483 486
        % 484 486
        drvVariables = '';
        for i=1.0:size(sheetStruct.Variables, 1.0)
            drvVariables = horzcat(drvVariables, '(define ', sheetStruct.Variables{i, 1.0}, ' $CR ', '$TAB', sheetStruct.Variables{i, 2.0}, ')$CR');
            % 488 491
            % 489 491
        end % for
        % 491 494
        % 492 494
        drvDSSSL = '';
        for i=1.0:length(sheetStruct.Overlays)
            [oPath, oFile, oExt, oVer] = fileparts(sheetStruct.Overlays{i});
            if strcmpi(oExt, '.m')
            else
                % 498 500
                if strcmpi(oExt, '.dsl')
                    % 500 502
                    dslFID = fopen(sheetStruct.Overlays{i}, 'r');
                    if gt(dslFID, 0.0)
                        drvDSSSL = horzcat(drvDSSSL, char(ctranspose(fread(dslFID))));
                        fclose(dslFID);
                    end
                end
            end
        end % for
        % 509 511
        drvFooter = horzcat('$CR', '</style-specification-body>$CR', '</style-specification>$CR', '<external-specification id="docbook" document="dbstyle">$CR', locExternalSpecification, '</style-sheet>$CR');
        % 511 518
        % 512 518
        % 513 518
        % 514 518
        % 515 518
        % 516 518
        drvString = horzcat(drvHeader, '$CR', drvVariables, '$CR', drvDSSSL, '$CR', drvFooter);
        drvString = strrep(drvString, '\', '\\');
        drvString = strrep(drvString, '%', '%%');
        drvString = strrep(drvString, '$CR', '\n');
        drvString = strrep(drvString, '$TAB', '\t');
        % 522 524
        fprintf(myFid, drvString);
        fclose(myFid);
    else
        driverName = '';
    end
end
function [error, result] = LocSystemCall(varargin)
    % 530 534
    % 531 534
    % 532 534
    if ispc
        % 534 537
        % 535 537
        if gt(length(varargin{1.0}), 120.0)
            % 537 540
            % 538 540
            batFileName = horzcat(tempname, '.bat');
            % 540 544
            % 541 544
            % 542 544
            fid = fopen(batFileName, 'w');
            fprintf(fid, '@ECHO OFF \r\n%s \r\n', varargin{1.0});
            fclose(fid);
            varargin{1.0} = horzcat('"', batFileName, '"');
        else
            batFileName = '';
        end
        % 550 552
        [error, result] = dos(varargin{:});
        % 552 556
        % 553 556
        % 554 556
        error = 0.0;
        % 556 558
        if not(isempty(batFileName))
            delete(batFileName);
        end
    else
        % 561 564
        % 562 564
        [error, result] = unix(varargin{1.0});
        % 564 568
        % 565 568
        % 566 568
        error = 0.0;
    end
end
function tf = LocIsResultError(result)
    % 571 578
    % 572 578
    % 573 578
    % 574 578
    % 575 578
    % 576 578
    tf = false;
    % 578 580
    errStrings = {'internal or external command, operable program or batch file';'document does not have the DSSSL architecture as a base';'jade: Command not found';'cannot continue because of previous errors'};
    % 580 587
    % 581 587
    % 582 587
    % 583 587
    % 584 587
    % 585 587
    for i=1.0:length(errStrings)
        if not(isempty(findstr(result, errStrings{i})))
            tf = true;
            break
        end
    end % for
end
function newFile = LocChangeExt(oldFile, newExt)
    % 594 598
    % 595 598
    % 596 598
    [fPath, fName, fExt, fVer] = fileparts(oldFile);
    newFile = fullfile(fPath, horzcat(fName, '.', newExt, fVer));
end
