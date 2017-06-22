function psbloadfunction(block, flag, statut)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if isnumeric(block)
        block = getfullname(block);
    end % if
    % 12 14
    system = bdroot(block);
    IsLibrary = strcmp(get_param(system, 'BlockDiagramType'), 'library');
    if strcmp(system, 'powerlib') || strcmp(system, 'powerlib2')
        return;
    end % if
    % 18 21
    % 19 21
    if strcmp(flag, 'InitFcnOfSPSBlocks')
        % 21 23
        flag = statut;
        ReferenceBlockRoot = bdroot(get_param(block, 'ReferenceBlock'));
        ElectricDrivelibBlock = or(strcmp('electricdrivelib_models', ReferenceBlockRoot), strcmp('electricdrivelib', ReferenceBlockRoot));
        if not(ElectricDrivelibBlock)
            warning(horzcat('The library link of the block named ''', block, ''' appears to be delinked. Relink this block to powerlib in order to update correctly your model'));
        end % if
    end % if
    % 29 31
    switch flag
    case 'goto'
        % 32 35
        % 33 35
        CurrentTag = get_param(horzcat(block, '/Goto'), 'GotoTag');
        if IsLibrary
            if not(strcmp(CurrentTag, 'LibraryTag'))
                set_param(horzcat(block, '/Goto'), 'GotoTag', 'LibraryTag');
            end % if
            return;
        end % if
        if strcmp(CurrentTag, 'LibraryTag')
            statut = 'UpdateGotoTag';
        end % if
        % 44 47
        % 45 47
        switch statut
        case 'UpdateGotoTag'
            tag = tempname;
            set_param(horzcat(block, '/Goto'), 'GotoTag', tag(minus(end, 7.0):end))
        end % switch
    case 'from'
        % 52 55
        % 53 55
        CurrentTag = get_param(horzcat(block, '/From'), 'GotoTag');
        if IsLibrary
            if not(strcmp(CurrentTag, 'LibraryTag'))
                set_param(horzcat(block, '/From'), 'GotoTag', 'LibraryTag');
            end % if
            return;
        end % if
        if strcmp(CurrentTag, 'LibraryTag')
            statut = 'UpdateGotoTag';
        end % if
        % 64 67
        % 65 67
        switch statut
        case 'UpdateGotoTag'
            tag = tempname;
            set_param(horzcat(block, '/From'), 'GotoTag', tag(minus(end, 7.0):end));
        end % switch
    case 'gotofrom'
        % 72 75
        % 73 75
        CurrentTagG = get_param(horzcat(block, '/Goto'), 'GotoTag');
        CurrentTagF = get_param(horzcat(block, '/From'), 'GotoTag');
        if IsLibrary
            if not(strcmp(CurrentTagG, 'LibraryTag')) || not(strcmp(CurrentTagF, 'LibraryTag'))
                set_param(horzcat(block, '/Goto'), 'GotoTag', 'LibraryTag');
                set_param(horzcat(block, '/From'), 'GotoTag', 'LibraryTag');
            end % if
            return;
        end % if
        if strcmp(CurrentTagG, 'LibraryTag') || strcmp(CurrentTagF, 'LibraryTag')
            statut = 'UpdateGotoTag';
        end % if
        % 86 90
        % 87 90
        % 88 90
        switch statut
        case 'UpdateGotoTag'
            tag = tempname;
            set_param(horzcat(block, '/Goto'), 'GotoTag', tag(minus(end, 7.0):end));
            tag = tempname;
            set_param(horzcat(block, '/From'), 'GotoTag', tag(minus(end, 7.0):end))
        end % switch
    case 'gotogotofrom'
        % 97 100
        % 98 100
        CurrentTagG1 = get_param(horzcat(block, '/Goto1'), 'GotoTag');
        if strcmp(get_param(horzcat(block, '/Goto2'), 'BlockType'), 'Goto')
            CurrentTagG2 = get_param(horzcat(block, '/Goto2'), 'GotoTag');
            Goto2 = 1.0;
        else
            CurrentTagG2 = 'TerminatorBlock';
            Goto2 = 0.0;
        end % if
        CurrentTagF = get_param(horzcat(block, '/From'), 'GotoTag');
        if IsLibrary
            if not(strcmp(CurrentTagG1, 'LibraryTag')) || not(strcmp(CurrentTagF, 'LibraryTag'))
                set_param(horzcat(block, '/Goto1'), 'GotoTag', 'LibraryTag');
                set_param(horzcat(block, '/From'), 'GotoTag', 'LibraryTag');
                if Goto2
                    set_param(horzcat(block, '/Goto2'), 'GotoTag', 'LibraryTag');
                end % if
            end % if
            return;
        end % if
        if strcmp(CurrentTagG1, 'LibraryTag') || strcmp(CurrentTagG2, 'LibraryTag') || strcmp(CurrentTagF, 'LibraryTag')
            statut = 'UpdateGotoTag';
        end % if
        % 121 125
        % 122 125
        % 123 125
        switch statut
        case 'UpdateGotoTag'
            tag = tempname;
            set_param(horzcat(block, '/Goto1'), 'GotoTag', tag(minus(end, 7.0):end));
            if Goto2
                tag = tempname;
                set_param(horzcat(block, '/Goto2'), 'GotoTag', tag(minus(end, 7.0):end));
            end % if
            tag = tempname;
            set_param(horzcat(block, '/From'), 'GotoTag', tag(minus(end, 7.0):end))
        end % switch
    case 'configurable bridge'
        % 136 139
        % 137 139
        if not(strcmp(get_param(block, 'device'), 'Diodes'))
            CurrentTag = get_param(horzcat(block, '/Goto'), 'GotoTag');
            if IsLibrary
                if not(strcmp(CurrentTag, 'LibraryTag'))
                    set_param(horzcat(block, '/Goto'), 'GotoTag', 'LibraryTag');
                end % if
                return;
            end % if
            if strcmp(CurrentTag, 'LibraryTag')
                statut = 'UpdateGotoTag';
            end % if
            % 149 153
            % 150 153
            % 151 153
            switch statut
            case 'UpdateGotoTag'
                tag = tempname;
                set_param(horzcat(block, '/Goto'), 'GotoTag', tag(minus(end, 7.0):end))
            end % switch
        end % if
    case '3-Phase VI Measurement'
        % 159 162
        % 160 162
        SourceBlockType = get_param(horzcat(block, '/source'), 'BlockType');
        % 162 165
        % 163 165
        if strcmp(statut, 'VerifyPhasor') || isempty(statut)
            statut = 'UpdateGotoTag';
        end % if
        % 167 169
        if strcmp(SourceBlockType, 'From')
            CurrentTag = get_param(horzcat(block, '/source'), 'GotoTag');
            if strcmp(CurrentTag, 'LibraryTag')
                statut = 'UpdateGotoTag';
            end % if
        else
            if strcmp(statut, 'UpdateGotoTag')
                % 175 177
                replace_block(block, 'Followlinks', 'on', 'Name', 'source', 'built-in/From', 'noprompt');
            end % if
        end % if
        % 179 181
        if IsLibrary
            CurrentTag = get_param(horzcat(block, '/source'), 'GotoTag');
            if not(strcmp(CurrentTag, 'LibraryTag'))
                set_param(horzcat(block, '/source'), 'GotoTag', 'LibraryTag');
                set_param(horzcat(block, '/Vb/source'), 'GotoTag', 'LibraryTag');
                set_param(horzcat(block, '/Vc/source'), 'GotoTag', 'LibraryTag');
                set_param(horzcat(block, '/Ia/source'), 'GotoTag', 'LibraryTag');
                set_param(horzcat(block, '/Ib/source'), 'GotoTag', 'LibraryTag');
                set_param(horzcat(block, '/Ic/source'), 'GotoTag', 'LibraryTag');
            end % if
            return;
        end % if
        % 192 194
        SetTheOutputTypeParameter(block);
        % 194 196
        if strcmp(statut, 'UpdateGotoTag')
            tag = tempname;
            set_param(horzcat(block, '/source'), 'GotoTag', tag(minus(end, 7.0):end))
            tag = tempname;
            if strcmp(get_param(horzcat(block, '/Vb'), 'linkstatus'), 'resolved')
                set_param(horzcat(block, '/Vb'), 'linkstatus', 'inactive');
            end % if
            set_param(horzcat(block, '/Vb/source'), 'GotoTag', tag(minus(end, 7.0):end))
            tag = tempname;
            if strcmp(get_param(horzcat(block, '/Vc'), 'linkstatus'), 'resolved')
                set_param(horzcat(block, '/Vc'), 'linkstatus', 'inactive');
            end % if
            set_param(horzcat(block, '/Vc/source'), 'GotoTag', tag(minus(end, 7.0):end))
            tag = tempname;
            if strcmp(get_param(horzcat(block, '/Ia'), 'linkstatus'), 'resolved')
                set_param(horzcat(block, '/Ia'), 'linkstatus', 'inactive');
            end % if
            set_param(horzcat(block, '/Ia/source'), 'GotoTag', tag(minus(end, 7.0):end))
            tag = tempname;
            if strcmp(get_param(horzcat(block, '/Ib'), 'linkstatus'), 'resolved')
                set_param(horzcat(block, '/Ib'), 'linkstatus', 'inactive');
            end % if
            set_param(horzcat(block, '/Ib/source'), 'GotoTag', tag(minus(end, 7.0):end))
            tag = tempname;
            if strcmp(get_param(horzcat(block, '/Ic'), 'linkstatus'), 'resolved')
                set_param(horzcat(block, '/Ic'), 'linkstatus', 'inactive');
            end % if
            set_param(horzcat(block, '/Ic/source'), 'GotoTag', tag(minus(end, 7.0):end))
            mskenb = get_param(block, 'MaskEnables');
            if strcmp(get_param(block, 'PhasorSimulation'), 'on')
                mskenb{minus(end, 1.0)} = 'on';
            else
                mskenb{minus(end, 1.0)} = 'off';
            end % if
            set_param(block, 'MaskEnables', mskenb);
            set_param(block, 'PSBequivalent', '0');
        end % if
    case 'Measurement Block'
        % 233 237
        % 234 237
        % 235 237
        try
            get_param(horzcat(block, '/source'), 'Name');
        catch
            % 239 241
            % 240 242
            return;
        end % try
        SourceBlockType = get_param(horzcat(block, '/source'), 'BlockType');
        % 244 247
        % 245 247
        if strcmp(statut, 'VerifyPhasor') || isempty(statut)
            statut = 'UpdateGotoTag';
        end % if
        % 249 251
        if strcmp(SourceBlockType, 'From')
            CurrentTag = get_param(horzcat(block, '/source'), 'GotoTag');
            if IsLibrary
                if not(strcmp(CurrentTag, 'LibraryTag'))
                    set_param(horzcat(block, '/source'), 'GotoTag', 'LibraryTag');
                end % if
                return;
            end % if
            if strcmp(CurrentTag, 'LibraryTag')
                statut = 'UpdateGotoTag';
            end % if
        else
            if strcmp(statut, 'UpdateGotoTag')
                % 263 265
                replace_block(block, 'Followlinks', 'on', 'Name', 'source', 'built-in/From', 'noprompt');
            end % if
            if IsLibrary
                return;
            end % if
        end % if
        % 270 272
        SetTheOutputTypeParameter(block);
        % 272 274
        if strcmp(statut, 'UpdateGotoTag')
            % 274 276
            if strcmp(get_param(block, 'MaskType'), 'MultimeterPSB')
                tag = 'gotomultimeterPSB';
                set_param(horzcat(block, '/source'), 'GotoTag', tag);
                set_param(block, 'UserData', []);
            else
                tag = tempname;
                set_param(horzcat(block, '/source'), 'GotoTag', tag(minus(end, 7.0):end));
                % 282 284
                if strcmp(get_param(block, 'PhasorSimulation'), 'on')
                    set_param(block, 'MaskEnables', {'on','on','on'});
                else
                    set_param(block, 'MaskEnables', {'off','off','off'});
                end % if
            end % if
            % 289 291
            set_param(block, 'PSBequivalent', '0');
            % 291 295
            % 292 295
            % 293 295
            EquivalentModel = find_system(block, 'LookUnderMasks', 'on', 'FollowLinks', 'on', 'Name', 'EquivalentModel');
            if not(isempty(EquivalentModel))
                delete_block(horzcat(block, '/EquivalentModel'));
            end % if
            % 298 300
        end % if
    case 'StoreDataBlock'
        % 301 304
        % 302 304
        CurrentTag = get_param(horzcat(block, '/To Workspace'), 'VariableName');
        if strcmp(CurrentTag, 'LibraryTag')
            statut = 'UpdateVariableName';
        end % if
        % 307 310
        % 308 310
        switch statut
        case 'UpdateVariableName'
            set_param(horzcat(block, '/To Workspace'), 'VariableName', strrep(tempname, tempdir, ''));
        end % switch
    case 'ModelCloseFcn'
        % 314 318
        % 315 318
        % 316 318
        if not(strcmp(get_param(block, 'linkstatus'), 'inactive')) && not(strcmp(get_param(block, 'linkstatus'), 'implicit'))
            set_param(block, 'linkstatus', 'inactive');
        end % if
    case 'CloseFcn'
        % 321 324
        % 322 324
    end % switch
function SetTheOutputTypeParameter(block)
    % 325 327
    PowerguiInfo = getPowerguiInfo(bdroot(block));
    switch PowerguiInfo.Phasor
    case 1.0
        PhasorMode = 'on';
    case 0.0
        PhasorMode = 'off';
    end % switch
    try
        set_param(block, 'PhasorSimulation', PhasorMode);
        % 335 337
    end % try
