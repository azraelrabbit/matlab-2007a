function refreshvars(h, filterCtrl, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    theseFigs = h.Figures;
    I = true(size(theseFigs));
    for k=1.0:length(theseFigs)
        wp = getappdata(theseFigs(k), 'Waveplot');
        plotEditPanel = getappdata(theseFigs(k), 'PlotEditor');
        if ge(nargin, 3.0) && any(strcmp(wp.getVarNames, varargin{1.0}))
            close(theseFigs(k))
            I(k) = false;
            drawnow
        else
            wp.populatePlotEditor(filterCtrl, plotEditPanel);
        end % if
    end % for
    % 25 27
    % 26 27
    if any(I)
        I1 = find(I);
        figure(double(theseFigs(I1(1.0))))
    end % if
    % 31 33
    % 32 33
    h.jHandle.reset
end % function
