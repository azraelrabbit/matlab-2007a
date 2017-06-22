function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pk = findpackage('channel');
    % 10 11
    c = schema.class(pk, 'multipathfig', findclass(pk, 'baseclass'));
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    p = schema.prop(c, 'FigureHandle', 'mxArray');
    % 18 20
    % 19 20
    p = schema.prop(c, 'SavedPosition', 'mxArray');
    p.FactoryValue = [0.0 0.0 500.0 400.0];
    % 22 24
    % 23 24
    p = schema.prop(c, 'UIHandles', 'mxArray');
    % 25 27
    % 26 27
    p = schema.prop(c, 'SliderListener', 'mxArray');
    % 28 30
    % 29 30
    p = schema.prop(c, 'SimulinkBlkFigClosedFlag', 'strictbool');
    p.FactoryValue = 0.0;
    % 32 34
    % 33 34
    p = schema.prop(c, 'NumAxes', 'udouble');
    % 35 37
    % 36 37
    p = schema.prop(c, 'AxesObjects', 'mxArray');
    % 38 41
    % 39 41
    % 40 41
    p = schema.prop(c, 'AxesIdxDirectory', 'mxArray');
    p = schema.prop(c, 'AxesRowDirectory', 'mxArray');
    p = schema.prop(c, 'AxesWidthDirectory', 'mxArray');
    % 44 46
    % 45 46
    findclass(pk, 'multipath');
    p = schema.prop(c, 'CurrentChannel', 'channel.multipath');
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    p = schema.prop(c, 'ChannelStored', 'mxArray');
    % 53 55
    % 54 55
    p = schema.prop(c, 'AxesIdxSchedule', 'mxArray');
    p = schema.prop(c, 'TimeStampSchedule', 'mxArray');
    p = schema.prop(c, 'SnapshotIdxSchedule', 'mxArray');
    p = schema.prop(c, 'ScheduleUpdated', 'strictbool');
    p = schema.prop(c, 'CurrentTime', 'udouble');
    p = schema.prop(c, 'Animating', 'strictbool');
    p.FactoryValue = false;
    % 62 64
    % 63 64
    p = schema.prop(c, 'CurrentAxesIdx', 'mxArray');
    p.FactoryValue = 1.0;
    % 66 68
    % 67 68
    p = schema.prop(c, 'CurrentlySelectingAxes', 'strictbool');
    p.FactoryValue = false;
    % 70 72
    % 71 72
    p = schema.prop(c, 'FramePeriod', 'udouble');
    p.FactoryValue = 0.0;
    % 74 76
    % 75 76
    p = schema.prop(c, 'FrameStartTime', 'udouble');
    p.FactoryValue = 0.0;
    % 78 80
    % 79 80
    p = schema.prop(c, 'CurrentSnapshotTime', 'udouble');
    p.FactoryValue = 0.0;
    % 82 84
    % 83 84
    p = schema.prop(c, 'NumFramesPlotted', 'udouble');
    p.FactoryValue = 0.0;
end % function
