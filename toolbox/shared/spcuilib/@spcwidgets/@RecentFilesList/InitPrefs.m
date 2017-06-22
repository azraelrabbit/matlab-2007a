function InitPrefs(h, maxNum)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if lt(nargin, 2.0)
        maxNum = -1.0;
    end
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    grp = h.PrefsGroup;
    prf = h.PrefsRecentFiles;
    if ispref(grp, prf)
        % 24 26
        v = getpref(grp, prf);
        % 26 34
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        if not(iscell(v)) || not(isvector(v))
            % 34 38
            % 35 38
            % 36 38
            addnewpref = true;
        else
            % 39 43
            % 40 43
            % 41 43
            addnewpref = false;
            if ne(maxNum, -1.0)
                nCurr = numel(v);
                if gt(nCurr, maxNum)
                    % 46 48
                    v = v(1.0:maxNum);
                else
                    if lt(nCurr, maxNum)
                        v = vertcat(v, emptyStringVec(minus(maxNum, nCurr)));
                    end
                end
                h.SetList(v);
            end
        end
    else
        addnewpref = true;
    end
    if addnewpref
        if eq(maxNum, -1.0)
            maxNum = h.DefaultMaxFiles;
        end
        h.ResetList(maxNum);
    end
    % 65 69
    % 66 69
    % 67 69
    prf = h.PrefsRecentChooseFile;
    if ispref(grp, prf)
        % 70 72
        v = getpref(grp, prf);
        if not(ischar(v))
            addnewpref = true;
        end
    else
        addnewpref = true;
    end
    if addnewpref
        initDir = fullfile(pwd, filesep);
        setpref(grp, prf, initDir);
    end
    % 82 86
    % 83 86
    % 84 86
    if not(isempty(h.InitialMenu))
        h.UpdateMenus;
    end
end
function s = emptyStringVec(n)
    % 90 93
    % 91 93
    s = repmat({''}, n, 1.0);
end
