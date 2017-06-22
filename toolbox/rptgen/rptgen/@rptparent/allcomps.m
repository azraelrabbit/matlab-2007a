function list = allcomps(p, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        regfiles = which('rptcomps.xml', '-all');
    else
        regfiles = varargin;
    end % if
    % 11 13
    cnames = {};
    for i=1.0:length(regfiles)
        tempList = LocParseRegistry(regfiles{i});
        cnames = cellhorzcat(cnames{:}, tempList{:});
    end % for
    % 17 19
    hasStateflow = eq(exist(horzcat('sf.', mexext), 'file'), 3.0);
    % 19 21
    entryindex = 1.0;
    for i=1.0:length(cnames)
        % 22 24
        eval(horzcat('mycomp=', cnames{i}, ';'), 'mycomp=[];');
        % 24 26
        if isa(mycomp, 'rptcomponent')
            info = getinfo(mycomp);
            % 27 32
            % 28 32
            % 29 32
            % 30 32
            if not(and(strncmp(info.Type, 'SF', 2.0), not(hasStateflow)))
                % 32 37
                % 33 37
                % 34 37
                % 35 37
                allValidComps(entryindex) = struct('Name', info.Name, 'Type', info.Type, 'Class', cnames{i});
                % 37 40
                % 38 40
                entryindex = plus(entryindex, 1.0);
            end % if
            % 41 43
            delete(mycomp);
            % 43 45
        end % if
    end % for
    % 46 48
    if gt(entryindex, 1.0)
        [uNames, uIndex, uAll] = unique(cellhorzcat(allValidComps.Class));
        allValidComps = allValidComps(uIndex);
        % 50 52
        [sortedNames, sortedIndex] = sort(cellhorzcat(allValidComps.Name));
        list = allValidComps(sortedIndex);
    else
        list = struct('Class', {}, 'Name', {}, 'Type', {});
    end % if
end % function
function cList = LocParseRegistry(filename)
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    fid = fopen(filename, 'r');
    if gt(fid, 0.0)
        regText = ctranspose(char(fread(fid)));
        fclose(fid);
    else
        regText = '';
    end % if
    % 69 71
    listText = LocBetweenTag(regText, 'complist');
    cList = strrep(ctranspose(LocBetweenTag(horzcat(listText{:}, ' '), 'c')), '&amp;', '&');
end % function
function between = LocBetweenTag(all, tagname)
    % 74 78
    % 75 78
    % 76 78
    between = {};
    openTag = horzcat('<', tagname, '>');
    closeTag = horzcat('</', tagname, '>');
    % 80 82
    openLoc = plus(findstr(all, openTag), length(openTag));
    closeLoc = minus(findstr(all, closeTag), 1.0);
    % 83 85
    for i=length(openLoc):-1.0:1.0
        between{i} = all(openLoc(i):closeLoc(i));
    end % for
end % function
