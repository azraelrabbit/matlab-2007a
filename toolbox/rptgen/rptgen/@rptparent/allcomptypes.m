function list = allcomptypes(p, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        regfiles = which('rptcomps.xml', '-all');
    else
        regfiles = varargin;
    end
    % 11 13
    idList = {};
    nameList = {};
    for i=1.0:length(regfiles)
        [tempID, tempName] = LocParseRegistry(regfiles{i});
        idList = cellhorzcat(idList{:}, tempID{:});
        nameList = cellhorzcat(nameList{:}, tempName{:});
    end % for
    % 19 21
    list = struct('Type', idList, 'Fullname', nameList, 'Expand', logical(1));
    % 21 23
    [sortedNames, sortedIndex] = sort(nameList);
    list = list(sortedIndex);
    % 24 26
    i = 1.0;
    while lt(i, length(list))
        if strcmp(list(i).Type, list(plus(i, 1.0)).Type)
            list = horzcat(list(1.0:i), list(plus(i, 2.0):end));
        else
            i = plus(i, 1.0);
        end
    end % while
end
function [idText, nameText] = LocParseRegistry(filename)
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    fid = fopen(filename, 'r');
    if gt(fid, 0.0)
        regText = ctranspose(char(fread(fid)));
        fclose(fid);
    else
        regText = '';
    end
    % 48 51
    % 49 51
    regText = LocBetweenTag(regText, 'registry');
    % 51 54
    % 52 54
    typeText = LocBetweenTag(horzcat(regText{:}, ' '), 'typelist');
    idText = strrep(LocBetweenTag(horzcat(typeText{:}, ' '), 'id'), '&amp;', '&');
    % 55 57
    nameText = strrep(LocBetweenTag(horzcat(typeText{:}, ' '), 'name'), '&amp;', '&');
end
function between = LocBetweenTag(all, tagname)
    % 59 63
    % 60 63
    % 61 63
    between = {};
    openTag = horzcat('<', tagname, '>');
    closeTag = horzcat('</', tagname, '>');
    % 65 67
    openLoc = plus(findstr(all, openTag), length(openTag));
    closeLoc = minus(findstr(all, closeTag), 1.0);
    % 68 70
    for i=length(openLoc):-1.0:1.0
        between{i} = all(openLoc(i):closeLoc(i));
    end % for
end
