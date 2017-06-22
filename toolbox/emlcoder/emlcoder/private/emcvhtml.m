function topHTML = emcvhtml(report)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if isempty(report.summary.name)
        error('No summary information available.');
    end % if
    topHTML = gen_reportfile(report);
    gen_summaryfile(report);
    gen_msgnavfile(report, 'tree');
    gen_msgnavfile(report, 'list');
    srcFiles = gen_c2html(report);
    gen_contentsfile(report, srcFiles);
    gen_msgtreefile(report);
    gen_msglistfile(report);
    gen_m_sourcefiles(report);
end % function
function gen_commonStyles(fd)
    % 19 22
    % 20 22
    stylesheet = horzcat('file:///', matlabroot, filesep, 'toolbox', filesep, 'matlab', filesep, 'codetools', filesep, 'matlab-report-styles.css');
    % 22 24
    if eq(filesep, '\')
        stylesheet = regexprep(stylesheet, '\\', '\\\\');
    end % if
    fprintf(fd, '<link rel="stylesheet" href="%s" type="text/css" />\n', stylesheet);
    fprintf(fd, '<style type="text/css" media="screen">\n');
    fprintf(fd, 'div.treeview { white-space: nowrap; }\n');
    fprintf(fd, '.treeview img { border: 0px; vertical-align: middle; }\n');
    fprintf(fd, '.trigger { cursor: pointer; }\n');
    fprintf(fd, '.branch { display: none; margin-left: 22px; }\n');
    fprintf(fd, 'span.lnnolink { cursor: pointer; color: blue; text-decoration: underline; padding: 1 }\n');
    fprintf(fd, 'span.lnnonorm { color: grey; padding: 1 }\n');
    fprintf(fd, 'span.textnorm { color: black; padding: 1 }\n');
    fprintf(fd, 'span.textcmnt { color: green; padding: 1 }\n');
    fprintf(fd, 'span.msglink { cursor: pointer; color: blue; text-decoration: underline }\n');
    fprintf(fd, 'span.treelink { cursor: pointer; color: blue; text-decoration: underline }\n');
    fprintf(fd, '.error { color: red; }\n');
    fprintf(fd, '.fcflink { cursor: pointer; color: blue; text-decoration: underline }\n');
    fprintf(fd, 'div.tooltip { visibility: hidden; position: fixed;\n');
    fprintf(fd, '  background-color: lightyellow; border: 1px solid black; }\n');
    fprintf(fd, '</style>\n');
end % function
function gen_commonReportHeader(fd, report, msgType)
    % 45 48
    % 46 48
    fprintf(fd, '<title> Compilation Report For ''%s'' </title>\n', report.summary.name);
    fprintf(fd, '<div class="report-head">Embedded MATLAB Coder Message %s View</div><p/>\n', msgType);
    fprintf(fd, '<div class="grayline"></div>\n');
end % function
function topFileName = gen_reportfile(report)
    % 52 55
    % 53 55
    fcnName = report.summary.name;
    dirName = htmlPath(report, true);
    topFileName = fullfile(dirName, horzcat(fcnName, '_report.html'));
    fd = fopen(topFileName, 'W');
    if eq(fd, -1.0)
        error(horzcat('Unable to create HTML report file "', topFileName, '".'));
    end % if
    % 61 63
    if not(isempty(report.summary.messageList))
        defaultFrame = horzcat(fcnName, '_msglistnav.html');
    else
        defaultFrame = horzcat(fcnName, '_summary.html');
    end % if
    % 67 69
    fprintf(fd, '<html>\n');
    fprintf(fd, '<head>\n');
    fprintf(fd, '<title>Embedded MATLAB Coder</title>\n');
    fprintf(fd, '</head>\n');
    fprintf(fd, '<frameset cols="163,90%%">\n');
    fprintf(fd, '  <frame name="contentsFrame" src="%s">\n', horzcat(fcnName, '_contents.html'));
    % 74 76
    fprintf(fd, '  <frame name="rtwreport_document_frame" src="%s">\n', defaultFrame);
    fprintf(fd, '</frameset>\n');
    fprintf(fd, '</html>\n');
    % 78 80
    fclose(fd);
end % function
function gen_summaryfile(report)
    % 82 85
    % 83 85
    fcnName = report.summary.name;
    smyFileName = navigationfilename(report, 'summary');
    fd = fopen(smyFileName, 'W');
    if eq(fd, -1.0)
        error(horzcat('Unable to create HTML report file "', smyFileName, '".'));
    end % if
    % 90 92
    fprintf(fd, '<html>\n');
    fprintf(fd, '<head>\n');
    gen_commonStyles(fd);
    fprintf(fd, '</head>\n');
    fprintf(fd, '<body>\n');
    % 96 98
    fprintf(fd, '<title> Compilation Report For ''%s'' </title>\n', report.summary.name);
    fprintf(fd, '<div class="report-head">Embedded MATLAB Coder Report Summary</div><p/>\n');
    fprintf(fd, '<div class="grayline"></div>\n');
    % 100 102
    fprintf(fd, 'Embedded MATLAB code generation for M-function ');
    if isempty(report.scripts) || isempty(report.scripts{1.0}.name)
        fprintf(fd, '"%s"\n', fcnName);
    else
        fprintf(fd, '<a title="Open function ''%s'' in the MATLAB editor" href="matlab: open(''%s'')">%s</a>\n', report.scripts{1.0}.name, report.scripts{1.0}.filepath, fcnName);
        % 106 108
    end % if
    fprintf(fd, '<br/><br/>\n');
    % 109 111
    fprintf(fd, '<table cellpadding="1" cellspacing="1">');
    if report.summary.passed
        title = 'C source code generated on';
    else
        title = 'M-code compilation attempted on';
    end % if
    fprintf(fd, '<tr><td>%s<td>: %s</tr>', title, datestr(report.summary.date));
    [nErrors, nWarnings] = msgcount(report);
    fprintf(fd, '<tr><td>Number of errors<td>: %d</tr>', nErrors);
    fprintf(fd, '<tr><td>Number of warnings<td>: %d</tr>', nWarnings);
    fprintf(fd, '</table>\n');
    % 121 123
    fprintf(fd, '</body>\n');
    fprintf(fd, '</html>\n');
    fprintf(fd, '\n');
    % 125 127
    fclose(fd);
end % function
function [nErrors, nWarnings] = msgcount(report)
    % 129 132
    % 130 132
    nErrors = 0.0;
    nWarnings = 0.0;
    % 133 135
    for messageId=1.0:numel(report.summary.messageList)
        message = report.summary.messageList{messageId};
        if not(message.isFcnCallFailed)
            switch message.type
            case 'Warning'
                nWarnings = plus(nWarnings, 1.0);
            otherwise
                nErrors = plus(nErrors, 1.0);
            end % switch
        end % if
    end % for
end % function
function gen_msgnavfile(report, navtype)
    % 147 151
    % 148 151
    % 149 151
    fcnName = report.summary.name;
    dirName = htmlPath(report);
    msgFileName = fullfile(dirName, horzcat(fcnName, '_msg', navtype, 'nav.html'));
    fd = fopen(msgFileName, 'W');
    if eq(fd, -1.0)
        error(horzcat('Unable to create HTML report file "', msgFileName, '".'));
    end % if
    % 157 159
    fprintf(fd, '<html>\n');
    fprintf(fd, '<head>\n');
    fprintf(fd, '<title>Embedded MATLAB Coder</title>\n');
    fprintf(fd, '</head>\n');
    fprintf(fd, '<frameset rows="50%%,*">\n');
    fprintf(fd, '  <frame name="navFrame" src="%s" frameborder="0">\n', horzcat(fcnName, '_msg', navtype, '.html'));
    % 164 166
    fprintf(fd, '  <frame name="mainFrame" src="%s" frameborder="1">\n', horzcat(fcnName, '_source1.html'));
    % 166 168
    fprintf(fd, '</frameset>\n');
    fprintf(fd, '</html>\n');
    % 169 171
    fclose(fd);
end % function
function gen_contentsfile(report, srcFiles)
    % 173 176
    % 174 176
    fcnName = report.summary.name;
    ctFileName = navigationfilename(report, 'contents');
    fd = fopen(ctFileName, 'W');
    if eq(fd, -1.0)
        error(horzcat('Unable to create HTML report file "', ctFileName, '".'));
    end % if
    % 181 183
    fprintf(fd, '<html>\n');
    fprintf(fd, '<head>\n');
    fprintf(fd, '<style>\n');
    fprintf(fd, '.report-head {padding: 8px; font-size: 150%%; font-weight: bold; background: #008; color: #FFF;}');
    fprintf(fd, '</style>\n');
    fprintf(fd, '</head>\n');
    fprintf(fd, '<body>\n');
    % 189 191
    fprintf(fd, '<div class="report-head">Contents</div><p/>\n');
    fprintf(fd, '<table border="0" cellspacing="0" cellpadding="1" width="100%%" bgcolor="#ffffff">\n');
    fprintf(fd, '<tr><td><a href="%s" target="rtwreport_document_frame">Summary</a></td></tr>\n', horzcat(fcnName, '_summary.html'));
    % 193 196
    % 194 196
    if ne(numel(report.summary.messageList), 0.0)
        fprintf(fd, '<tr><td><a href="%s" target="rtwreport_document_frame">Message List View</a></td></tr>\n', horzcat(fcnName, '_msglistnav.html'));
        % 197 199
        fprintf(fd, '<tr><td><a href="%s" target="rtwreport_document_frame">Message Tree View</a></td></tr>\n', horzcat(fcnName, '_msgtreenav.html'));
        % 199 201
    end % if
    % 201 203
    fprintf(fd, '</table>\n');
    % 203 205
    if not(isempty(srcFiles))
        fprintf(fd, '<br/>\n');
        fprintf(fd, '<table border="0" cellspacing="0" cellpadding="1" width="100%%" bgcolor="#ffffff">\n');
        fprintf(fd, '<tr><td><b>Generated Source Files</b></td></tr>\n');
        for i=1.0:numel(srcFiles)
            srcFile = srcFiles{i};
            [pathstr, name, ext] = fileparts(srcFile);
            htmlFile = horzcat(name, regexprep(ext, '\.', '_'), '.html');
            fprintf(fd, '<tr><td><a href="%s" target="rtwreport_document_frame">%s</a></td></tr>\n', htmlFile, horzcat(name, ext));
            % 213 215
        end % for
        fprintf(fd, '</table>\n');
    end % if
    % 217 219
    fprintf(fd, '</body>\n');
    fprintf(fd, '</html>\n');
    fprintf(fd, '\n');
    % 221 223
    fclose(fd);
end % function
function fileName = navigationfilename(report, suffix)
    % 225 228
    % 226 228
    fcnName = report.summary.name;
    dirName = htmlPath(report);
    fileName = horzcat(dirName, filesep, fcnName, '_', suffix, '.html');
    if eq(filesep, '\')
        fileName = regexprep(fileName, '\\', '/');
    end % if
end % function
function gen_msglistfile(report)
    % 235 239
    % 236 239
    % 237 239
    fcnName = report.summary.name;
    dirName = htmlPath(report);
    msgFileName = horzcat(dirName, filesep, fcnName, '_msglist.html');
    fd = fopen(msgFileName, 'W');
    if eq(fd, -1.0)
        error(horzcat('Unable to create HTML report file "', msgFileName, '".'));
    end % if
    % 245 247
    gen_messagePrologue(fd, report, 'List');
    gen_messageTable(fd, report);
    gen_messageEpilogue(fd);
    % 249 251
    fclose(fd);
end % function
function gen_messagePrologue(fd, report, msgType)
    % 253 256
    % 254 256
    fprintf(fd, '<html>\n');
    % 256 258
    fprintf(fd, '<head>\n');
    gen_commonStyles(fd);
    fprintf(fd, '</head>\n');
    % 260 262
    gen_MsgJavaScript(fd);
    % 262 264
    fprintf(fd, '<body bgcolor="white" fgcolor="black">\n');
    gen_commonReportHeader(fd, report, msgType);
end % function
function gen_messageEpilogue(fd)
    % 267 270
    % 268 270
    fprintf(fd, '</body>\n');
    fprintf(fd, '</html>\n');
    fprintf(fd, '\n');
end % function
function gen_msgtreefile(report)
    % 274 278
    % 275 278
    % 276 278
    fcnName = report.summary.name;
    dirName = htmlPath(report);
    treeFileName = horzcat(dirName, filesep, fcnName, '_msgtree.html');
    fd = fopen(treeFileName, 'W');
    if eq(fd, -1.0)
        error(horzcat('Unable to create HTML report file "', treeFileName, '".'));
    end % if
    % 284 286
    gen_treePrologue(fd, report);
    gen_treeDetails(fd, report);
    gen_treeEpilogue(fd);
    % 288 290
    fclose(fd);
end % function
function gen_treePrologue(fd, report)
    % 292 295
    % 293 295
    fprintf(fd, '<html>\n');
    % 295 297
    fprintf(fd, '<head>\n');
    gen_commonStyles(fd);
    fprintf(fd, '</head>\n');
    % 299 301
    gen_TreeJavaScript(fd);
    % 301 303
    fprintf(fd, '<body onload="initTreeView()">\n');
    gen_commonReportHeader(fd, report, 'Tree');
end % function
function gen_treeEpilogue(fd)
    % 306 309
    % 307 309
    fprintf(fd, '</body>\n');
    fprintf(fd, '</html>\n');
    fprintf(fd, '\n');
end % function
function gen_m_sourcefiles(report)
    % 313 317
    % 314 317
    % 315 317
    fcnName = report.summary.name;
    dirName = htmlPath(report);
    nScripts = numel(report.scripts);
    if eq(nScripts, 0.0)
        nScripts = 1.0;
    end % if
    for scriptId=1.0:nScripts
        haveScript = le(scriptId, numel(report.scripts));
        if haveScript
            script = report.scripts{scriptId};
            if ne(scriptId, 1.0) && eq(script.nErrors, 0.0) && eq(script.nWarnings, 0.0)
                continue;
            end % if
        end % if
        srcFileName = horzcat(dirName, filesep, fcnName, '_source', sprintf('%d', scriptId), '.html');
        fd = fopen(srcFileName, 'W');
        if eq(fd, -1.0)
            error(horzcat('Unable to create HTML report file "', srcFileName, '".'));
        end % if
        gen_sourcePrologue(fd);
        if haveScript
            msgids = functionMsgIds(report, plus(script.nErrors, script.nWarnings), scriptId);
            gen_functionDetails(fd, report, msgids, scriptId, script);
            gen_functionMessageTooltips(fd, report, msgids, scriptId);
        end % if
        gen_sourceEpilogue(fd);
        fclose(fd);
    end % for
end % function
function srcFiles = gen_c2html(report)
    srcFiles = [];
    if report.summary.passed && isfield(report.summary, 'buildInfo')
        srcFiles = findAllFilesInBld(report.summary.buildInfo);
    end % if
    if not(isempty(srcFiles))
        oldpwd = pwd;
        % 352 354
        try
            dirName = htmlPath(report);
            cd(dirName);
            rtwprivate('rtwctags', srcFiles, false, false, {}, false);
        catch
            cd(oldpwd);
            rethrow(lasterror);
        end % try
        cd(oldpwd);
    end % if
end % function
function filelist = findAllFilesInBld(buildInfo)
    % 365 368
    % 366 368
    concatenatePaths = true;
    replaceMatlabroot = true;
    srcFiles = buildInfo.getSourceFiles(concatenatePaths, replaceMatlabroot);
    incFiles = buildInfo.getIncludeFiles(concatenatePaths, replaceMatlabroot);
    filelist = sort(horzcat(srcFiles, incFiles));
end % function
function gen_sourcePrologue(fd)
    % 374 377
    % 375 377
    fprintf(fd, '<html>\n');
    % 377 379
    fprintf(fd, '<head>\n');
    gen_commonStyles(fd);
    fprintf(fd, '</head>\n');
    % 381 383
    gen_SourceJavaScript(fd);
    % 383 385
    fprintf(fd, '<body onload="initSource()" bgcolor="white" fgcolor="black">\n');
    fprintf(fd, '\n');
end % function
function gen_sourceEpilogue(fd)
    % 388 391
    % 389 391
    fprintf(fd, '</body>\n');
    fprintf(fd, '</html>\n');
    fprintf(fd, '\n');
end % function
function gen_treeDetails(fd, report)
    % 395 398
    % 396 398
    fprintf(fd, '<!--\nMessage Tree View\n-->\n');
    % 398 400
    nMessages = numel(report.summary.messageTree);
    if eq(nMessages, 0.0)
        gen_NullMessages(fd, report)
        return;
    end % if
    % 404 406
    fprintf(fd, '<div class="content">\n');
    fprintf(fd, '<table border=0 cellspacing=0 cellpadding=6 cols=2>\n');
    fprintf(fd, '<tr>\n');
    fprintf(fd, '<td class="td-linebottomrt" bgcolor="#F0F0F0">');
    fprintf(fd, '<a title="Fully expand the message tree" href="javascript: treeViewExpand(true);">Open all</a>\n');
    fprintf(fd, '</td>\n');
    fprintf(fd, '<td class="td-linebottomrt" bgcolor="#F0F0F0">');
    fprintf(fd, '<a title="Fully collapse the message tree" href="javascript: treeViewExpand(false);">Close all</a>\n');
    fprintf(fd, '</td>\n');
    fprintf(fd, '</tr>\n');
    fprintf(fd, '</table>\n');
    fprintf(fd, '</div>\n');
    fprintf(fd, '<div class="grayline"></div>\n');
    % 418 420
    fprintf(fd, '<div id="treeview" class="treeview" onclick="processMouseClick(event);">\n');
    % 420 422
    fprintf(fd, '  <span class="trigger" onclick="treeViewClick(1);">\n');
    fprintf(fd, '    <img src="%s" id="expand1">\n', plainPlusGif);
    fprintf(fd, '  </span>\n');
    if isempty(report.scripts{1.0}.name)
        fprintf(fd, '  <a>');
    else
        fprintf(fd, '  <a title="Open function ''%s'' in the MATLAB editor" href="matlab: open(''%s'')">', report.scripts{1.0}.name, report.scripts{1.0}.filepath);
        % 428 430
    end % if
    fprintf(fd, '  <img src="%s" id="folder1"></img></a>\n', folderClosedGif);
    topName = report.scripts{1.0}.name;
    if isempty(topName)
        topName = report.summary.name;
    end % if
    fprintf(fd, '  %s\n', topName);
    msgStruct = report.summary.messageTree(1.0);
    gen_functionMsgTree(fd, report, msgStruct, 1.0, 1.0);
    fprintf(fd, '</div>\n');
end % function
function newSerial = gen_functionMsgTree(fd, report, msgStruct, level, serialNo)
    % 441 445
    % 442 445
    % 443 445
    indent(1.0:level) = ' ';
    fprintf(fd, '%s<span class="branch" id="branch%d">\n', indent, serialNo);
    indent = horzcat(indent, ' ');
    % 447 449
    if isempty(msgStruct) || isempty(msgStruct.messageIds)
        msgList = [];
    else
        msgList = msgStruct.messageIds{1.0};
    end % if
    nMessages = numel(msgList);
    ndxChild = 1.0;
    for index=1.0:nMessages
        msgId = msgList(index);
        message = report.summary.messageList{msgId};
        if message.isFcnCallFailed
            if le(ndxChild, numel(msgStruct.children))
                msgChild = msgStruct.children{ndxChild};
                ndxChild = plus(ndxChild, 1.0);
                if not(isempty(msgChild)) && not(isempty(msgChild.messageIds))
                    fprintf(fd, '%s<span class="trigger" onclick="treeViewClick(%d);">\n', indent, plus(serialNo, 1.0));
                    % 464 466
                    fprintf(fd, ' %s<img src="%s" id="expand%d">\n', indent, plainPlusGif, plus(serialNo, 1.0));
                    % 466 468
                    fprintf(fd, '%s</span>\n%s', indent, indent);
                    gen_functionMsgTreeLink(fd, report, msgId, indent, plus(serialNo, 1.0));
                    % 469 471
                    serialNo = gen_functionMsgTree(fd, report, msgChild, plus(level, 1.0), plus(serialNo, 1.0));
                end % if
            end % if
        else
            fprintf(fd, '%s', indent);
            gen_functionMsgTreeLink(fd, report, msgId, indent, plus(serialNo, 1.0));
        end % if
    end % for
    indent = indent(1.0:minus(numel(indent), 1.0));
    fprintf(fd, '%s</span>\n', indent);
    newSerial = serialNo;
end % function
function gen_functionMsgTreeLink(fd, report, msgId, indent, serialNo)
    % 483 486
    % 484 486
    message = report.summary.messageList{msgId};
    script = report.scripts{message.scriptId};
    if message.isFcnCallFailed
        msgText = messageSourceText(report, msgId);
        gen_FileOpenLink(fd, script, message, 'folder', serialNo);
    else
        msgText = messageTextSynopsis(message);
        gen_FileOpenLink(fd, script, message, 'document');
    end % if
    fprintf(fd, '\n%s<span class=treelink title="%s" id=%s onclick="processMouseClick(event);">%s</span><br />\n', indent, 'Highlight the error line in this report', messageHref(report, msgId, 'L'), msgText);
    % 495 498
    % 496 498
end % function
function path = toolboxPath
    % 499 503
    % 500 503
    % 501 503
    path = horzcat('file:///', matlabroot, filesep, 'toolbox', filesep, 'emlcoder', filesep, 'emlcoder', filesep, 'private', filesep);
    % 503 505
    if eq(filesep, '\')
        path = regexprep(path, '\\', '\\\\');
    end % if
end % function
function path = htmlPath(report, create)
    % 509 512
    % 510 512
    if lt(nargin, 2.0)
        create = false;
    end % if
    [path, name] = fileparts(report.summary.directory);
    if not(isempty(name))
        path = horzcat(path, filesep, name);
    end % if
    path = horzcat(path, filesep, 'html');
    if create
        if eq(fileattrib(path), 0.0)
            mkdir(path);
        end % if
    end % if
end % function
function file = documentGif
    file = horzcat(toolboxPath, 'document.gif');
end % function
function file = folderOpenGif
    % 529 532
    % 530 532
    file = horzcat(toolboxPath, 'folderopen.gif');
end % function
function file = folderClosedGif
    % 534 537
    % 535 537
    file = horzcat(toolboxPath, 'folderclosed.gif');
end % function
function file = rightArrowGif
    % 539 542
    % 540 542
    file = horzcat(toolboxPath, 'right_arrow.gif');
end % function
function base = plainMinusBase
    % 544 547
    % 545 547
    base = 'nolines_minus';
end % function
function file = plainMinusGif
    % 549 552
    % 550 552
    file = horzcat(toolboxPath, plainMinusBase, '.gif');
end % function
function base = plainPlusBase
    % 554 557
    % 555 557
    base = 'nolines_plus';
end % function
function file = plainPlusGif
    % 559 562
    % 560 562
    file = horzcat(toolboxPath, plainPlusBase, '.gif');
end % function
function msgHref = messageHref(report, messageId, prefix)
    % 564 567
    % 565 567
    message = report.summary.messageList{messageId};
    script = report.scripts{message.scriptId};
    msgHref = sprintf('%c%d_%d_%d_%d_%d', prefix, message.scriptId, messageId, max(0.0, message.start), max(0.0, message.length), messageLineno(script, message.start));
    % 569 575
    % 570 575
    % 571 575
    % 572 575
    % 573 575
end % function
function gen_FileOpenLink(fd, script, message, linktype, level)
    % 576 580
    % 577 580
    % 578 580
    [lineNo, colNo] = messageLineno(script, message.start);
    if isempty(script.name)
        fprintf(fd, '<a>');
    else
        switch linktype
        case {'folder','document','msglink'}
            fprintf(fd, '<a title="Open function ''%s'' in the MATLAB editor" ', scriptname(script));
        otherwise
            % 587 589
            fprintf(fd, '<a id="F%d_0_0_0_0" onmouseover="activateTT(event);" onmouseout="quiesceTT(event);" ', message.scriptId);
            % 589 591
        end % switch
        fprintf(fd, 'href="matlab: emlcprivate(''callproc'',''emcopentoline'',''%s'',%d,%d);">', script.filepath, lineNo, colNo);
    end % if
    switch linktype
    case 'msglink'
        [pathstr, name, ext] = fileparts(script.filepath);
        fprintf(fd, '%s:%d:%d', horzcat(name, ext), lineNo, colNo);
    case 'folder'
        fprintf(fd, '<img src="%s" id="folder%d"></img>', folderClosedGif, level);
    case 'document'
        fprintf(fd, '<img src="%s"></img>', documentGif);
    otherwise
        fprintf(fd, '%s', linktype);
    end % switch
    fprintf(fd, '</a>');
end % function
function msgText = messageSourceText(report, msgId)
    % 607 610
    % 608 610
    message = report.summary.messageList{msgId};
    start = plus(message.start, 1.0);
    length = message.length;
    script = report.scripts{message.scriptId};
    msgText = script.m(start:minus(plus(start, length), 1.0));
end % function
function gen_functionMessageTooltips(fd, report, msgids, scriptId)
    % 616 620
    % 617 620
    % 618 620
    inlist = false;
    hasfcf = false;
    % 621 623
    nmsgs = mrdivide(numel(msgids), 2.0);
    i = 1.0;
    message = [];
    messageList = {};
        while le(i, nmsgs)
        i = plus(i, 1.0);
        if isempty(message)
            messageId = msgids(minus(i, 1.0), 2.0);
            if lt(messageId, 1.0) || gt(messageId, numel(report.summary.messageList))
                continue;
            end % if
            message = report.summary.messageList{messageId};
        end % if
        fcf = message.isFcnCallFailed;
        % 636 638
        if fcf
            seen = false;
            text = 'Go to called function in this report.';
        else
            seen = hasfcf;
            text = message.text;
        end % if
        for msg=1.0:numel(messageList)
            if strcmp(text, messageList{msg})
                seen = true;
                break
            end % if
        end % for
        if not(seen)
            if not(inlist)
                inlist = true;
                messageList = {};
                start = message.start;
                stop = plus(start, message.length);
                if fcf
                    fprintf(fd, '<div class="tooltip" id="fcftooltip">\n');
                    fprintf(fd, '<table border=0 cellspacing=0 cellpadding=0>\n');
                else
                    fprintf(fd, '<div class="tooltip" id="msgtooltip%d_%d">\n', scriptId, messageId);
                    % 661 663
                    fprintf(fd, '<table border=0 cellspacing=0 cellpadding=6>\n');
                end % if
            end % if
            if fcf
                hasfcf = true;
            end % if
            messageList{plus(numel(messageList), 1.0)} = text;
            msgtext = regexprep(text, '[\n]', '<br />\n');
            fprintf(fd, '<tr><td align=left class="td-linebottomrt">\n');
            fprintf(fd, '%s\n', msgtext);
            fprintf(fd, '</td></tr>\n');
        end % if
        if le(i, nmsgs)
            messageId = msgids(i, 2.0);
            if lt(messageId, 1.0) || gt(messageId, numel(report.summary.messageList))
                continue;
            end % if
            message = report.summary.messageList{messageId};
            if le(start, message.start) && lt(message.start, stop)
                stop = max(stop, plus(message.start, message.length));
            else
                fprintf(fd, '</table>\n');
                fprintf(fd, '</div>\n');
                inlist = false;
                hasfcf = false;
            end % if
        end % if
    end % while
    if inlist
        fprintf(fd, '</table>\n');
        fprintf(fd, '</div>\n');
    end % if
    % 694 697
    % 695 697
    fprintf(fd, '<div class="tooltip" id="msgtooltip%d_0">\n', scriptId);
    fprintf(fd, '<table border=0 cellspacing=0 cellpadding=0>\n');
    fprintf(fd, '<tr><td align=left class="td-linebottomrt">\n');
    fcnName = scriptname(report.scripts{scriptId});
    fprintf(fd, '%s\n', horzcat('Open function ''', fcnName, ''' in the MATLAB editor'));
    fprintf(fd, '</td></tr>\n');
    fprintf(fd, '</table>\n');
    fprintf(fd, '</div>\n');
end % function
function msgids = functionMsgIds(report, nmsgs, scriptId)
    % 706 710
    % 707 710
    % 708 710
    msgids = zeros(nmsgs, 2.0);
    j = 1.0;
    for i=1.0:numel(report.summary.messageList)
        if eq(report.summary.messageList{i}.scriptId, scriptId)
            msgids(j, 1.0) = report.summary.messageList{i}.start;
            msgids(j, 2.0) = i;
            j = plus(j, 1.0);
        end % if
    end % for
    msgids = sortrows(msgids, 1.0);
end % function
function msgmap = functionMsgMap(report, msgids, scriptLen)
    % 721 724
    % 722 724
    msgmap = zeros(1.0, scriptLen, 'uint32');
    for index=1.0:mrdivide(numel(msgids), 2.0)
        messageId = msgids(index, 2.0);
        if gt(messageId, 0.0) && le(messageId, numel(report.summary.messageList))
            message = report.summary.messageList{messageId};
            msgLength = max(1.0, message.length);
            for mapIdx=plus(message.start, 1.0):plus(message.start, msgLength)
                if lt(0.0, mapIdx) && le(mapIdx, scriptLen)
                    if eq(msgmap(mapIdx), 0.0)
                        msgmap(mapIdx) = messageId;
                    end % if
                end % if
            end % for
        end % if
    end % for
end % function
function gen_NullMessages(fd, report)
    fprintf(fd, '<div>\n');
    if report.summary.passed
        fprintf(fd, '<h2>Compilation Successful</h2>\n');
    else
        fprintf(fd, '<h2>Compilation Unsuccessful</h2>\n');
    end % if
    fprintf(fd, '</div>\n');
    fprintf(fd, '<br />\n');
end % function
function gen_messageTable(fd, report)
    % 750 753
    % 751 753
    fprintf(fd, '<!--\nMessage Summary Table\n-->\n');
    % 753 755
    nMessages = numel(report.summary.messageList);
    if eq(nMessages, 0.0)
        gen_NullMessages(fd, report)
        return;
    end % if
    % 759 761
    fprintf(fd, '<div class="content" onclick="processMouseClick(event);">\n');
    fprintf(fd, '<table border=0 cellspacing=0 cellpadding=6>\n');
    fprintf(fd, '<tr>\n');
    fprintf(fd, '<td align=left class="td-linebottomrt" bgcolor="#F0F0F0">Type</td>\n');
    fprintf(fd, '<td align=left class="td-linebottomrt" bgcolor="#F0F0F0">Location</td>\n');
    fprintf(fd, '<td align=left class="td-linebottomrt" bgcolor="#F0F0F0">Message</td>\n');
    fprintf(fd, '</tr>\n');
    % 767 769
    for messageId=1.0:nMessages
        message = report.summary.messageList{messageId};
        if message.isFcnCallFailed
            continue;
        end % if
        scriptId = message.scriptId;
        if ne(scriptId, 0.0)
            script = report.scripts{scriptId};
        end % if
        % 777 779
        fprintf(fd, '<tr>\n');
        fprintf(fd, '<td align="left" vAlign="top" class="td-linebottomrt">');
        fprintf(fd, '%s', message.type);
        fprintf(fd, '</td>\n');
        % 782 785
        % 783 785
        fprintf(fd, '<td align="left" vAlign="top" class="td-linebottomrt">');
        if eq(scriptId, 0.0) || isempty(script.name)
            fprintf(fd, 'Unknown');
        else
            gen_FileOpenLink(fd, script, message, 'msglink');
        end % if
        fprintf(fd, '</td>\n');
        % 791 794
        % 792 794
        fprintf(fd, '<td align="left" vAlign="top" class="td-linebottomrt">');
        if eq(scriptId, 0.0)
            fprintf(fd, '%s\n', message.text);
        else
            msgText = messageTextSynopsis(message);
            fprintf(fd, '<span class=msglink title="%s" id=%s>%s</span>\n', 'Highlight the error line in this report', messageHref(report, messageId, 'L'), msgText);
            % 799 802
            % 800 802
            col = plus(numel(msgText), 1.0);
                while le(col, numel(message.text))
                c = message.text(col);
                if eq(c, char(10.0))
                    fprintf(fd, '<br>');
                else
                    fprintf(fd, '%c', c);
                end % if
                col = plus(col, 1.0);
            end % while
        end % if
        fprintf(fd, '</td>\n');
        fprintf(fd, '</tr>\n');
    end % for
    % 815 817
    fprintf(fd, '</table>\n');
    fprintf(fd, '</div>\n');
    fprintf(fd, '<br />\n');
end % function
function gen_functionDetails(fd, report, msgids, scriptId, script)
    % 821 824
    % 822 824
    fprintf(fd, '<!--\nScript #%d\n-->\n', scriptId);
    fprintf(fd, '<div class="content" onclick="processMouseClick(event);"\n');
    fprintf(fd, '     onmouseover="processMouseOver(event);"\n');
    fprintf(fd, '     onmouseout="processMouseOut(event);">\n');
    name = scriptname(script);
    if not(isempty(name))
        fprintf(fd, '<h2>Function %s</h2>\n', name);
        fprintf(fd, '<div class="grayline"/>\n');
        gen_functionText(fd, report, msgids, scriptId, script);
    end % if
    fprintf(fd, '<br />\n');
    fprintf(fd, '</div>\n');
end % function
function name = scriptname(script)
    % 837 840
    % 838 840
    name = [];
    if not(isempty(script.filepath))
        [pathstr, name] = fileparts(script.filepath);
    end % if
    if isempty(name) && not(isempty(script.name))
        name = script.name;
    end % if
end % function
function gen_functionText(fd, report, msgids, scriptId, script)
    % 848 851
    % 849 851
    fprintf(fd, '<pre id=scriptText%d>\n', scriptId);
    % 851 853
    scriptLen = numel(script.m);
    msgmap = functionMsgMap(report, msgids, scriptLen);
    nl = true;
    spanopen = false;
    msgid = uint32(0.0);
    lineno = 0.0;
    for pos=1.0:scriptLen
        c = script.m(pos);
        if nl
            if spanopen
                fprintf(fd, '</span>');
            end % if
            nl = false;
            lineno = plus(lineno, 1.0);
            gen_functionTextTooltip(fd, report, msgid, 0.0);
            messageId = 0.0;
            for scan=pos:scriptLen
                if ne(msgmap(scan), 0.0)
                    messageId = msgmap(scan);
                    break
                end % if
                if eq(script.m(scan), char(10.0))
                    break
                end % if
            end % for
            if ne(messageId, 0.0)
                fprintf(fd, '<span class="lnnolink">');
                message = report.summary.messageList{messageId};
                gen_FileOpenLink(fd, script, message, sprintf('%4d', lineno));
            else
                fprintf(fd, '<span class="lnnonorm">');
                fprintf(fd, '%4d', lineno);
            end % if
            fprintf(fd, '</span>');
            fprintf(fd, '<a id="scriptLine%d_%d"></a>', scriptId, lineno);
            fprintf(fd, '<img src="%s" align="top" hspace=2 style="visibility:hidden" id="scriptArrow%d_%d">', rightArrowGif, scriptId, lineno);
            fprintf(fd, '</img>');
            if eq(c, '%')
                theClass = 'textcmnt';
            else
                theClass = 'textnorm';
            end % if
            fprintf(fd, '<span class="%s">', theClass);
            spanopen = true;
            gen_functionTextTooltip(fd, report, 0.0, msgid);
        end % if
        if eq(c, char(10.0))
            nl = true;
        end % if
        newmsgid = msgmap(pos);
        if ne(newmsgid, msgid)
            gen_functionTextTooltip(fd, report, msgid, newmsgid);
            msgid = newmsgid;
        end % if
        switch c
        case '<'
            fprintf(fd, '&lt;');
        case '>'
            fprintf(fd, '&gt;');
        otherwise
            fprintf(fd, '%c', c);
        end % switch
    end % for
    gen_functionTextTooltip(fd, scriptId, msgid, 0.0);
    if spanopen
        fprintf(fd, '</span>');
    end % if
    fprintf(fd, '\n</pre>\n');
end % function
function gen_functionTextTooltip(fd, report, oldMsgId, newMsgId)
    if ne(oldMsgId, 0.0)
        fprintf(fd, '</span>');
    end % if
    if ne(newMsgId, 0.0)
        message = report.summary.messageList{newMsgId};
        if message.isFcnCallFailed
            fprintf(fd, '<span class="fcflink" id="%s" ', messageHref(report, minus(newMsgId, 1.0), 'L'));
        else
            fprintf(fd, '<span class="error" id="%s" ', messageHref(report, newMsgId, 'T'));
        end % if
        fprintf(fd, 'onmouseover="activateTT(event);" onmouseout="quiesceTT(event);">');
    end % if
end % function
function gen_MsgJavaScript(fd)
    gen_JavaScript(fd);
end % function
function gen_SourceJavaScript(fd)
    gen_JavaScript(fd);
end % function
function gen_TreeJavaScript(fd)
    % 942 945
    % 943 945
    fprintf(fd, '<script language="JavaScript">\n');
    fprintf(fd, 'var treeImgPlainMinusBase = "%s";\n', plainMinusBase);
    fprintf(fd, 'var treeImgPlainPlusBase = "%s";\n', plainPlusBase);
    % 947 949
    fprintf(fd, 'treeImgFolderOpen = new Image();\n');
    fprintf(fd, 'treeImgFolderClosed = new Image();\n');
    fprintf(fd, 'treeImgPlainMinus = new Image();\n');
    fprintf(fd, 'treeImgPlainPlus = new Image();\n');
    % 952 954
    fprintf(fd, 'treeImgFolderOpen.src = "%s";\n', folderOpenGif);
    fprintf(fd, 'treeImgFolderClosed.src = "%s";\n', folderClosedGif);
    fprintf(fd, 'treeImgPlainMinus.src = "%s";\n', plainMinusGif);
    fprintf(fd, 'treeImgPlainPlus.src = "%s";\n', plainPlusGif);
    fprintf(fd, '</script>\n');
    % 958 960
    gen_JavaScript(fd);
end % function
function gen_JavaScript(fd)
    % 962 965
    % 963 965
    file = horzcat(toolboxPath, 'emcvhtml.js');
    fprintf(fd, '<script type="text/javascript" language="JavaScript" src="%s">\n', file);
    fprintf(fd, '</script>\n');
end % function
