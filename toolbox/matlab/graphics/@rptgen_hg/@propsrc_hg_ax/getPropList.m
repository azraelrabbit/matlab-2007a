function list = getPropList(h, filterName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch filterName
    case 'all'
        persistent RPTGEN_ALL_AXES_PROPERTIES;
        if isempty(RPTGEN_ALL_AXES_PROPERTIES)
            ax = h.getTestObject;
            RPTGEN_ALL_AXES_PROPERTIES = fieldnames(get(ax));
            % 12 15
            % 13 15
        end
        list = RPTGEN_ALL_AXES_PROPERTIES;
    case 'xyz'
        list = {'XAxisLocation';'XColor';'XDir';'XGrid';'XLabel';'XLim';'XLimMode';'XScale';'XTick';'XTickLabel';'XTickLabelMode';'XTickMode';'YAxisLocation';'YColor';'YDir';'YGrid';'YLabel';'YLim';'YLimMode';'YScale';'YTick';'YTickLabel';'YTickLabelMode';'YTickMode';'ZColor';'ZDir';'ZGrid';'ZLabel';'ZLim';'ZLimMode';'ZScale';'ZTick';'ZTickLabel';'ZTickLabelMode';'ZTickMode'};
        % 19 54
        % 20 54
        % 21 54
        % 22 54
        % 23 54
        % 24 54
        % 25 54
        % 26 54
        % 27 54
        % 28 54
        % 29 54
        % 30 54
        % 31 54
        % 32 54
        % 33 54
        % 34 54
        % 35 54
        % 36 54
        % 37 54
        % 38 54
        % 39 54
        % 40 54
        % 41 54
        % 42 54
        % 43 54
        % 44 54
        % 45 54
        % 46 54
        % 47 54
        % 48 54
        % 49 54
        % 50 54
        % 51 54
        % 52 54
    case 'camera'
        % 53 55
        list = {'CameraPosition';'CameraPositionMode';'CameraTarget';'CameraTargetMode';'CameraUpVector';'CameraUpVectorMode';'CameraViewAngle';'CameraViewAngleMode';'View';'Projection'};
        % 55 66
        % 56 66
        % 57 66
        % 58 66
        % 59 66
        % 60 66
        % 61 66
        % 62 66
        % 63 66
        % 64 66
    end
end
