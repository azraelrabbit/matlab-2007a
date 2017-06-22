function enable(zoomObj, ena)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h = vertcat(horzcat(zoomObj.zoomin_button), horzcat(zoomObj.zoomout_button), horzcat(zoomObj.panimage_button), horzcat(zoomObj.zoomin_menu), horzcat(zoomObj.zoomout_menu), horzcat(zoomObj.panimage_menu));
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    set(h, 'enable', ena);
    % 16 18
    % 17 18
    if strcmpi(ena, 'off')
        zoomObj.zoom_off;
    end % if
end % function
