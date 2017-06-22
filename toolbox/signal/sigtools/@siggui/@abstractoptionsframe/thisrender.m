function thisrender(this, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    pos = parserenderinputs(this, varargin{:});
    % 11 13
    hFig = get(this, 'FigureHandle');
    % 13 16
    % 14 16
    renderabstractframe(this, hFig, pos);
    % 16 18
    pos = getpixelpos(this, 'framewlabel', 1.0);
    % 18 21
    % 19 21
    [props, lbls] = getrenderprops(this);
    % 21 23
    sz = gui_sizes(this);
    nprops = length(props);
    h = plus(mtimes(sz.uh, nprops), mtimes(sz.uuvs, plus(nprops, 1.0)));
    pos = horzcat(pos(1.0), minus(plus(pos(2.0), pos(4.0)), h), pos(3.0), h);
    % 26 28
    rendercontrols(this, pos, props, lbls)
    % 28 30
    cshelpcontextmenu(this, getcshstring(this));
    % 30 32
    objspecific_render(this);
end % function
