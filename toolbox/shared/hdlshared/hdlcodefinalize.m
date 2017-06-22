function [entitytext, archtext] = hdlcodefinalize(hdlcode)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    entitytext = '';
    archtext = '';
    % 12 13
    if not(isempty(hdlcode))
        entitytext = horzcat(hdlcode.entity_comment, hdlcode.entity_library, hdlcode.entity_package, hdlcode.entity_decl, hdlcode.entity_ports, hdlcode.entity_portdecls, hdlcode.entity_end);
        % 15 22
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        % 21 22
        archtext = horzcat(hdlcode.arch_comment, hdlcode.arch_decl, hdlcode.arch_component_decl, hdlcode.arch_component_config, hdlcode.arch_functions, hdlcode.arch_typedefs, hdlcode.arch_constants, hdlcode.arch_signals, hdlcode.arch_begin, hdlcode.arch_body_component_instances, hdlcode.arch_body_blocks, hdlcode.arch_body_output_assignments, hdlcode.arch_end);
        % 23 35
        % 24 35
        % 25 35
        % 26 35
        % 27 35
        % 28 35
        % 29 35
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        % 34 35
    end % if
    % 36 37
    if eq(nargout, 1.0)
        entitytext = horzcat(entitytext, archtext);
    end % if
end % function
