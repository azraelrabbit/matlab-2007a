function setstate(hFVT, s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isfield(s, 'OverlayedAnalysis'))
        s.OverlayedAnalysis = '';
    end % if
    % 11 12
    switch lower(s.currentAnalysis)
    case 'magresp'
        s.currentAnalysis = 'magnitude';
    case 'phaseresp'
        s.currentAnalysis = 'phase';
    case 'magnphaseresp'
        s.currentAnalysis = 'freq';
    case 'groupdelay'
        s.currentAnalysis = 'grpdelay';
    case 'impresp'
        s.currentAnalysis = 'impulse';
    case 'stepresp'
        s.currentAnalysis = 'step';
    case 'pzplot'
        s.currentAnalysis = 'polezero';
    case 'filtercoeffs'
        s.currentAnalysis = 'coefficients';
    case 'nlm'
        s.currentAnalysis = 'magestimate';
        s.OverlayedAnalysis = 'noisepower';
    end % switch
    % 33 34
    set(hFVT, 'Analysis', s.currentAnalysis);
    set(hFVT, 'OverlayedAnalysis', s.OverlayedAnalysis);
end % function
