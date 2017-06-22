function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock;
    % 10 11
    pk = findpackage('hdlcoderprops');
    c = schema.class(pk, 'GlobalVerilog', pk.findclass('AbstractGlobalLanguage'));
    % 13 15
    % 14 15
    schema.prop(c, 'use_verilog_timescale', 'bool');
end % function
