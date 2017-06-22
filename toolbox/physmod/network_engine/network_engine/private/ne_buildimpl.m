function ne_buildimpl(libName)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    ne_clear;
    rehash('toolboxcache');
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    root = NetworkEngine.RootLibrary;
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    lib = root.(libName);
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    lBuildItem(lib);
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    ne_buildnotify(lib);
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    ne_clear;
    % 37 39
end
function lBuildItem(item)
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    infoFile = ne_infofilename(item.info.SourceFile);
    eqnLib = item.info.GeneratedEqnLib;
    % 46 48
    lDeleteFile(infoFile);
    lDeleteFile(eqnLib);
    % 49 51
    fprintf('Building: %s\n', item.path);
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    ne_updatelibraryitem(item);
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    if strcmp(item.item_type, 'library')
        item_names = sort(item.items);
        for i=1.0:length(item_names)
            % 63 65
            lBuildItem(item.(item_names{i}));
            % 65 67
        end % for
        % 67 69
    end
    % 69 71
end
function lDeleteFile(fileName)
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    if ~(isempty(dir(fileName)))
        ws = warning('off');
        delete(fileName);
        warning(ws);
    end
    % 81 83
end
