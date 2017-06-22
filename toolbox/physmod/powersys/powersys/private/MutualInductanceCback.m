function MutualInductanceCback(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    TypeOfMutual = get_param(block, 'TypeOfMutual');
    switch TypeOfMutual
    case 'Two or three windings with equal mutual terms'
        % 13 15
        w3check = get_param(block, 'ThreeWindings');
        w3 = get_param(block, 'SelfImpedance3');
        if (strcmp('0', w3)) | (strcmp('[0]', w3))
            set_param(block, 'ThreeWindings', 'off');
            w3check = 'off';
            w2 = get_param(block, 'SelfImpedance2');
            set_param(block, 'SelfImpedance3', w2);
        end
        % 22 24
        if strcmp('on', w3check)
            set_param(block, 'maskvisibilities', {'on','off','on','on','on','on','on','off','off','on'});
            set_param(block, 'LConntags', {'a','b','c'});
            set_param(block, 'RConntags', {'A','B','C'});
            PlotIcon = 'plot(x,y+5,x,y+10,x,y+15,bx,by+10,bx,by+15)';
        else
            set_param(block, 'maskvisibilities', {'on','off','on','on','on','off','on','off','off','on'});
            set_param(block, 'LConntags', {'a','b'});
            set_param(block, 'RConntags', {'A','B'});
            PlotIcon = 'plot(x,y+5,x,y+10,bx,by+10)';
        end
        set_param(block, 'MaskDisplay', PlotIcon);
    case 'Generalized mutual inductance'
        set_param(block, 'maskvisibilities', {'on','on','off','off','off','off','off','on','on','on'});
        % 37 39
        NumberOfWindings = max(1.0, round(eval(get_param(block, 'NumberOfWindings'), '1')));
        RConnTags{1.0} = 'A';
        LConnTags{1.0} = 'a';
        if gt(NumberOfWindings, 1.0)
            RConnTags{2.0} = 'B';
            LConnTags{2.0} = 'b';
        end
        if gt(NumberOfWindings, 2.0)
            RConnTags{3.0} = 'C';
            LConnTags{3.0} = 'c';
        end
        for i=4.0:NumberOfWindings
            RConnTags{i} = horzcat('R', num2str(i));
            LConnTags{i} = horzcat('L', num2str(i));
        end % for
        set_param(block, 'LConntags', LConnTags);
        set_param(block, 'RConntags', RConnTags);
        % 55 57
        PlotIcon = 'plot(x,y+5,';
        for i=2.0:NumberOfWindings
            PlotIcon = horzcat(PlotIcon, 'x,y+', num2str(mtimes(5.0, i)), ',');
        end % for
        for i=2.0:NumberOfWindings
            PlotIcon = horzcat(PlotIcon, 'bx,by+', num2str(mtimes(5.0, i)), ',');
        end % for
        PlotIcon(end) = ')';
        set_param(block, 'MaskDisplay', PlotIcon);
    end
end
