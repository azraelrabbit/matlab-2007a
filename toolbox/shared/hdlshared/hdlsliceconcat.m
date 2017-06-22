function hdlbody = hdlsliceconcat(ins, slices, out)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if ne(length(ins), length(slices))
        error(hdlerrormsgid('badsizes'), 'Mismatched sizes: %d inputs signals but %d slices', length(ins), length(slices));
        % 16 18
        % 17 18
    end % if
    % 19 21
    % 20 21
    [assign_prefix, assign_op] = hdlassignforoutput(out);
    arrderef = hdlgetparameter('array_deref');
    if hdlgetparameter('isvhdl')
        startconcat = '';
        concatop = ' & ';
        endconcat = '';
    else
        startconcat = '{';
        concatop = ', ';
        endconcat = '}';
    end % if
    % 32 34
    % 33 34
    hdlbody = horzcat('  ', assign_prefix, hdlsignalname(out), ' ', assign_op, ' ');
    hdlbody = horzcat(hdlbody, startconcat);
    for ii=1.0:length(ins)
        name = hdlsignalname(ins(ii));
        tmpslices = slices{ii};
        if isempty(tmpslices)
            hdlbody = horzcat(hdlbody, name, concatop);
        else
            for jj=1.0:length(tmpslices)
                hdlbody = horzcat(hdlbody, name, arrderef(1.0), num2str(tmpslices(jj)), arrderef(2.0), concatop);
            end % for
        end % if
    end % for
    hdlbody = hdlbody(1.0:minus(end, length(concatop)));
    hdlbody = horzcat(hdlbody, endconcat, ';\n\n');
end % function
