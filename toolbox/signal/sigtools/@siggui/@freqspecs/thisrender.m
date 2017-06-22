function thisrender(this, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pos = parserenderinputs(this, varargin{:});
    if isempty(pos)
        pos = 'freq';
    end % if
    super_render(this, pos);
    % 13 15
    pos = getpixelpos(this, 'framewlabel', 1.0);
    % 15 18
    % 16 18
    render(getcomponent(this, 'siggui.specsfsspecifier'), this.FigureHandle, pos);
    % 18 21
    % 19 21
    sz = gui_sizes(this);
    % 21 24
    % 22 24
    render(getcomponent(this, 'siggui.labelsandvalues'), this.FigureHandle, horzcat(plus(pos(1.0), mtimes(2.0, sz.hfus)), plus(pos(2.0), mtimes(1.5, sz.hfus)), minus(minus(pos(3.0), mtimes(2.0, sz.hfus)), mtimes(17.0, sz.pixf)), minus(pos(4.0), mtimes(90.0, sz.pixf))));
    % 24 28
    % 25 28
    % 26 28
    cshelpcontextmenu(this, 'fdatool_ALL_freq_specs_frame');
end % function
