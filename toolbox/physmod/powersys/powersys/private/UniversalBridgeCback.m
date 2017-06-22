function UniversalBridgeCback(block, option)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch option
    case 'device configuration'
        % 10 13
        % 11 13
        visibilities = {'on';'on';'on';'on';'on';'on';'on';'on';'on';'on';'on';'off'};
        device = get_param(block, 'device');
        [Ron, Lon, VF, Vfs, WSStatus] = getSPSmaskvalues(block, {'Ron','Lon','ForwardVoltage','ForwardVoltages'}, 1.0);
        if eq(WSStatus, 0.0)
            % 16 21
            % 17 21
            % 18 21
            % 19 21
            return
        end
        % 22 24
        PowerguiInfo = getPowerguiInfo(bdroot(block));
        if PowerguiInfo.Discrete
            Lon = 0.0;
        end
        % 27 29
        if strcmp(device, 'Diodes')
            % 29 31
            if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Inport')
                if eq(Lon, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Constant', 'noprompt');
                    set_param(horzcat(block, '/g'), 'Value', 'zeros(1,Switches)');
                else
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Ground', 'noprompt');
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Terminator', 'noprompt');
                end
            end
            % 39 41
            VF_Blocktype = get_param(horzcat(block, '/VF'), 'blocktype');
            if strcmp(VF_Blocktype, 'Terminator') && ne(VF, 0.0) && eq(Lon, 0.0)
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Goto', 'noprompt');
                tag = strrep(tempname, tempdir, '');
                set_param(horzcat(block, '/VF'), 'GotoTag', tag, 'TagVisibility', 'global');
            else
                if strcmp(VF_Blocktype, 'Goto') && eq(VF, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                else
                    if strcmp(VF_Blocktype, 'Goto') && ne(Lon, 0.0)
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                    end
                end
            end
            STATUS_Blocktype = get_param(horzcat(block, '/Status'), 'blocktype');
            if strcmp(STATUS_Blocktype, 'Ground') && eq(Lon, 0.0)
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
                tag = strrep(tempname, tempdir, '');
                set_param(horzcat(block, '/Status'), 'GotoTag', tag);
            else
                if strcmp(STATUS_Blocktype, 'From') && ne(Lon, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'Ground', 'noprompt');
                end
            end
            GOTO_Blocktype = get_param(horzcat(block, '/Goto'), 'blocktype');
            if strcmp(GOTO_Blocktype, 'Terminator') && eq(Lon, 0.0)
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                tag = strrep(tempname, tempdir, '');
                set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global');
            else
                if strcmp(GOTO_Blocktype, 'Goto') && ne(Lon, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Terminator', 'noprompt');
                end
            end
            ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
            if strcmp(ITAIL_Blocktype, 'Goto')
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Terminator', 'noprompt');
            end
            ISWITCH_Blocktype = get_param(horzcat(block, '/ISWITCH'), 'blocktype');
            if eq(Lon, 0.0) && strcmp(ISWITCH_Blocktype, 'Goto')
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ISWITCH', 'Terminator', 'noprompt');
            end
            if ne(Lon, 0.0) && strcmp(ISWITCH_Blocktype, 'Terminator')
                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ISWITCH', 'Goto', 'noprompt');
                tag = strrep(tempname, tempdir, '');
                set_param(horzcat(block, '/ISWITCH'), 'GotoTag', tag, 'TagVisibility', 'global');
            end
            visibilities{6.0} = 'on';
            visibilities{7.0} = 'off';
            visibilities{8.0} = 'on';
            visibilities{9.0} = 'off';
            visibilities{10.0} = 'off';
            set_param(block, 'Maskvisibilities', visibilities);
            if eq(Ron, 0.0) && eq(Lon, 0.0)
                message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'Ron and Lon parameters cannot be set to zero at the same time. Set Ron or Lon to a value greather than zero.');
                Erreur.message = message;
                Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                psberror(Erreur);
            end
        else
            if strcmp(device, 'Thyristors')
                if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Ground')
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                    tag = strrep(tempname, tempdir, '');
                    set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global')
                end
                if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Constant')
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                end
                if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Constant')
                    % 111 113
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                end
                % 114 116
                VF_Blocktype = get_param(horzcat(block, '/VF'), 'blocktype');
                if strcmp(VF_Blocktype, 'Terminator') && ne(VF, 0.0) && eq(Lon, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Goto', 'noprompt');
                    tag = strrep(tempname, tempdir, '');
                    set_param(horzcat(block, '/VF'), 'GotoTag', tag, 'TagVisibility', 'global');
                else
                    if strcmp(VF_Blocktype, 'Goto') && eq(VF, 0.0)
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                    else
                        if strcmp(VF_Blocktype, 'Goto') && ne(Lon, 0.0)
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                        end
                    end
                end
                STATUS_Blocktype = get_param(horzcat(block, '/Status'), 'blocktype');
                if strcmp(STATUS_Blocktype, 'Ground') && eq(Lon, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
                    tag = strrep(tempname, tempdir, '');
                    set_param(horzcat(block, '/Status'), 'GotoTag', tag);
                else
                    if strcmp(STATUS_Blocktype, 'From') && ne(Lon, 0.0)
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'Ground', 'noprompt');
                    end
                end
                GOTO_Blocktype = get_param(horzcat(block, '/Goto'), 'blocktype');
                if strcmp(GOTO_Blocktype, 'Terminator') && eq(Lon, 0.0)
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                    tag = strrep(tempname, tempdir, '');
                    set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global');
                else
                    if strcmp(GOTO_Blocktype, 'Goto') && ne(Lon, 0.0)
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Terminator', 'noprompt');
                    end
                end
                ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
                if strcmp(ITAIL_Blocktype, 'Goto')
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Terminator', 'noprompt');
                end
                ISWITCH_Blocktype = get_param(horzcat(block, '/ISWITCH'), 'blocktype');
                if eq(Lon, 0.0) && strcmp(ISWITCH_Blocktype, 'Goto')
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ISWITCH', 'Terminator', 'noprompt');
                end
                if ne(Lon, 0.0) && strcmp(ISWITCH_Blocktype, 'Terminator')
                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ISWITCH', 'Goto', 'noprompt');
                    tag = strrep(tempname, tempdir, '');
                    set_param(horzcat(block, '/ISWITCH'), 'GotoTag', tag, 'TagVisibility', 'global');
                end
                visibilities{6.0} = 'on';
                visibilities{7.0} = 'off';
                visibilities{8.0} = 'on';
                visibilities{9.0} = 'off';
                visibilities{10.0} = 'off';
                set_param(block, 'Maskvisibilities', visibilities);
                if eq(Ron, 0.0) && eq(Lon, 0.0)
                    message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'Ron and Lon parameters cannot be set to zero at the same time. Set Ron or Lon to a value greather than zero.');
                    Erreur.message = message;
                    Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                    psberror(Erreur);
                end
            else
                if strcmp(device, 'GTO / Diodes')
                    VF = Vfs(1.0);
                    % 177 179
                    if not(isequal(size(Vfs), [1.0 2.0]))
                        message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The forward voltages [Vf Vfd] parameter must be a 1-by-2 vector with positive or null values.');
                        % 180 182
                        Erreur.message = message;
                        Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                        psberror(Erreur);
                    else
                        if lt(Vfs(1.0), 0.0) || lt(Vfs(2.0), 0.0)
                            message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The forward voltages [Vf Vfd] parameter must be a 1-by-2 vector with positive or null values.');
                            % 187 189
                            Erreur.message = message;
                            Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                            psberror(Erreur);
                        end
                    end
                    % 193 195
                    if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Ground')
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                        tag = strrep(tempname, tempdir, '');
                        set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global')
                    end
                    if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Constant')
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                    end
                    % 203 205
                    VF_Blocktype = get_param(horzcat(block, '/VF'), 'blocktype');
                    if strcmp(VF_Blocktype, 'Terminator') && ne(VF, 0.0)
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Goto', 'noprompt');
                        tag = strrep(tempname, tempdir, '');
                        set_param(horzcat(block, '/VF'), 'GotoTag', tag, 'TagVisibility', 'global');
                    else
                        if strcmp(VF_Blocktype, 'Goto') && eq(VF, 0.0)
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                        end
                    end
                    STATUS_Blocktype = get_param(horzcat(block, '/Status'), 'blocktype');
                    if strcmp(STATUS_Blocktype, 'Ground')
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
                        tag = strrep(tempname, tempdir, '');
                        set_param(horzcat(block, '/Status'), 'GotoTag', tag, 'TagVisibility', 'global');
                    end
                    GOTO_Blocktype = get_param(horzcat(block, '/Goto'), 'blocktype');
                    if strcmp(GOTO_Blocktype, 'Terminator')
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                        tag = strrep(tempname, tempdir, '');
                        set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global');
                    end
                    % 226 228
                    ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
                    if strcmp(ITAIL_Blocktype, 'Terminator')
                        replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Goto', 'noprompt');
                        tag = strrep(tempname, tempdir, '');
                        set_param(horzcat(block, '/ITAIL'), 'GotoTag', tag, 'TagVisibility', 'global');
                    end
                    % 233 235
                    visibilities{6.0} = 'off';
                    visibilities{7.0} = 'on';
                    visibilities{8.0} = 'off';
                    visibilities{9.0} = 'on';
                    visibilities{10.0} = 'off';
                    set_param(block, 'Maskvisibilities', visibilities);
                else
                    if strcmp(device, 'MOSFET / Diodes')
                        % 242 244
                        if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Ground')
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                            tag = strrep(tempname, tempdir, '');
                            set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global')
                        end
                        if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Constant')
                            % 250 252
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                        end
                        % 253 255
                        if strcmp(get_param(horzcat(block, '/VF'), 'blocktype'), 'Goto')
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                        end
                        % 257 259
                        STATUS_Blocktype = get_param(horzcat(block, '/Status'), 'blocktype');
                        if strcmp(STATUS_Blocktype, 'Ground')
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
                            tag = strrep(tempname, tempdir, '');
                            set_param(horzcat(block, '/Status'), 'GotoTag', tag, 'TagVisibility', 'global');
                        end
                        % 264 266
                        GOTO_Blocktype = get_param(horzcat(block, '/Goto'), 'blocktype');
                        if strcmp(GOTO_Blocktype, 'Terminator')
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                            tag = strrep(tempname, tempdir, '');
                            set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global');
                        end
                        % 271 274
                        % 272 274
                        ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
                        if strcmp(ITAIL_Blocktype, 'Terminator')
                            replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Goto', 'noprompt');
                            tag = strrep(tempname, tempdir, '');
                            set_param(horzcat(block, '/ITAIL'), 'GotoTag', tag, 'TagVisibility', 'global');
                        end
                        % 279 281
                        visibilities{6.0} = 'off';
                        visibilities{7.0} = 'off';
                        visibilities{8.0} = 'off';
                        visibilities{9.0} = 'off';
                        visibilities{10.0} = 'off';
                        set_param(block, 'Maskvisibilities', visibilities);
                    else
                        if strcmp(device, 'IGBT / Diodes')
                            % 288 290
                            VF = Vfs(1.0);
                            % 290 292
                            if not(isequal(size(Vfs), [1.0 2.0]))
                                message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The ''forward voltages [Vf Vfd]'' parameter must be a 1-by-2 vector with positive or null values.');
                                % 293 295
                                Erreur.message = message;
                                Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                                psberror(Erreur);
                            else
                                if lt(Vfs(1.0), 0.0) || lt(Vfs(2.0), 0.0)
                                    message = horzcat('In mask of ''', block, ''' block:', char(10.0), 'The ''forward voltages [Vf Vfd]'' parameter must be a 1-by-2 vector with positive or null values.');
                                    % 300 302
                                    Erreur.message = message;
                                    Erreur.identifier = 'SimPowerSystems:BlockParameterError';
                                    psberror(Erreur);
                                end
                            end
                            % 306 308
                            if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Ground')
                                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                                tag = strrep(tempname, tempdir, '');
                                set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global')
                            end
                            if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Constant')
                                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                            end
                            % 316 318
                            VF_Blocktype = get_param(horzcat(block, '/VF'), 'blocktype');
                            if strcmp(VF_Blocktype, 'Terminator') && ne(VF, 0.0)
                                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Goto', 'noprompt');
                                tag = strrep(tempname, tempdir, '');
                                set_param(horzcat(block, '/VF'), 'GotoTag', tag, 'TagVisibility', 'global');
                            else
                                if strcmp(VF_Blocktype, 'Goto') && eq(VF, 0.0)
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                                end
                            end
                            STATUS_Blocktype = get_param(horzcat(block, '/Status'), 'blocktype');
                            if strcmp(STATUS_Blocktype, 'Ground')
                                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
                                tag = strrep(tempname, tempdir, '');
                                set_param(horzcat(block, '/Status'), 'GotoTag', tag, 'TagVisibility', 'global');
                            end
                            GOTO_Blocktype = get_param(horzcat(block, '/Goto'), 'blocktype');
                            if strcmp(GOTO_Blocktype, 'Terminator')
                                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                                tag = strrep(tempname, tempdir, '');
                                set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global');
                            end
                            % 339 341
                            ITAIL_Blocktype = get_param(horzcat(block, '/ITAIL'), 'blocktype');
                            if strcmp(ITAIL_Blocktype, 'Terminator')
                                replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Goto', 'noprompt');
                                tag = strrep(tempname, tempdir, '');
                                set_param(horzcat(block, '/ITAIL'), 'GotoTag', tag, 'TagVisibility', 'global');
                            end
                            % 346 348
                            visibilities{6.0} = 'off';
                            visibilities{7.0} = 'on';
                            visibilities{8.0} = 'off';
                            visibilities{9.0} = 'off';
                            visibilities{10.0} = 'on';
                            set_param(block, 'Maskvisibilities', visibilities);
                        else
                            if strcmp(device, 'Ideal Switches')
                                % 355 357
                                if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Ground')
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                                    tag = strrep(tempname, tempdir, '');
                                    set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global')
                                end
                                if strcmp(get_param(horzcat(block, '/g'), 'blocktype'), 'Constant')
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'g', 'Inport', 'noprompt');
                                end
                                % 365 367
                                if strcmp(get_param(horzcat(block, '/VF'), 'blocktype'), 'Goto')
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'VF', 'Terminator', 'noprompt');
                                end
                                % 369 371
                                STATUS_Blocktype = get_param(horzcat(block, '/Status'), 'blocktype');
                                if strcmp(STATUS_Blocktype, 'Ground')
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Status', 'From', 'noprompt');
                                    tag = strrep(tempname, tempdir, '');
                                    set_param(horzcat(block, '/Status'), 'GotoTag', tag, 'TagVisibility', 'global');
                                end
                                % 376 378
                                GOTO_Blocktype = get_param(horzcat(block, '/Goto'), 'blocktype');
                                if strcmp(GOTO_Blocktype, 'Terminator')
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'Goto', 'Goto', 'noprompt');
                                    tag = strrep(tempname, tempdir, '');
                                    set_param(horzcat(block, '/Goto'), 'GotoTag', tag, 'TagVisibility', 'global');
                                end
                                % 383 385
                                if strcmp(get_param(horzcat(block, '/ITAIL'), 'blocktype'), 'Goto')
                                    replace_block(block, 'Followlinks', 'on', 'SearchDepth', 1.0, 'Name', 'ITAIL', 'Terminator', 'noprompt');
                                end
                                % 387 389
                                visibilities{6.0} = 'off';
                                visibilities{7.0} = 'off';
                                visibilities{8.0} = 'off';
                                visibilities{9.0} = 'off';
                                visibilities{10.0} = 'off';
                                set_param(block, 'Maskvisibilities', visibilities);
                                % 394 396
                            end
                        end
                    end
                end
            end
        end
    case 'BridgeArms'
        Arms = eval(get_param(block, 'arms'));
        ports = get_param(block, 'ports');
        PortHandles = get_param(horzcat(block, '/UniversalBridge'), 'PortHandles');
        possibilities = mat2str(horzcat(ports(6.0), Arms));
        switch possibilities
        case '[3 2]'
            ligne = get_param(PortHandles.LConn(3.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/C'));
        case '[3 1]'
            ligne = get_param(PortHandles.LConn(3.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/C'));
            ligne = get_param(PortHandles.LConn(2.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/B'));
        case '[2 1]'
            ligne = get_param(PortHandles.LConn(2.0), 'line');
            delete_line(ligne);
            delete_block(horzcat(block, '/B'));
        case '[2 3]'
            add_block('built-in/PMIOPort', horzcat(block, '/C'));
            set_param(horzcat(block, '/C'), 'Position', [20.0 95.0 50.0 115.0], 'orientation', 'right', 'port', '3');
            set_param(horzcat(block, '/C'), 'side', 'Left');
            CPortHandle = get_param(horzcat(block, '/C'), 'PortHandles');
            add_line(block, PortHandles.LConn(3.0), CPortHandle.RConn);
        case '[1 2]'
            add_block('built-in/PMIOPort', horzcat(block, '/B'));
            set_param(horzcat(block, '/B'), 'Position', [20.0 65.0 50.0 85.0], 'orientation', 'right', 'port', '2');
            set_param(horzcat(block, '/B'), 'side', 'Left');
            BPortHandle = get_param(horzcat(block, '/B'), 'PortHandles');
            add_line(block, PortHandles.LConn(2.0), BPortHandle.RConn);
        case '[1 3]'
            add_block('built-in/PMIOPort', horzcat(block, '/B'));
            set_param(horzcat(block, '/B'), 'Position', [20.0 65.0 50.0 85.0], 'orientation', 'right', 'port', '2');
            set_param(horzcat(block, '/B'), 'side', 'Left');
            BPortHandle = get_param(horzcat(block, '/B'), 'PortHandles');
            add_line(block, PortHandles.LConn(2.0), BPortHandle.RConn);
            add_block('built-in/PMIOPort', horzcat(block, '/C'));
            set_param(horzcat(block, '/C'), 'Position', [20.0 95.0 50.0 115.0], 'orientation', 'right', 'port', '3');
            set_param(horzcat(block, '/C'), 'side', 'Left');
            CPortHandle = get_param(horzcat(block, '/C'), 'PortHandles');
            add_line(block, PortHandles.LConn(3.0), CPortHandle.RConn);
        end
    end
end
