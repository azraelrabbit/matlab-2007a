function toFrame(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if not(isa(h.TsValue.TimeInfo, 'Simulink.FrameInfo'))
        error('Timeseries:toframe:notframe', 'Time series object is not frame based')
        % 7 9
    end % if
    % 9 12
    % 10 12
    if strcmp(h.TsValue.TimeInfo.State, 'Frames')
        return;
    else
        h.TsValue.TimeInfo = setFrameState(h.TsValue.TimeInfo, 'Frames');
    end % if
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    thisData = h.TsValue.Data;
    if isempty(h.TsValue.Data_)
        h.TsValue.Storage_ = [];
        h.TsValue.Data = thisData;
    end % if
    % 25 29
    % 26 29
    % 27 29
    s = size(thisData);
    ntimes = mrdivide(s(1.0), h.TsValue.TimeInfo.Framesize);
    h.TsValue.IsTimeFirst_ = false;
    h.TsValue.Data = permute(reshape(ctranspose(h.TsValue.Data), horzcat(s(2.0), h.TsValue.TimeInfo.Framesize, ntimes)), [2.0 1.0 3.0]);
end % function
