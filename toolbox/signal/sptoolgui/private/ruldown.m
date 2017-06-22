function ruldown(ruler_num)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    fig = gcf;
    if justzoom(fig)
        return
    end
    ud = get(fig, 'userdata');
    p = get(ud.mainaxes, 'currentpoint');
    if eq(ruler_num, 0.0)
        % 19 21
        mpos = get(ud.mainaxes, 'position');
        if eq(ud.ruler.type(1.0), 'h')
            five_pix = mrdivide(mtimes(3.5, diff(get(ud.mainaxes, 'ylim'))), mpos(4.0));
            ruler_num = minus(2.0, le(abs(minus(p(1.0, 2.0), ud.ruler.value.y1)), five_pix));
        else
            five_pix = mrdivide(mtimes(3.5, diff(get(ud.mainaxes, 'xlim'))), mpos(3.0));
            ruler_num = minus(2.0, le(abs(minus(p(1.0, 1.0), ud.ruler.value.x1)), five_pix));
        end
    else
        if strcmp(get(gcf, 'pointer'), 'arrow')
            % 30 36
            % 31 36
            % 32 36
            % 33 36
            % 34 36
            return
        end
    end
    if eq(ud.pointer, 2.0)
        sbhelp('rulerdown', num2str(ruler_num))
        return
    end
    % 42 44
    save_wbmf = get(fig, 'windowbuttonmotionfcn');
    % 44 46
    setptr(fig, 'closedhand')
    set(ud.ruler.lines(1.0), 'userdata', 0.0)
    % 47 49
    set(fig, 'windowbuttonmotionfcn', horzcat('sbswitch(''rulermo'',', num2str(ruler_num), ')'))
    % 49 51
    set(fig, 'windowbuttonupfcn', 'sbuserdata = get(gcf,''userdata''); set(sbuserdata.ruler.lines(1),''userdata'',1), clear sbuserdata')
    % 51 54
    % 52 54
    waitfor(ud.ruler.lines(1.0), 'userdata', 1.0)
    % 54 57
    % 55 57
    setptr(fig, horzcat('hand', num2str(ruler_num)))
    set(fig, 'windowbuttonmotionfcn', save_wbmf);
    set(fig, 'windowbuttonupfcn', '');
end
