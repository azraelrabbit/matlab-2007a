function linkElement = makeLink(d, linkID, linkText, linkType)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if isempty(linkID)
        if (lt(nargin, 3.0)) | (isempty(linkText))
            linkElement = '';
        else
            linkElement = d.createTextNode(linkText);
        end
        return
    end
    % 17 19
    if lt(nargin, 3.0)
        linkText = '';
    end
    % 21 23
    if lt(nargin, 4.0)
        if gt(nargin, 2.0)
            linkType = 'link';
        else
            linkType = 'anchor';
        end
    else
        linkType = lower(linkType);
    end
    % 31 33
    switch linkType
    case {'link','xref'}
        attType = 'linkend';
        linkID = tokenizeLinkID(linkID);
    case 'anchor'
        attType = 'id';
        linkID = tokenizeLinkID(linkID);
    case 'matlab'
        attType = 'url';
        linkType = 'ulink';
    case 'ulink'
        attType = 'url';
        % 44 46
        if isempty(findstr(linkID, ':/')) && isempty(findstr(linkID, './'))
            if gt(exist(linkID, 'file'), 0.0)
                linkIdFound = which(linkID);
                if ~(isempty(linkIdFound))
                    linkID = linkIdFound;
                end
                % 51 53
                [linkPath, linkFile, linkExt] = fileparts(linkID);
                adRG = rptgen.appdata_rg;
                [reportDirectory, reportFile, reportExt] = fileparts(adRG.RootComponent.Output.SrcFileName);
                if isempty(reportDirectory)
                    reportDirectory = pwd;
                end
                if strcmpi(linkPath, reportDirectory)
                    linkID = horzcat('./', linkFile, linkExt);
                else
                    linkID = rptgen.file2urn(fullfile(linkPath, horzcat(linkFile, linkExt)));
                end
                % 63 65
                if isempty(linkText)
                    linkText = linkFile;
                end
            else
                % 68 70
                linkID = horzcat('http://', linkID);
            end
        end
    otherwise
        error('LINKTYPE must be ''link'',''anchor'',''ulink'', or ''xref''.');
    end
    % 75 77
    linkElement = d.createElement(linkType);
    linkElement.setAttribute(attType, linkID);
    % 78 80
    if ~(isempty(linkText))
        linkText = d.createTextNode(linkText);
        % 81 83
        if strcmp(linkType, 'anchor')
            linkElement = d.createDocumentFragment(linkElement, linkText);
        else
            linkElement.appendChild(linkText);
        end
    end
end
function linkID = tokenizeLinkID(linkID)
    % 90 94
    % 91 94
    % 92 94
    spaceIdx = find(isspace(linkID));
    if ~(isempty(spaceIdx))
        linkID(spaceIdx) = '_';
    end
    linkID = strrep(linkID, ' ', '_');
end
