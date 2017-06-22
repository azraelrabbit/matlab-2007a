function Ts = PowerSystemStabilizerCback(block)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    parametres = get_param(block, 'MaskValues');
    p8 = parametres{8.0};
    if strcmp(p8, 'on')
        param9 = 'on';
        param10 = 'on';
    else
        param9 = 'off';
        param10 = 'off';
    end % if
    visible = cellhorzcat('on', 'on', 'on', 'on', 'on', 'on', 'on', 'on', param9, param10);
    set_param(block, 'MaskVisibilities', visible);
    % 19 21
    [Tsensor, K, Twashout, Tleadlag1, Tleadlag2, VSlimits, Vinit, Plot_On, MagdB_On, FreqRange] = getSPSmaskvalues(block, {'Tsensor','K','Twashout','Tleadlag1','Tleadlag2','VSlimits','Vinit','Plot_On','MagdB_On','FreqRange'});
    % 21 24
    % 22 24
    T1n = Tleadlag1(1.0);
    T1d = Tleadlag1(2.0);
    T2n = Tleadlag2(1.0);
    T2d = Tleadlag2(2.0);
    % 27 29
    if eq(Plot_On, 1.0)
        % 29 31
        numS = 1.0;
        denS = horzcat(Tsensor, 1.0);
        sysS = tf(numS, denS);
        numW = horzcat(Twashout, 0.0);
        denW = horzcat(Twashout, 1.0);
        sysW = tf(numW, denW);
        numL1 = horzcat(T1n, 1.0);
        denL1 = horzcat(T1d, 1.0);
        sysL1 = tf(numL1, denL1);
        numL2 = horzcat(T2n, 1.0);
        denL2 = horzcat(T2d, 1.0);
        sysL2 = tf(numL2, denL2);
        sysG = mtimes(mtimes(mtimes(mtimes(sysS, K), sysW), sysL1), sysL2);
        % 43 46
        % 44 46
        w = mtimes(6.283185307179586, FreqRange);
        [Mag, Pha] = bode(sysG, w);
        subplot(2.0, 1.0, 1.0)
        if eq(MagdB_On, 1.0)
            Y = mtimes(20.0, log10(squeeze(Mag)));
            strLabel = 'dB';
        else
            Y = squeeze(Mag);
            strLabel = 'pu/pu';
        end % if
        % 55 57
        semilogx(FreqRange, Y)
        ylabel(strLabel);
        grid;
        title('PSS Frequency Response');
        subplot(2.0, 1.0, 2.0);
        semilogx(FreqRange, rem(squeeze(Pha), 360.0))
        ylabel('Degrees');
        grid;
        xlabel('Frequency (Hz)');
    end % if
end % function
