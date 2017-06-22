function icon = nesl_getitemicon(item)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    persistent EXTMAP;
    if isempty(EXTMAP)
        map = cellhorzcat('.jpg', @lImage, '.bmp', @lImage);
        % 10 12
        EXTMAP = map;
    end
    % 13 15
    extensions = EXTMAP(:, 1.0);
    [directory, basename] = fileparts(item.info.SourceFile);
    icon = PmSli.Icon;
    icon.setText(item.Descriptor);
    % 18 20
    for i=1.0:numel(extensions)
        ext = extensions{i};
        iconFile = fullfile(directory, horzcat(basename, ext));
        % 22 24
        if exist(iconFile, 'file')
            fcn = EXTMAP{i, 2.0};
            icon = fcn(iconFile);
            break
        end
    end % for
    % 29 31
end
function icon = lImage(imageFile)
    % 32 36
    % 33 36
    % 34 36
    icon = PmSli.Icon;
    icon.setImage(imageFile);
    % 37 39
end
