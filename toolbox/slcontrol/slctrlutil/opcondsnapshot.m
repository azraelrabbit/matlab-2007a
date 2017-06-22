function [simsys, x0, str, ts] = opcondsnapshot(t, x, u, flag)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    persistent leftcrumb;
    % 9 11
    switch flag
    case 0.0
        % 12 14
        sizes = simsizes;
        sizes.NumContStates = 0.0;
        sizes.NumDiscStates = 0.0;
        sizes.NumOutputs = 0.0;
        sizes.NumInputs = 0.0;
        sizes.DirFeedthrough = 0.0;
        sizes.NumSampleTimes = 1.0;
        simsys = simsizes(sizes);
        x0 = zeros(0.0, 1.0);
        str = [];
        ts = [-1.0 0.0];
        % 25 27
    case 2.0
        % 26 29
        % 27 29
        if isempty(leftcrumb)
            leftcrumb = 1.0;
        else
            return
        end
        % 33 36
        % 34 36
        snapshot_storage = LinearizationObjects.TimeEventStorage;
        if not(isempty(snapshot_storage.TimeEventObj))
            snapshot_storage.Data = vertcat(horzcat(snapshot_storage.Data), getsnapshotdata(snapshot_storage.TimeEventObj, t));
            % 38 40
        end
        % 40 42
        leftcrumb = [];
    case {[1.0],[3.0],[4.0],[9.0]}
    otherwise
        % 44 47
        % 45 47
        % 46 49
        % 47 49
        error(horzcat('Unhandled flag = ', num2str(flag)));
    end
end
