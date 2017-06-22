function thisrender(this, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pos = parserenderinputs(this, varargin{:});
    % 8 10
    sz = gui_sizes(this);
    % 10 12
    if isempty(pos)
        x = mtimes(68.0, sz.pixf);
        y = mtimes(75.0, sz.pixf);
        y2 = minus(minus(y, sz.bh), sz.uuvs);
        h2 = mtimes(205.0, sz.pixf);
        w2 = mtimes(707.0, sz.pixf);
    else
        x = plus(pos(1.0), sz.ffs);
        y = plus(plus(pos(2.0), sz.bh), sz.uuvs);
        y2 = pos(2.0);
        w2 = pos(3.0);
        h2 = plus(minus(minus(minus(pos(4.0), sz.bh), sz.uuvs), sz.vffs), mtimes(2.0, sz.pixf));
    end % if
    w = mtimes(174.0, sz.pixf);
    h1 = mtimes(76.0, sz.pixf);
    % 26 28
    hFig = get(this, 'FigureHandle');
    % 28 30
    hft = getcomponent(this, '-class', 'siggui.selector', 'Name', 'Response Type');
    render(hft, hFig, horzcat(x, y, w, h2), horzcat(x, plus(plus(y, h1), sz.uuvs), w, minus(minus(h2, h1), plus(sz.uuvs, sz.vfus))));
    cshelpcontextmenu(hft, this.ResponseTypeCSHTag);
    % 32 34
    hdm = getcomponent(this, '-class', 'siggui.selector', 'Name', 'Design Method');
    render(hdm, hFig, horzcat(x, y, w, h1));
    cshelpcontextmenu(hdm, 'fdatool_design_method_frame');
    % 36 38
    renderactionbtn(this, horzcat(x, y2, w2, h1), 'Design Filter', 'design', 'design filter');
    % 38 40
    attachlisteners(this);
    % 40 43
    % 41 43
    lclbuildcurrent(this);
end % function
function lclbuildcurrent(this)
    % 45 49
    % 46 49
    % 47 49
    hFig = get(this, 'FigureHandle');
    % 49 51
    hcomp = horzcat(siggui.filterorder, siggui.remezoptionsframe);
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    render(hcomp(1.0), hFig);
    render(hcomp(2.0), hFig);
    hframe = horzcat(hcomp, siggui.freqspecs, siggui.magspecs);
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    set(hframe(3.0), 'Labels', {'Fpass','Fstop'}, 'Values', {'9600','12000'});
    set(hframe(4.0), 'Labels', {'Apass','Astop'}, 'Values', {'1','80'});
    % 67 69
    render(hframe(3.0), hFig);
    render(hframe(4.0), hFig);
    % 70 72
    addcomponent(this, hcomp);
    set(this, 'Frames', hframe);
    set(this, 'ActiveComponents', hframe);
    % 74 76
    listeners(this, [], 'addlisteners2components');
end % function
function attachlisteners(this)
    % 78 81
    % 79 81
    hDM = getcomponent(this, '-class', 'siggui.selector', 'Name', 'Design Method');
    hFT = getcomponent(this, '-class', 'siggui.selector', 'Name', 'Response Type');
    hU = siggetappdata(this.FigureHandle, 'siggui', 'undomanager', 'handle');
    % 83 85
    listener = vertcat(handle.listener(hDM, 'NewSelection', cellhorzcat(@listeners, 'designmethod_listener')), handle.listener(hDM, 'NewSubSelection', cellhorzcat(@listeners, 'designmethod_listener')), handle.listener(hFT, 'NewSelection', cellhorzcat(@listeners, 'responsetype_listener')), handle.listener(hFT, 'NewSubSelection', cellhorzcat(@listeners, 'responsetype_listener')), handle.listener(this, this.findprop('CurrentDesignMethod'), 'PropertyPostSet', cellhorzcat(@listeners, 'currentdesignmethod_listener')), handle.listener(this, this.findprop('StaticResponse'), 'PropertyPostSet', cellhorzcat(@listeners, 'staticresponse_listener')));
    % 85 96
    % 86 96
    % 87 96
    % 88 96
    % 89 96
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    set(listener, 'CallbackTarget', this);
    set(this, 'WhenRenderedListeners', listener);
    % 97 99
    setupenablelink(this, 'isdesigned', false, 'design');
end % function
