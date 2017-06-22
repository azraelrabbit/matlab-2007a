function hdlwritepackage
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if hdlgetparameter('vhdl_package_required')
        createdate = datestr(now, 31.0);
        % 10 11
        hdlsetparameter('vhdl_package_comment', horzcat('----------------------------------------------------------------\n', '--\n', '-- Package: ', hdlgetparameter('vhdl_package_name'), '\n', '-- Created: ', createdate, '\n', hdlformatcomment(hdlgetparameter('rcs_cvs_tag')), '--\n', '----------------------------------------------------------------\n'));
        % 12 20
        % 13 20
        % 14 20
        % 15 20
        % 16 20
        % 17 20
        % 18 20
        % 19 20
        hdlsetparameter('vhdl_package_decl', horzcat('PACKAGE ', hdlgetparameter('vhdl_package_name'), ' IS\n\n'));
        % 21 22
        hdlsetparameter('vhdl_package_decl_end', horzcat('END ', hdlgetparameter('vhdl_package_name'), ';\n\n'));
        % 23 24
        hdlsetparameter('vhdl_package_body_decl', horzcat('PACKAGE BODY ', hdlgetparameter('vhdl_package_name'), ' IS\n\n'));
        % 25 26
        hdlsetparameter('vhdl_package_body_end', horzcat('END ', hdlgetparameter('vhdl_package_name'), ';\n\n'));
        % 27 29
        % 28 29
        vhdlpackage = horzcat(hdlgetparameter('vhdl_package_comment'), hdlgetparameter('vhdl_package_library'), hdlgetparameter('vhdl_package_decl'), hdlgetparameter('vhdl_package_type_defs'), hdlgetparameter('vhdl_package_constants'), hdlgetparameter('vhdl_package_function_headers'), hdlgetparameter('vhdl_package_decl_end'), hdlgetparameter('vhdl_package_body_decl'), hdlgetparameter('vhdl_package_functions'), hdlgetparameter('vhdl_package_body_end'));
        % 30 40
        % 31 40
        % 32 40
        % 33 40
        % 34 40
        % 35 40
        % 36 40
        % 37 40
        % 38 40
        % 39 40
        pkgname = fullfile(hdlgetparameter('codegendir'), horzcat(hdlgetparameter('vhdl_package_name'), hdlgetparameter('filename_suffix')));
        % 41 44
        % 42 44
        % 43 44
        pkgfid = fopen(pkgname, 'w');
        % 45 46
        if eq(pkgfid, -1.0)
            error(hdlerrormsgid('fileerror'), 'Cannot open file %s for writing', pkgname);
            % 48 49
        end % if
        % 50 51
        fprintf(pkgfid, vhdlpackage);
        fclose(pkgfid);
    end % if
end % function
