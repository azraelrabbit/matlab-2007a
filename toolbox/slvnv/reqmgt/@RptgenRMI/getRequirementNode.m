function n = getRequirementNode(objH, dXML, displayFields, filterUnlinked)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    try
        thisReq = rmi('get', objH);
    catch
        thisReq = '';
    end % try
    % 29 31
    if isempty(thisReq)
        n = [];
        return
    end
    % 34 36
    if lt(nargin, 4.0)
        filterUnlinked = true;
    end
    % 38 40
    if lt(nargin, 3.0) || isempty(displayFields)
        displayFields = {'description';'doc';'id'};
        % 41 46
        % 42 46
        % 43 46
        % 44 46
    end
    % 46 48
    if lt(nargin, 2.0) || isempty(dXML)
        % 48 51
        % 49 51
        dXML = get(rptgen.appdata_rg, 'CurrentDocument');
    end
    % 52 55
    % 53 55
    fieldCount = length(displayFields);
    % 55 57
    n = dXML.createElement('simplelist');
    n.setAttribute('type', 'horiz');
    n.setAttribute('columns', sprintf('%i', fieldCount));
    % 59 61
    reqAdded = false;
    for i=1.0:length(thisReq)
        if ~(filterUnlinked) || thisReq(i).linked
            reqAdded = true;
            for j=1.0:fieldCount
                thisField = thisReq(i).(displayFields{j});
                if strcmp(displayFields{j}, 'doc')
                    % 67 69
                    [dPath, dFile, dExt] = fileparts(thisField);
                    rqSys = thisReq(i).reqsys;
                    linkType = reqmgtprivate('linktype_manager', 'resolve', rqSys, dExt);
                    % 71 73
                    if ~(isempty(linkType)) && linkType.IsFile
                        modelH = reqmgtprivate('util_getmodelh', objH);
                        docPath = reqmgtprivate('locate_file', thisField, modelH);
                        docPath = reqmgtprivate('util_simplifypath', docPath, filesep);
                        docPath = strrep(docPath, '/', filesep);
                        docPath = strrep(docPath, '\', filesep);
                        docURL = rptgen.file2urn(docPath);
                        if isempty(linkType.CreateURLFcn)
                            fullURL = docURL;
                        else
                            fullURL = feval(linkType.CreateURLFcn, docPath, docURL, thisReq(i).id);
                        end
                        thisField = dXML.makeLink(fullURL, horzcat(dFile, dExt), 'ulink');
                    end
                end
                n.appendChild(dXML.createElement('member', thisField));
            end % for
        end
    end % for
    % 91 93
    if ~(reqAdded)
        % 93 98
        % 94 98
        % 95 98
        % 96 98
        n = [];
    end
end
