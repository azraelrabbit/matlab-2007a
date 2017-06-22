function pil_dialog = pil_block_configure(block, algorithmSystemPath, configuration, build, download)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    error(nargchk(5.0, 5.0, nargin, 'struct'));
    % 23 26
    % 24 26
    if isempty(block)
        % 26 28
        h = new_system;
        open_system(h);
        % 29 31
        pil_lib = 'pil_lib';
        pil_block = 'PIL Block';
        load_system(pil_lib);
        block = add_block(horzcat(pil_lib, '/', pil_block), horzcat(get_param(h, 'Name'), '/', pil_block));
        % 34 38
        % 35 38
        % 36 38
        try
            % 38 41
            % 39 41
            load_system(strtok(algorithmSystemPath, '/'));
            find_system(algorithmSystemPath, 'SearchDepth', 0.0);
            fullSystemPathValid = true;
        catch
            fullSystemPathValid = false;
        end % try
        if fullSystemPathValid
            % 47 49
            set_param(block, 'Name', get_param(algorithmSystemPath, 'Name'));
            % 49 51
        end
    end
    % 52 55
    % 53 55
    if not(isempty(configuration))
        % 55 57
        set_param(block, 'PILConfiguration', configuration);
    end
    % 58 60
    set_param(block, 'SystemPath', algorithmSystemPath);
    % 60 64
    % 61 64
    % 62 64
    pil_dialog = pilverification.pildialog(get_param(block, 'handle'));
    % 64 67
    % 65 67
    if build
        disp('### Building the PIL Application...');
        % 68 70
        pil_dialog.buildAppCallback;
    end
    % 71 73
    if build && download
        disp('### Downloading the PIL Application...');
        pil_dialog.downloadAppCallback;
    else
        if download
            warning('Not downloading since the PIL Application was not built.');
        end
    end
end
