function h = VideoInfo(mplayObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    h = MPlay.VideoInfo;
    % 9 12
    % 10 12
    h.titleStr = 'Video Information';
    h.init(mplayObj);
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    pk = findpackage('MPlay');
    cl = pk.findclass('VideoInfo');
    prop = cl.findprop('dataTypeDst');
    h.listen_dataTypeDst = handle.listener(h, prop, 'PropertyPostSet', cellhorzcat(@update_dataTypeDst, mplayObj));
    % 30 32
    h.listen_dataTypeDst.CallbackTarget = h;
end % function
