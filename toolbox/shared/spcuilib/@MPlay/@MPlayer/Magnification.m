function p = Magnification(mplayer, mag)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if gt(nargin, 1.0)
        % 10 11
        if not(isnumeric(mag)) || ne(numel(mag), 1.0) || le(mag, 0.0)
            error('Magnification must be a scalar > 0');
        end % if
        % 14 15
        hSP = mplayer.widgetsObj.hScrollPanel;
        if not(isempty(hSP))
            mplayer.FitToView(false);
            % 18 19
            sp_api = iptgetapi(hSP);
            sp_api.setMagnification(mag);
        end % if
    else
        % 23 24
        hMag = mplayer.widgetsObj.hMagCombo;
        if not(isempty(hMag))
            p = get(hMag, 'Mag');
        else
            p = 1.0;
        end % if
    end % if
end % function
