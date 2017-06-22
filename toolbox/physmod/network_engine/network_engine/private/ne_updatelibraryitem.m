function ne_updatelibraryitem(item)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 8 10
    postSetupInfo = ne_private('ne_postsetupinfo');
    updateInfo = ne_private('ne_updateinfofile');
    % 11 13
    if strcmp(item.item_type, 'element')
        % 13 16
        % 14 16
        lBuild(item);
        % 16 18
    end
    % 18 20
    postSetupInfo(item);
    updateInfo(item.info);
    % 21 23
end
function lBuild(item)
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    net = NetworkEngine.Network(mfilename);
    e = net.element('e', item);
    fnames = fieldnames(e);
    % 31 33
    for i=1.0:length(fnames)
        field = e.(fnames{i});
        if isa(field, 'NetworkEngine.TerminalData')
            net.connect(field);
        end
    end % for
    % 38 40
    net.build;
    % 40 42
end
