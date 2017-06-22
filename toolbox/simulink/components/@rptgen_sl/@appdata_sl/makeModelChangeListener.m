function mListen = makeModelChangeListener(adsl, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    mListen = handle.listener(adsl, adsl.findprop('CurrentModel'), 'PropertyPostSet', varargin{:});
    % 12 14
    % 13 14
end % function
