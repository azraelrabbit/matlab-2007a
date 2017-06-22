function promoteoverlay(fig)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    axH = findall(fig, 'type', 'axes');
    if not(isempty(axH))
        overlay = double(find(handle(axH), '-class', 'graph2d.annotationlayer'));
        if isempty(overlay)
            overlay = findall(axH, 'Tag', 'ScribeOverlayAxesActive');
        end % if
        % 15 16
        if not(isempty(overlay))
            axes(overlay);
        end % if
    end % if
end % function
