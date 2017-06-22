function toSamples(h)
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
    if strcmp(h.TsValue.TimeInfo.State, 'Samples')
        return;
    else
        h.TsValue.TimeInfo = setFrameState(h.TsValue.TimeInfo, 'Samples');
    end % if
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    s = size(h.TsValue.Data);
    ntimes = mtimes(s(end), h.TsValue.TimeInfo.Framesize);
    h.TsValue.IsTimeFirst_ = true;
    h.TsValue.Data = reshape(permute(h.TsValue.Data, [1.0 3.0 2.0]), horzcat(ntimes, s(2.0)));
end % function
