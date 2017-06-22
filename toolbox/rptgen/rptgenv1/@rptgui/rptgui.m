function out = rptgui(input)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    emptyFlag = logical(1);
    KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE = [];
    % 20 23
    % 21 23
    if gt(nargin, 0.0)
        if (isa(input, 'rptgui')) | (isempty(input))
            KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE = input;
        else
            if (isa(input, 'rptsp')) | (isa(input, 'rptsetupfile'))
                if emptyFlag
                    KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE = LocCreateObject(rptsp(input));
                else
                    KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE = LocAmmendObject(KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE, rptsp(input));
                    % 31 35
                    % 32 35
                    % 33 35
                end
            else
                KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE = LocCreateObject(rptsetupfile);
                % 37 39
            end
        end
    else
        if emptyFlag
            KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE = LocCreateObject(rptsetupfile);
        end
    end
    out = KEEP_THIS_GUI_OBJECT_FOR_FUTURE_REFERENCE;
end
function out = LocCreateObject(s)
    % 48 51
    % 49 51
    out.hg.all = struct('Units', 'points', 'HandleVisibility', 'off');
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    out.s = LocPrep(s);
    % 56 58
    out.c = rptcp;
    % 58 61
    % 59 61
    out.h = struct('fig', [], 'title', []);
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    out.ref = struct('OpenSetfiles', double(s), 'allcomps', [], 'ComponentPointer', [], 'grud', 'rgstoregui', 'Pointer', '', 'ObjectBrowserHandle', []);
    % 66 78
    % 67 78
    % 68 78
    % 69 78
    % 70 78
    % 71 78
    % 72 78
    % 73 78
    % 74 78
    % 75 78
    % 76 78
    r = rptparent;
    bH = layoutbarht(r);
    % 79 81
    ppx = pointsperpixel(r);
    % 81 83
    BS = mtimes(33.333333333333336, ppx);
    PD = mrdivide(bH, 3.0);
    % 84 86
    out.layout = struct('statbarht', bH, 'tabht', mrdivide(mtimes(bH, 4.0), 3.0), 'padding', PD, 'btnside', BS, 'outlinewidth', 300.0, 'tabbodywidth', 700.0, 'tabbodyht', 0.0, 'minTabBodyWidth', mtimes(8.0, bH), 'minOutlineWidth', mrdivide(mtimes(mtimes(8.0, bH), 3.0), 7.0), 'minTabBodyHt', plus(mtimes(7.0, BS), mtimes(4.0, PD)), 'figWidth', 0.0, 'figHeight', 0.0);
    % 86 100
    % 87 100
    % 88 100
    % 89 100
    % 90 100
    % 91 100
    % 92 100
    % 93 100
    % 94 100
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    out = class(out, 'rptgui', r);
end
function g = LocAmmendObject(g, s)
    % 102 105
    % 103 105
    g.s = LocPrep(s);
    g.ref.OpenSetfiles(plus(end, 1.0)) = double(s);
    g.h.Main.outline = outlinehandle(s, g.hg.all);
    g.c = rptcp;
end
function s = LocPrep(s)
    % 110 114
    % 111 114
    % 112 114
    s.ref.changed = logical(0);
end
