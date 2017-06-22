function [hdlcomponentdecl, hdlcomponentinst, hdlcomponentconf] = hdlComponentDecl(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hdlcomponentdecl = [];
    hdlcomponentinst = [];
    hdlcomponentconf = [];
    % 12 14
    % 13 14
    if hdlgetparameter('isvhdl')
        entity_name = hdlentitytop;
        [hdlentityportstmt, hdlentityportdecls, hdlentityinst] = hdlentityports(entity_name);
        hdlcomponentdecl = horzcat(this.insertComment({'Component Declarations'}), '  COMPONENT ', entity_name, '\n', hdlentityportstmt, '  END COMPONENT;\n\n');
        % 18 22
        % 19 22
        % 20 22
        % 21 22
        hdlcomponentconf = horzcat(this.insertComment({'Component Configuration Statements'}), '  FOR ALL : ', entity_name, '\n', '    USE ENTITY work.', entity_name, '(rtl);\n\n');
    else
        % 24 25
        % 25 26
        module_name = hdlentitytop;
        [hdlentityportstmt, hdlentityportdecls, hdlentityinst] = hdlentityports(module_name);
    end % if
    % 29 30
    hdlcomponentinst = hdlentityinst;
end % function
