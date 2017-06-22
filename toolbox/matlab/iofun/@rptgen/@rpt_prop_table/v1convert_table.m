function att = v1convert_table(this, att, varargin)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    if isnumeric(att.TitleRender)
        att.TitleRender = 'p v';
    else
        if eq(att.TitleRender(1.0), 'P')
            att.TitleRender(1.0) = 'N';
        end
    end
    set(this.TableTitle, 'Text', att.TableTitle, 'Render', att.TitleRender);
    % 35 39
    % 36 39
    % 37 39
    att = rmfield(att, {'TableTitle';'TitleRender';'isRemoveEmptyColumns';'isRemoveEmptyRows'});
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    tc = ctranspose(att.TableContent);
    tc = tc(:);
    % 47 49
    for i=length(tc):-1.0:1.0
        tcNew(i, 1.0) = rptgen.rpt_prop_cell(tc(i));
        connect(tcNew(i, 1.0), this, 'up');
    end % for
    % 52 54
    att.TableContent = tcNew;
    % 54 56
    if not(att.SingleValueMode)
        % 56 61
        % 57 61
        % 58 61
        % 59 61
        att.ColWidths = reshape(att.ColWidths, 2.0, mrdivide(length(att.ColWidths), 2.0));
        att.ColWidths = sum(att.ColWidths);
    end
end
