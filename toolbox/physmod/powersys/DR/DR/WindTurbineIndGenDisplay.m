function WindTurbineIndGenDisplay(block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    block = getfullname(block);
    DisplayTurbChar = get_param(block, 'DisplayTurbChar');
    if strcmp(DisplayTurbChar, 'on')
        fig_num = figure;
        clf(fig_num);
        [wind_base, P_wind_base, speed_nom, pitch_angle] = getSPSmaskvalues(gcb, {'wind_base','P_wind_base','speed_nom','pitch_angle'});
        lambda_nom = str2num(get_param(horzcat(gcb, '/Wind Turbine'), 'lambda_nom'));
        cp_nom = str2num(get_param(horzcat(gcb, '/Wind Turbine'), 'cp_nom'));
        c1_c6 = str2num(get_param(horzcat(gcb, '/Wind Turbine'), 'c1_c6'));
        c1 = c1_c6(1.0);
        c2 = c1_c6(2.0);
        c3 = c1_c6(3.0);
        c4 = c1_c6(4.0);
        c5 = c1_c6(5.0);
        c6 = c1_c6(6.0);
        % 25 34
        % 26 34
        % 27 34
        % 28 34
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        wr_elec_pu = [.001 .011 .021 .031 .041 .051000000000000004 .061 .07100000000000001 .081 .091 .101 .111 .121 .131 .14100000000000001 .151 .161 .171 .181 .191 .201 .211 .221 .231 .241 .251 .261 .271 .281 .291 .301 .311 .321 .331 .341 .35100000000000003 .361 .371 .381 .391 .401 .41100000000000003 .421 .431 .441 .451 .461 .47100000000000003 .481 .491 .501 .511 .521 .531 .541 .551 .561 .5710000000000001 .581 .591 .601 .611 .621 .631 .641 .651 .661 .671 .681 .6910000000000001 .7010000000000001 .711 .721 .731 .741 .7509999999999999 .7609999999999999 .7709999999999999 .7809999999999999 .7909999999999998 .8009999999999998 .8109999999999998 .8209999999999998 .8309999999999998 .8409999999999999 .8509999999999999 .8609999999999999 .8709999999999999 .8809999999999999 .8909999999999999 .9009999999999999 .9109999999999999 .9209999999999998 .9309999999999998 .9409999999999998 .9509999999999998 .9609999999999999 .9709999999999999 .9809999999999999 .9909999999999999 1.001 1.011 1.021 1.031 1.041 1.051 1.061 1.071 1.081 1.0909999999999997 1.101 1.1109999999999998 1.121 1.1309999999999998 1.1409999999999998 1.1509999999999998 1.1609999999999998 1.1709999999999998 1.1809999999999998 1.1909999999999998 1.2009999999999998 1.2109999999999999 1.2209999999999999 1.2309999999999999 1.2409999999999999 1.251 1.261 1.271 1.281 1.291 1.301 1.311 1.321 1.331 1.341 1.351 1.3609999999999998 1.371 1.3809999999999998 1.3909999999999998 1.4009999999999998 1.4109999999999998 1.4209999999999998 1.4309999999999998 1.4409999999999998 1.4509999999999998 1.4609999999999999 1.4709999999999999 1.4809999999999999 1.4909999999999999];
        wr_mec_pu = mrdivide(wr_elec_pu, speed_nom);
        wind_max = ceil(mtimes(mpower(mrdivide(1.2, P_wind_base), .3333333333333333), wind_base));
        wind_min = round(mtimes(mpower(mrdivide(.1, P_wind_base), .3333333333333333), wind_base));
        wind1 = wind_min:mrdivide(minus(wind_base, wind_min), 5.0):wind_base;
        wind2 = plus(wind_base, mrdivide(minus(wind_base, wind_min), 5.0)):mrdivide(minus(wind_base, wind_min), 5.0):wind_max;
        wind_pu = mrdivide(horzcat(wind1, wind2), wind_base);
        % 40 42
        for k=1.0:length(wind_pu)
            for i=1.0:length(wr_mec_pu)
                lambda_pu = mrdivide(wr_mec_pu(i), wind_pu(k));
                lambda = mtimes(lambda_pu, lambda_nom);
                lambda_i = mrdivide(1.0, minus(mrdivide(1.0, plus(lambda, mtimes(.08, pitch_angle))), mrdivide(.035, plus(mpower(pitch_angle, 3.0), 1.0))));
                cp = plus(mtimes(mtimes(c1, minus(minus(mrdivide(c2, lambda_i), mtimes(c3, pitch_angle)), c4)), exp(mrdivide(uminus(c5), lambda_i))), mtimes(c6, lambda));
                cp_pu = mrdivide(cp, cp_nom);
                Pwind_pu(k, i) = mtimes(mtimes(mpower(wind_pu(k), 3.0), cp_pu), P_wind_base);
            end % for
        end % for
        for k=1.0:length(wind_pu)
            plot(wr_elec_pu, Pwind_pu(k, :))
            hold('on')
        end % for
        % 55 57
        plot(horzcat(speed_nom, speed_nom, 0.0), horzcat(0.0, P_wind_base, P_wind_base), 'r--')
        text(plus(speed_nom, .01), .05, sprintf('%0.4g pu', speed_nom))
        text(.01, plus(P_wind_base, .05), sprintf('Max. power at base wind speed (%0.4g m/s) and beta = 0 deg', wind_base))
        for i=1.0:length(wind_pu)
            p_max(i) = max(Pwind_pu(i, :));
            speed(i) = wr_elec_pu(find(eq(Pwind_pu(i, :), p_max(i))));
            text(speed(i), p_max(i), sprintf('%0.4g m/s', mtimes(wind_pu(i), wind_base)))
        end % for
        plot(horzcat(0.0, max(wr_elec_pu)), [0.0 0.0], '--')
        % 65 67
        xlabel('Turbine speed (pu of nominal generator speed)')
        ylabel('Turbine output power (pu of nominal mechanical power)')
        axis(horzcat(0.0, max(wr_elec_pu), min(Pwind_pu(1.0, :)), max(plus(P_wind_base, .1), plus(mtimes(mpower(max(wind_pu), 3.0), P_wind_base), .1))))
        title(sprintf('Turbine Power Characteristics (Pitch angle beta = %0.4g deg)', pitch_angle))
        set_param(gcb, 'DisplayTurbChar', 'off')
    end % if
end % function
