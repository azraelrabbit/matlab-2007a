function genHTMLreport(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    rptContentsFile = rtwprivate('rtwattic', 'getContentsFileName');
    rptFileName = rtwprivate('rtwattic', 'getReportFileName');
    if not(isempty(rptContentsFile))
        % 10 11
        infoStruct = rtwprivate('rtwinfomatman', h.StartDirToRestore, 'load', 'binary', h.ModelName, h.MdlRefBuildArgs.ModelReferenceTargetType);
        % 12 15
        % 13 15
        % 14 15
        if isfield(infoStruct, 'htmlrptLinks')
            insert_link_to_submodels_htmlrpt(infoStruct.htmlrptLinks, rptContentsFile, infoStruct);
            % 17 18
        end % if
        % 19 20
        infoStruct = rtwprivate('rtwinfomatman', h.StartDirToRestore, 'updatehtmlrptLinks', 'binary', h.ModelName, h.MdlRefBuildArgs.ModelReferenceTargetType, rptFileName);
        % 21 25
        % 22 25
        % 23 25
        % 24 25
        rtwprivate('rtwreport', 'convertC2HTML', rptContentsFile);
        if strcmp(h.MdlRefBuildArgs.ModelReferenceTargetType, 'NONE') || h.MdlRefBuildArgs.UpdateTopModelReferenceTarget
            % 27 28
            if not(strcmp(get_param(h.ModelName, 'LaunchReport'), 'off'))
                dasRoot = DAStudio.Root;
                if dasRoot.hasWebBrowser
                    rtwprivate('rtwshowhtml', rptFileName, 'UseWebBrowserWidget');
                else
                    rtwprivate('rtwshowhtml', rptFileName);
                end % if
            end % if
        end % if
    end % if
end % function
function insert_link_to_submodels_htmlrpt(htmlrptLinks, rptContentsFile, infoStruct)
    if not(isempty(htmlrptLinks))
        rptBuffer = fileread(rptContentsFile);
        insertLinks = '<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" WIDTH="100%" BGCOLOR="#ffffff">';
        insertLinks = horzcat(insertLinks, '<TR><TD><B>Referenced Models</B></TD></TR>');
        htmlsubmodel = {};
        for i=1.0:length(htmlrptLinks)
            [pathStr, submodelName] = fileparts(htmlrptLinks{i});
            submodelName = submodelName(1.0:minus(end, 12.0));
            htmlsubmodel = horzcat(htmlsubmodel, cellhorzcat(submodelName));
            % 49 50
            relativeLink = strrep(fullfile(infoStruct.relativePathToAnchor, '..', htmlrptLinks{i}), '\', '/');
            insertLinks = horzcat(insertLinks, '<TR><TD><A HREF="', relativeLink, '" TARGET=_top>', submodelName, '</A></TD><TR>');
        end % for
        allsubmodel = infoStruct.modelRefsAll;
        leftsubmodel = setdiff(allsubmodel, htmlsubmodel);
        for i=1.0:length(leftsubmodel)
            insertLinks = horzcat(insertLinks, '<TR><TD>', leftsubmodel{i}, '</TD><TR>');
        end % for
        rptBuffer = strrep(rptBuffer, '</BODY>', horzcat(insertLinks, '</TABLE> </BODY>'));
        fid = fopen(rptContentsFile, 'w');
        fprintf(fid, '%s', rptBuffer);
        fclose(fid);
    end % if
end % function
