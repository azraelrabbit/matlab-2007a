function PixelRegion(mplayObj)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    mplayObj.listenObj.PauseMethod.Callback = @(h,e)local_PixelRegion_continue(h);
    mplayObj.listenObj.PauseMethod.Enabled = 'on';
    Pause(mplayObj);
function local_PixelRegion_continue(mplayObj)
    % 14 18
    % 15 18
    % 16 18
    mplayObj.listenObj.PauseMethod.Enabled = 'off';
    % 18 21
    % 19 21
    mplayObj.widgetsObj.PixelRegion;
