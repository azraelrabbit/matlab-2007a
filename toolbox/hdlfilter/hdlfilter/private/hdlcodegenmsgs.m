function s = hdlcodegenmsgs(id, latency)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if hdlgetparameter('isvhdl')
        tlang = 'VHDL';
        tentity = 'entity';
        tarch = 'architecture';
    else
        if hdlgetparameter('isverilog')
            tlang = 'Verilog';
            tentity = 'module';
            tarch = 'module body';
        else
            error(generatemsgid('UnknownTargetLanguage'), 'Unknown Target Language: %s', hdlgetparameter('target_language'));
        end % if
    end % if
    switch id
    case 1.0
        s = horzcat('### Starting ', tlang, ' code generation process for filter: ', hdlgetparameter('filter_name'));
    case 2.0
        splitentityarch = hdlgetparameter('split_entity_arch');
        if splitentityarch
            nname = hdlgetparameter('filter_name');
            entityfilename = horzcat(nname, hdlgetparameter('split_entity_file_postfix'), hdlgetparameter('filename_suffix'));
            % 29 32
            % 30 32
            archfilename = horzcat(nname, hdlgetparameter('split_arch_file_postfix'), hdlgetparameter('filename_suffix'));
            % 32 35
            % 33 35
            [pathstr, filename] = fileparts(fullfile(hdlgetparameter('codegendir'), entityfilename));
            entitynameforuser = fullfile(pathstr, entityfilename);
            if not(isempty(pathstr))
                whatstruct = what(pathstr);
                whatstruct = whatstruct(end);
                if not(isempty(whatstruct))
                    entitynameforuser = fullfile(whatstruct.path, entityfilename);
                end % if
            end % if
            [pathstr, filename] = fileparts(fullfile(hdlgetparameter('codegendir'), archfilename));
            archnameforuser = fullfile(pathstr, archfilename);
            if not(isempty(pathstr))
                whatstruct = what(pathstr);
                whatstruct = whatstruct(end);
                if not(isempty(whatstruct))
                    archnameforuser = fullfile(whatstruct.path, archfilename);
                end % if
            end % if
            s = horzcat('### Generating: <a href="matlab:edit(''', entitynameforuser, ''')">', entitynameforuser, '</a>', ' and <a href="matlab:edit(''', archnameforuser, ''')">', archnameforuser, '</a>');
        else
            % 54 56
            fullfilename = horzcat(hdlgetparameter('filter_name'), hdlgetparameter('filename_suffix'));
            [pathstr, filename] = fileparts(fullfile(hdlgetparameter('codegendir'), fullfilename));
            % 57 60
            % 58 60
            nameforuser = fullfile(pathstr, fullfilename);
            if not(isempty(pathstr))
                whatstruct = what(pathstr);
                whatstruct = whatstruct(end);
                if not(isempty(whatstruct))
                    nameforuser = fullfile(whatstruct.path, fullfilename);
                end % if
            end % if
            s = horzcat('### Generating: <a href="matlab:edit(''', nameforuser, ''')">', nameforuser, '</a>');
        end % if
    case 3.0
        s = horzcat('### Starting generation of ', hdlgetparameter('filter_name'), ' ', tlang, ' ', tentity);
    case 4.0
        s = horzcat('### Starting generation of ', hdlgetparameter('filter_name'), ' ', tlang, ' ', tarch);
    case 5.0
        s = '### First-order section';
    case 6.0
        s = '### Second-order section';
    case 7.0
        if lt(nargin, 2.0)
            latency = plus(plus(hdlgetparameter('filter_excess_latency'), double(hdlgetparameter('filter_registered_input'))), double(hdlgetparameter('filter_registered_output')));
            % 80 83
            % 81 83
        end % if
        s = horzcat(sprintf('### HDL latency is %d samples\n', latency), '### Successful completion of ', tlang, ' code generation process for filter: ', hdlgetparameter('filter_name'), sprintf('\n'));
        % 85 88
        % 86 88
    case 8.0
        % 87 89
        s = '### Integrator section';
    case 9.0
        s = '### Comb section';
    case 10.0
        s = '### Cascade stage';
    case 11.0
        s = '### ';
    end % switch
