function g = buildcomplist(g, forceBuild)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if lt(nargin, 2.0)
        forceBuild = logical(0);
    end
    % 22 24
    if (isempty(g.ref.allcomps)) | (forceBuild)
        g.ref.Pointer = 'arrow';
        set(g.h.fig, 'Pointer', 'watch')
        g.ref.allcomps = allcomps(g.rptparent);
        g.ref.compTypes = allcomptypes(g.rptparent);
    end
    % 29 31
    cindex = 1.0;
    for i=1.0:length(g.ref.compTypes)
        matchIndex = find(strcmp(cellhorzcat(g.ref.allcomps.Type), g.ref.compTypes(i).Type));
        if ~(isempty(matchIndex))
            if g.ref.compTypes(i).Expand
                complist(cindex) = struct('Name', g.ref.compTypes(i).Fullname, 'LBstring', horzcat('[ -] ', upper(g.ref.compTypes(i).Fullname)), 'compname', i);
                % 36 39
                % 37 39
                cindex = plus(cindex, 1.0);
                for j=1.0:length(matchIndex)
                    complist(cindex) = struct('Name', g.ref.allcomps(matchIndex(j)).Name, 'LBstring', horzcat('      ', g.ref.allcomps(matchIndex(j)).Name), 'compname', g.ref.allcomps(matchIndex(j)).Class);
                    % 41 44
                    % 42 44
                    cindex = plus(cindex, 1.0);
                end % for
            else
                complist(cindex) = struct('Name', g.ref.compTypes(i).Fullname, 'LBstring', horzcat('[+] ', upper(g.ref.compTypes(i).Fullname)), 'compname', i);
                % 47 50
                % 48 50
                cindex = plus(cindex, 1.0);
            end
        end
    end % for
    % 53 55
    g.ref.complist = complist;
end
